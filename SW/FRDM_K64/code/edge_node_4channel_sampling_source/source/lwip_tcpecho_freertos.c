/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */

/* Application Included Files */
#include "echo.h"

#include "lwip/opt.h"
//#include "../lwip/src/include/opt.h"

#if LWIP_NETCONN
/* Standard C Included Files */
#include <stdio.h>
/* lwip Included Files */
#include "lwip/netif.h"
#include "lwip/sys.h"
#include "lwip/api.h"
#include "lwip/tcpip.h"
#include "netif/etharp.h"
/* SDK Included Files */
#include "ethernetif.h"
#include "board.h"
#include "adc_task.h"

/*******************************************************************************
 * Variables
 ******************************************************************************/

struct netif fsl_netif0;

#include "fsl_device_registers.h"
#include "pin_mux.h"
#include "clock_config.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/

#define EXAMPLE_ENET ENET

/* IP address configuration. */
#define configIP_ADDR0 192
#define configIP_ADDR1 168
#define configIP_ADDR2 1
#define configIP_ADDR3 102

/* Netmask configuration. */
#define configNET_MASK0 255
#define configNET_MASK1 255
#define configNET_MASK2 255
#define configNET_MASK3 0

/* Default gateway address configuration */
#define configGW_ADDR0 192
#define configGW_ADDR1 168
#define configGW_ADDR2 1
#define configGW_ADDR3 100

#define configPHY_ADDRESS 1
#ifndef TCPECHO_DBG
#define TCPECHO_DBG LWIP_DBG_ON
#endif

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/
static void tcpdata_thread(void *arg)
{
	struct netconn *conn, *newconn;
	err_t err;
	uint16_t rpm;
	uint8_t tx[2];

	LWIP_UNUSED_ARG(arg);
	netif_set_up(&fsl_netif0);
	// Create a new connection identifier
	conn = netconn_new(NETCONN_TCP);

	// Bind connection to well known port number 7
	netconn_bind(conn, NULL, 7);

	// Tell connection to go into listening mode
	netconn_listen(conn);

	while (1)
	{

		/* Grab new connection. */
		err = netconn_accept(conn, &newconn);
		/* Process the new connection. */
		if (err == ERR_OK)
		{
			struct netbuf *buf;
			void *data;
			unsigned int len;
			char cmd[40];
			unsigned int buffToUse;
			uint8_t * payload_ptr;

			while ((err = netconn_recv(newconn, &buf)) == ERR_OK)
			{
				do
				{
//					GPIO_TogglePinsOutput(GPIOE, 1U << 24);
					/*debug*/
					//GPIO_WritePinOutput(GPIOE,24,1);
					netbuf_data(buf, &data, &len);
					strcpy(cmd, data);

					if (!strcmp(cmd, "GET_SAMPLES"))
					{
						GPIO_TogglePinsOutput(GPIOE, 1U << 24);

						/*  return rotational frequency in [Hz] x10  */
/*
						len = 2;
						rpm = getRpm();
						//rpm = 0x1122;
						tx[0] = (uint8_t) (rpm & 0xff);
						tx[1] = (uint8_t) ((rpm >> 8) & 0xff);
*/
						len = 65542;
						//len = 65544;

						//len = getPayloadData(payload_ptr);

						LED_RED_TOGGLE();
						if(getBuffToUse() == 1)
						//if(1)
						{
							payload_ptr = (uint8_t*)&analogSamples_0.samples[0][0];
						}
						else
						{
							payload_ptr = (uint8_t*)&analogSamples_1.samples[0][0];
						}
						err = netconn_write(newconn, payload_ptr, len, NETCONN_COPY);

					}

					if (!strcmp(cmd, "GET_ROT_SPEED"))
					{
						LED_RED_TOGGLE();
						/*  return rotational frequency in [Hz] x10  */
						len = 2;
						rpm = getRpm();
						//rpm = 0x1122;
						tx[0] = (uint8_t) (rpm & 0xff);
						tx[1] = (uint8_t) ((rpm >> 8) & 0xff);

						payload_ptr = (uint8_t*)&analogSamples_0.samples[0][0];
//						len = 65544;
						len = 2*4096;
//						err = netconn_write(newconn, tx, len, NETCONN_COPY);
						err = netconn_write(newconn, payload_ptr, len, NETCONN_COPY);
					}

					/*debug*/
					//GPIO_WritePinOutput(GPIOE,24,0);

				} while (netbuf_next(buf) >= 0);
				netbuf_delete(buf);
			}
			/* Close connection and discard connection identifier. */
			netconn_close(newconn);
			netconn_delete(newconn);
		}
	}
}

