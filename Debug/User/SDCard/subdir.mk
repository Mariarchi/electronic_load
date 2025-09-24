################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/SDCard/MMC_SD.c 

OBJS += \
./User/SDCard/MMC_SD.o 

C_DEPS += \
./User/SDCard/MMC_SD.d 


# Each subdirectory must supply rules for building sources it contributes
User/SDCard/%.o User/SDCard/%.su User/SDCard/%.cyclo: ../User/SDCard/%.c User/SDCard/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/Config" -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/FATFS" -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/Fonts" -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/LCD" -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/Lib" -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/SDCard" -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/FATFS/option" -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I"C:/Users/DmitriyIZ/Documents/My_projects/electronic_load/User/Encoder" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-SDCard

clean-User-2f-SDCard:
	-$(RM) ./User/SDCard/MMC_SD.cyclo ./User/SDCard/MMC_SD.d ./User/SDCard/MMC_SD.o ./User/SDCard/MMC_SD.su

.PHONY: clean-User-2f-SDCard

