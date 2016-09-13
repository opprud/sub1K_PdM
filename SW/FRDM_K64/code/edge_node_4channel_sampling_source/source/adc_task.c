/*
 * adc_task.c
 *
 *  Created on: Feb 23, 2016
 *      Author: mortenopprudjakobsen
 */

#include <string.h>

#include "hardware.h"
#include "board.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_debug_console.h"
#include "fsl_adc16.h"
#include "adc_task.h"
#include "fsl_pit.h"
#include "clock_config.h"

#include "fsl_lptmr.h"
#include "fsl_gpio.h"
#include "fsl_port.h"
#include "fsl_common.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define PIT_SOURCE_CLOCK CLOCK_GetFreq(kCLOCK_BusClk)

/*******************************************************************************
 * module variables
 ******************************************************************************/
/* sample control counters */
sample_controller_t ctrl;

/* module global sample buffers */
vibration_data_t analogSamples_0;
vibration_data_t analogSamples_1;

/* misc variables */
volatile uint32_t rpmTicksOld, rpmTicksNow;
//static adc16_channel_config_t adc16ChannelConfigStruct;


/*!
 * @brief Interrupt service fuction of switch.
 *
 * This function toggles the LED
 */
void PORTA_IRQHandler(void)
{
	/* Clear external interrupt flag. */
	GPIO_ClearPinsInterruptFlags(BOARD_SW_GPIO, 1U << BOARD_SW_GPIO_PIN);
	//GPIO_ClearPinsInterruptFlags(GPIOA, 1U << RPM_PIN);

	rpmTicksOld = rpmTicksNow;
	rpmTicksNow = LPTMR_GetCurrentTimerCount(LPTMR0);
	GPIO_TogglePinsOutput(BOARD_LED_GPIO, 1U << BOARD_LED_GPIO_PIN);

}

/*
 * Calaculate RPM based on ms measured by timer
 * */
uint16_t getRpm(void)
{
	uint16_t rpmx10;
	uint32_t c, d;

	c = CLOCK_GetFreq(kCLOCK_LpoClk);
	d = rpmTicksNow - rpmTicksOld;

	rpmx10 = (uint16_t) ((float) 10 * c / (float) d);
//	rpmx10 = (uint16_t) ((10 * c) / d);

	if (rpmx10 > MAX_RPM)
		rpmx10 = MAX_RPM;
	if (rpmx10 < MIN_RPM)
		rpmx10 = 0;

	return rpmx10;
}

unsigned int getBuffToUse(void)
{
	if (ctrl.sampleBufferInUse == 1)
		return 0;
	else
		return 1;
}
/*
 * Get pointer to the sample data availible data
 * */
unsigned int getPayloadData(uint8_t * ptr)
{
	if (ctrl.sampleBufferInUse == 1)
	{
		analogSamples_0.rpm = getRpm();
		analogSamples_0.flags = (1 << 0);	//sample buffer set
		//analogSamples_0.tlgSize = sizeof(analogSamples_0);
		ptr = &analogSamples_0.samples[0][0];
	}
	else
	{
		analogSamples_1.rpm = getRpm();
		analogSamples_1.flags = (1 << 1);	//sample buffer set
		//analogSamples_1.tlgSize = sizeof(analogSamples_1);
		ptr = &analogSamples_1.samples[0][0];
	}
	return 0;
	//return analogSamples_0.tlgSize;
}

/* periodic interrupt timer
 * in this interrupt we assume AD conversion to be completed */