void tcpecho_init(void)
{
	//sys_thread_new("tcpecho_thread", tcpecho_thread, NULL, TCPECHO_STACKSIZE, TCPECHO_PRIORITY);
	sys_thread_new("tcpdata_thread", tcpdata_thread, NULL, TCPECHO_STACKSIZE,
			TCPECHO_PRIORITY);
	sys_thread_new("adc", adc_task, NULL, 512, TCPECHO_PRIORITY);
	vTaskStartScheduler();
}

/*!
 * @brief Main function
 */
int main(void)
{
	ip_addr_t fsl_netif0_ipaddr, fsl_netif0_netmask, fsl_netif0_gw;

	MPU_Type *base = MPU;
	BOARD_InitPins();
	BOARD_BootClockRUN();
	BOARD_InitDebugConsole();
	/* Disable MPU. */
	base->CESR &= ~MPU_CESR_VLD_MASK;

	LWIP_DEBUGF(TCPECHO_DBG, ("TCP/IP initializing....\r\n"));
	tcpip_init(NULL, NULL);
	LWIP_DEBUGF(TCPECHO_DBG, ("TCP/IP initializing...\r\n"));

	IP4_ADDR(&fsl_netif0_ipaddr, configIP_ADDR0, configIP_ADDR1, configIP_ADDR2,
			configIP_ADDR3);
	IP4_ADDR(&fsl_netif0_netmask, configNET_MASK0, configNET_MASK1,
			configNET_MASK2, configNET_MASK3);
	IP4_ADDR(&fsl_netif0_gw, configGW_ADDR0, configGW_ADDR1, configGW_ADDR2,
			configGW_ADDR3);
	netif_add(&fsl_netif0, &fsl_netif0_ipaddr, &fsl_netif0_netmask,
			&fsl_netif0_gw, NULL, ethernetif_init, tcpip_input);
	netif_set_default(&fsl_netif0);

	LWIP_PLATFORM_DIAG(
			("\r\n************************************************"));
	LWIP_PLATFORM_DIAG((" TCP Echo example MOJ6 _ BUFF 8K"));
	LWIP_PLATFORM_DIAG(("************************************************"));
	LWIP_PLATFORM_DIAG(
			(" IPv4 Address     : %u.%u.%u.%u", ((u8_t *)&fsl_netif0_ipaddr)[0], ((u8_t *)&fsl_netif0_ipaddr)[1], ((u8_t *)&fsl_netif0_ipaddr)[2], ((u8_t *)&fsl_netif0_ipaddr)[3]));
	LWIP_PLATFORM_DIAG(
			(" IPv4 Subnet mask : %u.%u.%u.%u", ((u8_t *)&fsl_netif0_netmask)[0], ((u8_t *)&fsl_netif0_netmask)[1], ((u8_t *)&fsl_netif0_netmask)[2], ((u8_t *)&fsl_netif0_netmask)[3]));
	LWIP_PLATFORM_DIAG(
			(" IPv4 Gateway     : %u.%u.%u.%u", ((u8_t *)&fsl_netif0_gw)[0], ((u8_t *)&fsl_netif0_gw)[1], ((u8_t *)&fsl_netif0_gw)[2], ((u8_t *)&fsl_netif0_gw)[3]));
	LWIP_PLATFORM_DIAG(("************************************************"));

	tcpecho_init();
	/* should not reach this statement */
	for (;;)
		;
}
#endif /* LWIP_NETCONN */
