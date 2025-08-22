#include "ec11.h"

// Таблица состояний для декодирования поворота энкодера
static const int8_t enc_states[] = {
    0,  -1,  1,  0,
    1,   0,  0, -1,
    -1,   0,  0,  1,
    0,   1, -1,  0
};

void EC11_Init(EC11_HandleTypeDef *hec11,
               GPIO_TypeDef* GPIO_Port_A, uint16_t GPIO_Pin_A,
               GPIO_TypeDef* GPIO_Port_B, uint16_t GPIO_Pin_B,
               GPIO_TypeDef* GPIO_Port_BTN, uint16_t GPIO_Pin_BTN)
{
    hec11->GPIO_Port_A = GPIO_Port_A;
    hec11->GPIO_Pin_A = GPIO_Pin_A;
    hec11->GPIO_Port_B = GPIO_Port_B;
    hec11->GPIO_Pin_B = GPIO_Pin_B;
    hec11->GPIO_Port_BTN = GPIO_Port_BTN;
    hec11->GPIO_Pin_BTN = GPIO_Pin_BTN;

    hec11->counter = 0;
    hec11->prev_counter = 0;
    hec11->prev_state = 0;
    hec11->btn_state = 0;
    hec11->btn_prev_state = 0;

    // Чтение начального состояния
    uint8_t a = HAL_GPIO_ReadPin(hec11->GPIO_Port_A, hec11->GPIO_Pin_A);
    uint8_t b = HAL_GPIO_ReadPin(hec11->GPIO_Port_B, hec11->GPIO_Pin_B);
    hec11->prev_state = (a << 1) | b;

    if (hec11->GPIO_Port_BTN != NULL)
    {
        hec11->btn_prev_state = HAL_GPIO_ReadPin(hec11->GPIO_Port_BTN, hec11->GPIO_Pin_BTN);
    }
}

void EC11_Update(EC11_HandleTypeDef *hec11)
{
    // Чтение текущего состояния контактов
    uint8_t a = HAL_GPIO_ReadPin(hec11->GPIO_Port_A, hec11->GPIO_Pin_A);
    uint8_t b = HAL_GPIO_ReadPin(hec11->GPIO_Port_B, hec11->GPIO_Pin_B);
    uint8_t current_state = (a << 1) | b;

    // Обновление счетчика на основе таблицы состояний
    hec11->counter += enc_states[(hec11->prev_state << 2) | current_state];
    hec11->prev_state = current_state;

    // Обновление состояния кнопки
    if (hec11->GPIO_Port_BTN != NULL)
    {
        hec11->btn_state = HAL_GPIO_ReadPin(hec11->GPIO_Port_BTN, hec11->GPIO_Pin_BTN);
    }
}

int32_t EC11_GetDelta(EC11_HandleTypeDef *hec11)
{
    int32_t delta = (hec11->counter - hec11->prev_counter) / 4;
    hec11->prev_counter = hec11->counter;
    return delta;
}

uint8_t EC11_ButtonPressed(EC11_HandleTypeDef *hec11)
{
    if (hec11->GPIO_Port_BTN == NULL) return 0;

    uint8_t pressed = (hec11->btn_prev_state == GPIO_PIN_SET) &&
                      (hec11->btn_state == GPIO_PIN_RESET);
    hec11->btn_prev_state = hec11->btn_state;
    return pressed;
}

uint8_t EC11_ButtonReleased(EC11_HandleTypeDef *hec11)
{
    if (hec11->GPIO_Port_BTN == NULL) return 0;

    uint8_t released = (hec11->btn_prev_state == GPIO_PIN_RESET) &&
                       (hec11->btn_state == GPIO_PIN_SET);
    hec11->btn_prev_state = hec11->btn_state;
    return released;
}
