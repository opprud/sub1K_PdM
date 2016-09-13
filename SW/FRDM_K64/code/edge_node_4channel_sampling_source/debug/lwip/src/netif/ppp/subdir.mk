################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/auth.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/chap.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/chpms.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/fsm.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ipcp.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/lcp.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/magic.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/pap.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ppp.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ppp_md5.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ppp_oe.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/randm.c \
/Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/vj.c 

OBJS += \
./lwip/src/netif/ppp/auth.o \
./lwip/src/netif/ppp/chap.o \
./lwip/src/netif/ppp/chpms.o \
./lwip/src/netif/ppp/fsm.o \
./lwip/src/netif/ppp/ipcp.o \
./lwip/src/netif/ppp/lcp.o \
./lwip/src/netif/ppp/magic.o \
./lwip/src/netif/ppp/pap.o \
./lwip/src/netif/ppp/ppp.o \
./lwip/src/netif/ppp/ppp_md5.o \
./lwip/src/netif/ppp/ppp_oe.o \
./lwip/src/netif/ppp/randm.o \
./lwip/src/netif/ppp/vj.o 

C_DEPS += \
./lwip/src/netif/ppp/auth.d \
./lwip/src/netif/ppp/chap.d \
./lwip/src/netif/ppp/chpms.d \
./lwip/src/netif/ppp/fsm.d \
./lwip/src/netif/ppp/ipcp.d \
./lwip/src/netif/ppp/lcp.d \
./lwip/src/netif/ppp/magic.d \
./lwip/src/netif/ppp/pap.d \
./lwip/src/netif/ppp/ppp.d \
./lwip/src/netif/ppp/ppp_md5.d \
./lwip/src/netif/ppp/ppp_oe.d \
./lwip/src/netif/ppp/randm.d \
./lwip/src/netif/ppp/vj.d 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/netif/ppp/auth.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/auth.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/chap.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/chap.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/chpms.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/chpms.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/fsm.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/fsm.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/ipcp.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ipcp.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/lcp.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/lcp.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/magic.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/magic.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/pap.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/pap.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/ppp.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ppp.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/ppp_md5.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ppp_md5.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/ppp_oe.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/ppp_oe.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/randm.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/randm.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lwip/src/netif/ppp/vj.o: /Users/mortenjakobsen/workspace/kinetis/SDK2_0/middleware/lwip_1.4.1/src/netif/ppp/vj.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK64FN1M0VMD12 -DUSE_RTOS=1 -DFSL_RTOS_FREE_RTOS -DFRDM_K64F -DFREEDOM -I../../../../../../../../rtos/freertos_8.2.3/Source/portable/GCC/ARM_CM4F -I../../../../../../../../rtos/freertos_8.2.3/Source/include -I../ -I../../../../../../../../CMSIS/Include -I../../../../../../../../devices -I../../../../../../../../devices/MK64F12/drivers -I../.. -I../../../../../../../../devices/MK64F12/utilities -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/board2" -I"/Users/mortenjakobsen/workspace/kinetis/lwip_tcpecho_freertos_frdmk64f_2/source2" -I../../../../../../../../middleware/lwip_1.4.1 -I../../../../../../../../middleware/lwip_1.4.1/port -I../../../../../../../../middleware/lwip_1.4.1/port/arch -I../../../../../../../../middleware/lwip_1.4.1/src -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../../../../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/lwip -I../../../../../../../../middleware/lwip_1.4.1/src/include/netif -I../../../../../../../../middleware/lwip_1.4.1/src/include/posix -I../../../../../../../../middleware/lwip_1.4.1/src/include -I../../../../../../../../rtos/freertos_8.2.3/Source -I../../../../../.. -I../../../../../../../../devices/MK64F12 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


