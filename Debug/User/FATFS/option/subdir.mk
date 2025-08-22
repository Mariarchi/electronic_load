################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/FATFS/option/syscall.c \
../User/FATFS/option/unicode.c 

OBJS += \
./User/FATFS/option/syscall.o \
./User/FATFS/option/unicode.o 

C_DEPS += \
./User/FATFS/option/syscall.d \
./User/FATFS/option/unicode.d 


# Each subdirectory must supply rules for building sources it contributes
User/FATFS/option/%.o User/FATFS/option/%.su User/FATFS/option/%.cyclo: ../User/FATFS/option/%.c User/FATFS/option/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Config" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Fonts" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/LCD" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Lib" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/SDCard" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS/option" -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Encoder" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-FATFS-2f-option

clean-User-2f-FATFS-2f-option:
	-$(RM) ./User/FATFS/option/syscall.cyclo ./User/FATFS/option/syscall.d ./User/FATFS/option/syscall.o ./User/FATFS/option/syscall.su ./User/FATFS/option/unicode.cyclo ./User/FATFS/option/unicode.d ./User/FATFS/option/unicode.o ./User/FATFS/option/unicode.su

.PHONY: clean-User-2f-FATFS-2f-option

