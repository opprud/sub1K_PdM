################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/boards/frdmk64f/demo_apps/lwip/lwip_tcpecho/freertos/lwip_tcpecho_freertos.c 

OBJS += \
./source/lwip_tcpecho_freertos.o 

C_DEPS += \
./source/lwip_tcpecho_freertos.d 


# Each subdirectory must supply rules for building sources it contributes
source/lwip_tcpecho_freertos.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/boards/frdmk64f/demo_apps/lwip/lwip_tcpecho/freertos/lwip_tcpecho_freertos.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