void PIT0_IRQHandler(void)
{
	static adc16_channel_config_t chanConf;

	short val0;
	short val1;
	uint16_t timeNow;

	/////DEBUG
	//GPIO_TogglePinsOutput(GPIOE, 1U << 24);
	//ctrl.sampleBufferInUse = 0;
	/////DEBUG !

	/* read ADC's */
	val0 = ADC16_GetChannelConversionValue(ADC0, 0);
	val1 = ADC16_GetChannelConversionValue(ADC1, 0);

	/* if we just read odd channels*/
	if(ctrl.samplingOddChannels  == 1)
	{
		/* setup even channels for next run*/
		ctrl.samplingOddChannels = 0;
		/*start ADC0 again */
		chanConf.channelNumber = ACC_CHANNEL0;
		chanConf.enableInterruptOnConversionCompleted = false;
		chanConf.enableDifferentialConversion = false;
		ADC16_SetChannelConfig(ADC0, 0, &chanConf);

		/*start ADC1 again */
		chanConf.channelNumber = ACC_CHANNEL2;
		chanConf.enableInterruptOnConversionCompleted = false;
		chanConf.enableDifferentialConversion = false;
		ADC16_SetChannelConfig(ADC1, 0, &chanConf);
		/* slice data into 8 byte size */
		if (ctrl.sampleBufferInUse == 0)
		{
			analogSamples_0.samples[1][ctrl.sampleIndex] 	 = (uint8_t) (val0 & 0x00ff);
			analogSamples_0.samples[1][ctrl.sampleIndex + 1] = (uint8_t) ((val0 >> 8) & 0x00ff);
			analogSamples_0.samples[3][ctrl.sampleIndex] 	 = (uint8_t) (val1 & 0x00ff);
			analogSamples_0.samples[3][ctrl.sampleIndex + 1] = (uint8_t) ((val1 >> 8) & 0x00ff);
		}
		else
		{
			analogSamples_1.samples[1][ctrl.sampleIndex] 	 = (uint8_t) (val0 & 0x00ff);
			analogSamples_1.samples[1][ctrl.sampleIndex + 1] = (uint8_t) ((val0 >> 8) & 0x00ff);
			analogSamples_1.samples[3][ctrl.sampleIndex] 	 = (uint8_t) (val1 & 0x00ff);
			analogSamples_1.samples[3][ctrl.sampleIndex + 1] = (uint8_t) ((val1 >> 8) & 0x00ff);
		}
		/* a 16 bit ADC read takes up 2 bytes, increment after sampling odd channels, since they are last... */
		ctrl.sampleIndex += 2;
	}
	/* otherwise we just read even channels*/
	else
	{
		/* setup odd channels*/
		ctrl.samplingOddChannels = 1;
		/*start ADC0 again */
		chanConf.channelNumber = ACC_CHANNEL1;
		chanConf.enableInterruptOnConversionCompleted = false;
		chanConf.enableDifferentialConversion = false;
		ADC16_SetChannelConfig(ADC0, 0, &chanConf);

		/*start ADC1 again */
		chanConf.channelNumber = ACC_CHANNEL3;
		chanConf.enableInterruptOnConversionCompleted = false;
		chanConf.enableDifferentialConversion = false;
		ADC16_SetChannelConfig(ADC1, 0, &chanConf);
		/* slice data into 8 byte size */
		if (ctrl.sampleBufferInUse == 0)
		{
			analogSamples_0.samples[0][ctrl.sampleIndex] 	 = (uint8_t) (val0 & 0x00ff);
			analogSamples_0.samples[0][ctrl.sampleIndex + 1] = (uint8_t) ((val0 >> 8) & 0x00ff);
			analogSamples_0.samples[2][ctrl.sampleIndex] 	 = (uint8_t) (val1 & 0x00ff);
			analogSamples_0.samples[2][ctrl.sampleIndex + 1] = (uint8_t) ((val1 >> 8) & 0x00ff);
		}
		else
		{
			analogSamples_1.samples[0][ctrl.sampleIndex] 	 = (uint8_t) (val0 & 0x00ff);
			analogSamples_1.samples[0][ctrl.sampleIndex + 1] = (uint8_t) ((val0 >> 8) & 0x00ff);
			analogSamples_1.samples[2][ctrl.sampleIndex] 	 = (uint8_t) (val1 & 0x00ff);
			analogSamples_1.samples[2][ctrl.sampleIndex + 1] = (uint8_t) ((val1 >> 8) & 0x00ff);
		}
}

	/* buffer is full, notify and update */
	if (ctrl.sampleIndex >= NO_SAMPLE_BYTES_PR_CHANNEL)
	{
		GPIO_TogglePinsOutput(GPIOE, 1U << 25);
		LED_GREEN_TOGGLE();

		timeNow = LPTMR_GetCurrentTimerCount(LPTMR0);
		/* reset sample cnt */
		ctrl.sampleIndex = 0;
		/* switch working sample buffer */
		if (ctrl.sampleBufferInUse == 0)
		{
			/* calculate time since last */
			analogSamples_0.msSinceLast = COUNT_TO_MSEC(timeNow - analogSamples_1.msSinceLast, CLOCK_GetFreq(kCLOCK_LpoClk));
			ctrl.sampleBufferInUse = 1;

		}
		else
		{
			/* calculate time since last */
			analogSamples_1.msSinceLast = COUNT_TO_MSEC(timeNow - analogSamples_0.msSinceLast, CLOCK_GetFreq(kCLOCK_LpoClk));
			ctrl.sampleBufferInUse = 0;
		}
	}

	/* Clear timer interrupt flag.*/
	PIT_ClearStatusFlags(PIT, kPIT_Chnl_0, PIT_TFLG_TIF_MASK);
}

