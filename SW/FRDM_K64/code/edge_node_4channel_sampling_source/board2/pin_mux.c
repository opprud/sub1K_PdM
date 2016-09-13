/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "fsl_common.h"
#include "fsl_port.h"
#include "pin_mux.h"
#include "board.h"
#include "hardware.h"

/*******************************************************************************
 * Code
 ******************************************************************************/
void BOARD_InitPins(void) {
	port_pin_config_t configENET = { 0 };
	gpio_pin_config_t pinCfg;

	/* Initialize UART0 pins below */
	/* Ungate the port clock */
	/* Ungate the port clock */
	CLOCK_EnableClock(kCLOCK_PortB);
	/* Affects PORTB_PCR16 register */
	PORT_SetPinMux(PORTB, 16u, kPORT_MuxAlt3);
	/* Affects PORTB_PCR17 register */
	PORT_SetPinMux(PORTB, 17u, kPORT_MuxAlt3);

	CLOCK_EnableClock(kCLOCK_PortC);
	/* Affects PORTC_PCR16 register */
	PORT_SetPinMux(PORTC, 16u, kPORT_MuxAlt4);
	/* Affects PORTC_PCR17 register */
	PORT_SetPinMux(PORTC, 17u, kPORT_MuxAlt4);
	/* Affects PORTC_PCR18 register */
	PORT_SetPinMux(PORTC, 18u, kPORT_MuxAlt4);
	/* Affects PORTC_PCR19 register */
	PORT_SetPinMux(PORTC, 19u, kPORT_MuxAlt4);
	/* Affects PORTB_PCR1 register */
	PORT_SetPinMux(PORTB, 1u, kPORT_MuxAlt4);


	/** ethernet configuration **/
	configENET.openDrainEnable = kPORT_OpenDrainEnable;
	configENET.mux = kPORT_MuxAlt4;
	configENET.pullSelect = kPORT_PullUp;
	/* Ungate the port clock */
	CLOCK_EnableClock(kCLOCK_PortA);
	/* Affects PORTB_PCR0 register */
	PORT_SetPinConfig(PORTB, 0u, &configENET);

	/* Affects PORTA_PCR13 register */
	PORT_SetPinMux(PORTA, 13u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR12 register */
	PORT_SetPinMux(PORTA, 12u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR14 register */
	PORT_SetPinMux(PORTA, 14u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR5 register */
	PORT_SetPinMux(PORTA, 5u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR16 register */
	PORT_SetPinMux(PORTA, 16u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR17 register */
	PORT_SetPinMux(PORTA, 17u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR15 register */
	PORT_SetPinMux(PORTA, 15u, kPORT_MuxAlt4);
	/* Affects PORTA_PCR28 register */
	PORT_SetPinMux(PORTA, 28u, kPORT_MuxAlt4);

	/** debug pins **/
	pinCfg.pinDirection = kGPIO_DigitalOutput;
	CLOCK_EnableClock(kCLOCK_PortE);
	PORT_SetPinMux(PORTE, 24U, kPORT_MuxAsGpio);
	GPIO_PinInit(GPIOE, 24U, &pinCfg);	//D15
	PORT_SetPinMux(PORTE, 25U, kPORT_MuxAsGpio);
	GPIO_PinInit(GPIOE, 25U, &pinCfg);	//D14

	/* Ungate the port clock */
	CLOCK_EnableClock(kCLOCK_PortD);

	/* Digital output pins */
	PORT_SetPinMux(DIG_OUT_RED_PORT, DIG_OUT_RED_PIN, kPORT_MuxAsGpio);
	GPIO_PinInit(  DIG_OUT_RED_GPIO, DIG_OUT_RED_PIN, &pinCfg);

	PORT_SetPinMux(DIG_OUT_YELLOW_PORT, DIG_OUT_YELLOW_PIN, kPORT_MuxAsGpio);
	GPIO_PinInit(  DIG_OUT_YELLOW_GPIO, DIG_OUT_YELLOW_PIN, &pinCfg);

	PORT_SetPinMux(DIG_OUT_GREEN_PORT, DIG_OUT_GREEN_PIN, kPORT_MuxAsGpio);
	GPIO_PinInit(  DIG_OUT_GREEN_GPIO, DIG_OUT_GREEN_PIN, &pinCfg);

	/* Initialize RGB LED pins below */
	/* Led pin mux Configuration */
	PORT_SetPinMux(PORTB, 22U, kPORT_MuxAsGpio);
	PORT_SetPinMux(PORTE, 26U, kPORT_MuxAsGpio);
	PORT_SetPinMux(PORTB, 21U, kPORT_MuxAsGpio);

	LED_RED_INIT(1U);
	LED_GREEN_INIT(1U);
	LED_BLUE_INIT(1U);

	/* digital inputs  */

}
