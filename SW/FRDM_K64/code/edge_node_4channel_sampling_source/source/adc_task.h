/*
 * adc_task.h
 *
 *  Created on: Feb 23, 2016
 *      Author: mortenopprudjakobsen
 */

#ifndef SOURCE_ADC_TASK_H_
#define SOURCE_ADC_TASK_H_

/* FreeRTOS kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"

#define NO_SAMPLES					8192		//4096 //1024
#define NO_SAMPLE_BYTES_PR_CHANNEL	2*NO_SAMPLES

//extern  uint8_t sample_buff_in_use;
//extern  uint8_t adcSamples0[2*NO_SAMPLES];
//extern  uint8_t adcSamples1[2*NO_SAMPLES];

/* ADC sampling format */
typedef struct
{
	unsigned short 	protocol_version;
	unsigned int	frameLength;
	unsigned int	sampleRate;

}adc_sample_config_t;

/* data payload */
typedef struct
{
	uint8_t		samples[4][NO_SAMPLE_BYTES_PR_CHANNEL] ;
	uint16_t	rpm;
	uint16_t	flags;
	uint16_t	msSinceLast;
}vibration_data_t;

typedef struct
{
	uint8_t	sampleBufferInUse;
	uint8_t	samplingOddChannels;
	unsigned int sampleIndex;
}sample_controller_t;

unsigned int getPayloadData(uint8_t * ptr);
unsigned int getBuffToUse(void);
void startSampling(void);
void adc_init(void);
void adc_task(void *pvParameters);
void init_trigger_source(uint32_t adcInstance);
uint16_t getRpm(void);


/* RTOS resources */
static volatile SemaphoreHandle_t xSemaphore = NULL;
static volatile QueueHandle_t sampleQhdl;

extern vibration_data_t analogSamples_0;
extern vibration_data_t analogSamples_1;




#endif /* SOURCE_ADC_TASK_H_ */