void startSampling(void)
{
	/* !IMPORTANT !
	 * set priority to allow OS function from within interrupt*/
	//NVIC_SetPriority(PIT0_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
	EnableIRQ(PIT0_IRQn);
	//NVIC_SetPriority(ADC0_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
	//EnableIRQ(ADC0_IRQn);

	/* Start channel 0 */
	PRINTF("\r\nStarting channel No.0 ...");
	PIT_StartTimer(PIT, kPIT_Chnl_0);
}

void stopSampling(void)
{
	PIT_StopTimer(PIT, kPIT_Chnl_0);
}

/*!
 * @Brief enable the trigger source of PIT0, chn0
 */
void init_trigger_source(uint32_t adcInstance)
{
	//uint32_t freqUs;

	//freqUs = 1000000U / NO_SAMPLES;
	/* Structure of initialize PIT */
	pit_config_t pitConfig;
	/*pitConfig.enableRunInDebug = false; */
	PIT_GetDefaultConfig(&pitConfig);
	/* Init pit module */
	PIT_Init(PIT, &pitConfig);
	/* Set timer period for channel 0 */
//	PIT_SetTimerPeriod(PIT, kPIT_Chnl_0, USEC_TO_COUNT(50, PIT_SOURCE_CLOCK));//=Fs20KHz
	PIT_SetTimerPeriod(PIT, kPIT_Chnl_0, USEC_TO_COUNT(25, PIT_SOURCE_CLOCK));//=Fs40KHz
	/* Enable timer interrupts for channel 0 */
	PIT_EnableInterrupts(PIT, kPIT_Chnl_0, kPIT_TimerInterruptEnable);
}

/*!
 * @brief Task responsible for initializing ADCs 0 and 1
 */
