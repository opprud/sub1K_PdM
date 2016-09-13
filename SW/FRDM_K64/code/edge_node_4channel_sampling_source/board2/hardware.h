/*
 * hardware.h
 *
 *  Created on: Apr 9, 2016
 *      Author: mortenjakobsen
 */

#ifndef BOARD2_HARDWARE_H_
#define BOARD2_HARDWARE_H_

/* ADC channels */
#define ACC_CHANNEL0		12//PTB2	- ADC0_SE12
#define ACC_CHANNEL1		13//PTB3	- ADC0_SE13
#define ACC_CHANNEL2		14//PTB10	- ADC1_SE14
#define ACC_CHANNEL3		15//PTB11	- ADC1_SE15
#define VREF_CHANNEL		 6//PTC10	- ADC1_SE6b

/* digital outputs */
#define DIG_OUT_RED_PIN		0//PTA0
#define DIG_OUT_RED_PORT	PORTA
#define DIG_OUT_RED_GPIO	GPIOA
#define DIG_OUT_YELLOW_PIN	4//PTC4
#define DIG_OUT_YELLOW_PORT	PORTC
#define DIG_OUT_YELLOW_GPIO	GPIOC
#define DIG_OUT_GREEN_PIN	0//PTD0
#define DIG_OUT_GREEN_PORT	PORTD
#define DIG_OUT_GREEN_GPIO	GPIOD


/* digital inputs */
#define RPM_PIN				17//PTC17
#define RPM_PORT			PORTC
#define RPM_GPIO			GPIOC
#define RPM_IRQ				PORTC_IRQn


/* RPM defines */
#define MAX_RPM				10000	// equals /10 = 1000RPM
#define MIN_RPM				5	// equals /10 = 0.5RPM



/* clean up.... */
#define BOARD_SW_GPIO 		BOARD_SW3_GPIO
#define BOARD_SW_PORT 		BOARD_SW3_PORT
#define BOARD_SW_GPIO_PIN 	2//BOARD_SW3_GPIO_PIN//4
#define BOARD_SW_IRQ 		BOARD_SW3_IRQ
#define BOARD_LED_GPIO 		BOARD_LED_RED_GPIO
#define BOARD_LED_GPIO_PIN 	BOARD_LED_RED_GPIO_PIN



#endif /* BOARD2_HARDWARE_H_ */
