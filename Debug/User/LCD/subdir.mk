################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/LCD/LCD_Bmp.c \
../User/LCD/LCD_Driver.c \
../User/LCD/LCD_GUI.c \
../User/LCD/LCD_Touch.c 

OBJS += \
./User/LCD/LCD_Bmp.o \
./User/LCD/LCD_Driver.o \
./User/LCD/LCD_GUI.o \
./User/LCD/LCD_Touch.o 

C_DEPS += \
./User/LCD/LCD_Bmp.d \
./User/LCD/LCD_Driver.d \
./User/LCD/LCD_GUI.d \
./User/LCD/LCD_Touch.d 


# Each subdirectory must supply rules for building sources it contributes
User/LCD/%.o User/LCD/%.su User/LCD/%.cyclo: ../User/LCD/%.c User/LCD/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Config" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Fonts" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/LCD" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Lib" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/SDCard" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS/option" -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Encoder" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-LCD

clean-User-2f-LCD:
	-$(RM) ./User/LCD/LCD_Bmp.cyclo ./User/LCD/LCD_Bmp.d ./User/LCD/LCD_Bmp.o ./User/LCD/LCD_Bmp.su ./User/LCD/LCD_Driver.cyclo ./User/LCD/LCD_Driver.d ./User/LCD/LCD_Driver.o ./User/LCD/LCD_Driver.su ./User/LCD/LCD_GUI.cyclo ./User/LCD/LCD_GUI.d ./User/LCD/LCD_GUI.o ./User/LCD/LCD_GUI.su ./User/LCD/LCD_Touch.cyclo ./User/LCD/LCD_Touch.d ./User/LCD/LCD_Touch.o ./User/LCD/LCD_Touch.su

.PHONY: clean-User-2f-LCD

