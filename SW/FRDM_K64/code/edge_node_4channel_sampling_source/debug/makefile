################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include utilities/subdir.mk
-include startup/subdir.mk
-include source/subdir.mk
-include lwip/src/netif/ppp/subdir.mk
-include lwip/src/netif/subdir.mk
-include lwip/src/core/snmp/subdir.mk
-include lwip/src/core/ipv4/subdir.mk
-include lwip/src/core/subdir.mk
-include lwip/src/api/subdir.mk
-include lwip/port/subdir.mk
-include freertos/portable/subdir.mk
-include freertos/subdir.mk
-include drivers/subdir.mk
-include board/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: lwip_tcpecho_freertos_frdmk64f_2.elf secondary-outputs

# Tool invocations
lwip_tcpecho_freertos_frdmk64f_2.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross ARM C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -T ../MK64FN1M0xxx12_flash.ld -Xlinker --gc-sections -Wl,-Map,"lwip_tcpecho_freertos_frdmk64f_2.map" -Wall  --specs=nano.specs          -fno-common  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin  -mapcs  -Xlinker -static  -Xlinker -z  -Xlinker muldefs  -Xlinker --defsym=__ram_vector_table__=1 -o "lwip_tcpecho_freertos_frdmk64f_2.elf" -Xlinker --start-group $(OBJS) $(USER_OBJS) $(LIBS) -Xlinker --end-group
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(ASM_DEPS)$(S_UPPER_DEPS) lwip_tcpecho_freertos_frdmk64f_2.elf
	-@echo ' '

secondary-outputs:

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