void adc_init(void)
{
	adc16_config_t adc16ConfigStruct;
	adc16_channel_config_t adc16ChannelConfigStruct;


	/*
	 * adc16ConfigStruct.referenceVoltageSource = kADC16_ReferenceVoltageSourceVref;
	 * adc16ConfigStruct.clockSource = kADC16_ClockSourceAsynchronousClock;
	 * adc16ConfigStruct.enableAsynchronousClock = true;
	 * adc16ConfigStruct.clockDivider = kADC16_ClockDivider8;
	 * adc16ConfigStruct.resolution = kADC16_ResolutionSE12Bit;
	 * adc16ConfigStruct.longSampleMode = kADC16_LongSampleDisabled;
	 * adc16ConfigStruct.enableHighSpeed = false;
	 * adc16ConfigStruct.enableLowPower = false;
	 * adc16ConfigStruct.enableContinuousConversion = false;
	 */
	ADC16_GetDefaultConfig(&adc16ConfigStruct);

	/* run continiously*/
	//adc16ConfigStruct.longSampleMode = kADC16_LongSampleCycle16; //attempt to get better SNR
	adc16ConfigStruct.longSampleMode = kADC16_LongSampleCycle10;
	adc16ConfigStruct.clockDivider =kADC16_ClockDivider1;
	adc16ConfigStruct.resolution = kADC16_ResolutionSE16Bit;

	/*
	 * now init ADC0
	 * */
	ADC16_Init(ADC0, &adc16ConfigStruct);
	ADC16_EnableHardwareTrigger(ADC0, false);
	ADC16_SetHardwareAverage(ADC0,kADC16_HardwareAverageCount4);

	if (kStatus_Success == ADC16_DoAutoCalibration(ADC0))
	{
		PRINTF("ADC16_DoAutoCalibration0() Done.\r\n");
	}

	/* run first conversion */
	adc16ChannelConfigStruct.channelNumber = ACC_CHANNEL1;//can also be ACC_CHANNEL2
//	adc16ChannelConfigStruct.channelNumber = ACC_CHANNEL1;//can also be ACC_CHANNEL2
	adc16ChannelConfigStruct.enableDifferentialConversion = false;
	ADC16_SetChannelConfig(ADC0, 0, &adc16ChannelConfigStruct);

#if 1
	/*
	 * now init ADC1 with same settings
	 * */
	ADC16_Init(ADC1, &adc16ConfigStruct);
	ADC16_EnableHardwareTrigger(ADC1, false);
	ADC16_SetHardwareAverage(ADC1,kADC16_HardwareAverageCount4);

	if (kStatus_Success == ADC16_DoAutoCalibration(ADC1))
	{
		PRINTF("ADC16_DoAutoCalibration1() Done.\r\n");
	}

	/* run first conversion */
	adc16ChannelConfigStruct.channelNumber = ACC_CHANNEL3;//can also be ACC_CHANNEL4
	adc16ChannelConfigStruct.enableDifferentialConversion = false;
	ADC16_SetChannelConfig(ADC1, 0, &adc16ChannelConfigStruct);
#endif
}

void rpmInit(void)
{
	lptmr_config_t lptmrConfig;

	/* Define the init structure for the input switch pin */
	gpio_pin_config_t sw_config =
	{ kGPIO_DigitalInput, 0, };

	/*  configure PI IRQ */
	/* Init input switch GPIO. */
	/* Affects PORTA_PCR4 register */
	port_pin_config_t config =
	{ 0 };
	config.pullSelect = kPORT_PullUp;
	config.mux = kPORT_MuxAsGpio;
	PORT_SetPinConfig(RPM_PORT, RPM_PIN, &config);

	PORT_SetPinInterruptConfig(RPM_PORT, RPM_PIN, kPORT_InterruptFallingEdge);
	EnableIRQ(RPM_IRQ);
	GPIO_PinInit(RPM_GPIO, RPM_PIN, &sw_config);

	/*enable timer to count mSec*/
	LPTMR_GetDefaultConfig(&lptmrConfig);
	lptmrConfig.enableFreeRunning = true;

	/* Initialize the LPTMR */
	LPTMR_Init(LPTMR0, &lptmrConfig);

	/* Start counting */
	LPTMR_StartTimer(LPTMR0);

}

/*!
 * @brief Task responsible for printing of "Hello world." message.
 */
void adc_task(void *pvParameters)
{

	/* setup ADC*/
	adc_init();
	/* and trigger timer */
	init_trigger_source(1);

	/* full buffers 0 initially, at pos[0], at buff 0 & 2 */
	ctrl.sampleBufferInUse = 0;
	ctrl.sampleIndex = 0;
	ctrl.samplingOddChannels = 0;

	/* setup RPM meas */
	rpmInit();
	vTaskDelay(400);
	startSampling();

	for (;;)
	{

		vTaskDelay(200);
		LED_BLUE_TOGGLE();
	}

}

