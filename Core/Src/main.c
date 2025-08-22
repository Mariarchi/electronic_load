/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

#include "main.h"
#include "spi.h"
#include "tim.h"
#include "usart.h"
#include "usb_device.h"
#include "usbd_cdc.h"
#include "gpio.h"

#include "DEV_Config.h"
#include "LCD_Driver.h"
#include "LCD_GUI.h"
#include "LCD_Touch.h"
#include "LCD_Bmp.h"
#include "Show_Lib.h"
#include "ec11.h"

void USB_Send_Message(const char *msg) {
	CDC_Transmit_FS((uint8_t*)msg, strlen(msg));
	HAL_Delay(10);
}

void UART_Send(const char *msg) {
    HAL_UART_Transmit(&huart2, (uint8_t*)msg, strlen(msg), HAL_MAX_DELAY);
}

void SystemClock_Config(void);

int main(void)
{
	HAL_Init();

	SystemClock_Config();

	MX_GPIO_Init();
	MX_SPI1_Init();
	MX_TIM3_Init();
	MX_USART2_UART_Init();
	MX_USB_DEVICE_Init();

	printf("3.5inch TFT Touch Shield Demo\r\n");
	System_Init();

	LCD_SCAN_DIR Lcd_ScanDir = SCAN_DIR_DFT;//SCAN_DIR_DFT = D2U_L2R направление отрисовки?
	printf("Init LCD...\r\n");
	LCD_Init(Lcd_ScanDir, 64000); // управление яркостью
	printf("Init TouchPad...\r\n");
	TP_Init(Lcd_ScanDir);
	printf("Init SDcard...\r\n");
	SD_Init();
	printf("Install factory TP set...\r\n");
	TP_GetAdFac();//Get the default calibration factor
	printf("Initialization for Electronic load \r\n");
	LOAD_Init();

	/*
	printf("**********Show SD card pic**********\r\n");
	LCD_SCAN_DIR Bmp_ScanDir = D2U_R2L; // тут появляется ошибка
	LCD_Show_bmp(Bmp_ScanDir, Lcd_ScanDir);
 	*/


/*
	printf("**********LCD Show**********\r\n");
	GUI_Show();
	Driver_Delay_ms(1000);
*/

/*
	printf("**********Touch Draw Board**********\r\n");
	TP_GetAdFac();//Get the default calibration factor
	TP_Dialog();//initialize the drawing board
*/

	uint32_t previousTick = 0;

	DEV_TIME sDev_time;
	sDev_time.Hour = 00;
	sDev_time.Min = 00;
	sDev_time.Sec = 00;

	LCD_Clear(LCD_BACKGROUND);
	TP_MenuDialog();

	while (1) {
	  //GUI_Show();
	  //LCD_Show_bmp(Bmp_ScanDir , Lcd_ScanDir);
	  //TP_DrawBoard();
	  //GUI_DisGrayMap(0, 0, gImage_ninja);

		TP_MenuTouch();
		TP_IndicationsUnit();

	    if (HAL_GetTick() - previousTick >= 1000) {
	        previousTick = HAL_GetTick();

			sDev_time.Sec++;
			GUI_Showtime(0, 0, 126, 25, &sDev_time, BLUE);
	    }
	}
}


/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 123;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
	  _Error_Handler(__FILE__, __LINE__);
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
	  _Error_Handler(__FILE__, __LINE__);
  }

	  /**Configure the Systick interrupt time
	  */
	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

	  /**Configure the Systick
	  */
	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void _Error_Handler(char * file, int line)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
