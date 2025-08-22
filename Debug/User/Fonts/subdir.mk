################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/Fonts/font12.c \
../User/Fonts/font16.c \
../User/Fonts/font20.c \
../User/Fonts/font24.c \
../User/Fonts/font8.c 

OBJS += \
./User/Fonts/font12.o \
./User/Fonts/font16.o \
./User/Fonts/font20.o \
./User/Fonts/font24.o \
./User/Fonts/font8.o 

C_DEPS += \
./User/Fonts/font12.d \
./User/Fonts/font16.d \
./User/Fonts/font20.d \
./User/Fonts/font24.d \
./User/Fonts/font8.d 


# Each subdirectory must supply rules for building sources it contributes
User/Fonts/%.o User/Fonts/%.su User/Fonts/%.cyclo: ../User/Fonts/%.c User/Fonts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Config" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Fonts" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/LCD" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Lib" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/SDCard" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS/option" -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Encoder" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-Fonts

clean-User-2f-Fonts:
	-$(RM) ./User/Fonts/font12.cyclo ./User/Fonts/font12.d ./User/Fonts/font12.o ./User/Fonts/font12.su ./User/Fonts/font16.cyclo ./User/Fonts/font16.d ./User/Fonts/font16.o ./User/Fonts/font16.su ./User/Fonts/font20.cyclo ./User/Fonts/font20.d ./User/Fonts/font20.o ./User/Fonts/font20.su ./User/Fonts/font24.cyclo ./User/Fonts/font24.d ./User/Fonts/font24.o ./User/Fonts/font24.su ./User/Fonts/font8.cyclo ./User/Fonts/font8.d ./User/Fonts/font8.o ./User/Fonts/font8.su

.PHONY: clean-User-2f-Fonts

