#ifndef EC11_H
#define EC11_H

#include "stm32f4xx_hal.h"

typedef struct {
    GPIO_TypeDef* GPIO_Port_A;  // Порт для вывода A энкодера
    uint16_t GPIO_Pin_A;        // Пин для вывода A
    GPIO_TypeDef* GPIO_Port_B;  // Порт для вывода B энкодера
    uint16_t GPIO_Pin_B;        // Пин для вывода B
    GPIO_TypeDef* GPIO_Port_BTN; // Порт для кнопки (опционально)
    uint16_t GPIO_Pin_BTN;      // Пин для кнопки (опционально)

    int32_t counter;            // Счетчик энкодера
    int32_t prev_counter;       // Предыдущее значение счетчика
    uint8_t prev_state;         // Предыдущее состояние контактов
    uint8_t btn_state;          // Состояние кнопки
    uint8_t btn_prev_state;     // Предыдущее состояние кнопки
} EC11_HandleTypeDef;

// Инициализация энкодера
void EC11_Init(EC11_HandleTypeDef *hec11,
               GPIO_TypeDef* GPIO_Port_A, uint16_t GPIO_Pin_A,
               GPIO_TypeDef* GPIO_Port_B, uint16_t GPIO_Pin_B,
               GPIO_TypeDef* GPIO_Port_BTN, uint16_t GPIO_Pin_BTN);

// Обновление состояния энкодера (вызывать в прерывании или в основном цикле)
void EC11_Update(EC11_HandleTypeDef *hec11);

// Получение изменения счетчика (разница с предыдущим вызовом)
int32_t EC11_GetDelta(EC11_HandleTypeDef *hec11);

// Проверка нажатия кнопки (возвращает 1 при нажатии)
uint8_t EC11_ButtonPressed(EC11_HandleTypeDef *hec11);

// Проверка отпускания кнопки (возвращает 1 при отпускании)
uint8_t EC11_ButtonReleased(EC11_HandleTypeDef *hec11);

#endif // EC11_H
