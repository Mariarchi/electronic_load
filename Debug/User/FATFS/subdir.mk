################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/FATFS/diskio.c \
../User/FATFS/fatfs_storage.c \
../User/FATFS/ff.c 

OBJS += \
./User/FATFS/diskio.o \
./User/FATFS/fatfs_storage.o \
./User/FATFS/ff.o 

C_DEPS += \
./User/FATFS/diskio.d \
./User/FATFS/fatfs_storage.d \
./User/FATFS/ff.d 


# Each subdirectory must supply rules for building sources it contributes
User/FATFS/%.o User/FATFS/%.su User/FATFS/%.cyclo: ../User/FATFS/%.c User/FATFS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Config" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Fonts" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/LCD" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Lib" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/SDCard" -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/FATFS/option" -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I"C:/Users/DmitriyIZ/Desktop/LCD_by_myself_F411/User/Encoder" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-FATFS

clean-User-2f-FATFS:
	-$(RM) ./User/FATFS/diskio.cyclo ./User/FATFS/diskio.d ./User/FATFS/diskio.o ./User/FATFS/diskio.su ./User/FATFS/fatfs_storage.cyclo ./User/FATFS/fatfs_storage.d ./User/FATFS/fatfs_storage.o ./User/FATFS/fatfs_storage.su ./User/FATFS/ff.cyclo ./User/FATFS/ff.d ./User/FATFS/ff.o ./User/FATFS/ff.su

.PHONY: clean-User-2f-FATFS

