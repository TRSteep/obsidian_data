#hardware #diy #arduino
https://docs.google.com/spreadsheets/d/1g5yXGLWYiU56A_TttRDneANwRhxGwpWEHOQjaPL70EQ/edit#gid=736527195

# Внешний вид
![](Pasted%20image%2020231015033842.png)

# Технические параметры
- Напряжение питания: 1.5 В ~ 3.6 В;  
- Ток потребления: ≤ 4 мА;  
- Диапазон измерения влажности: 0 ~ 100%;  
- Диапазон измерения температуры: — 40 ℃ ~ +105 ℃;  
- Интерфейс: I2C;  
- Точность измерения влажности (от 10% до 95% ): ± 2%;  
- Точность измерения температуры: ± 0.3 °C;  
- Время измерения: 0.5 с;  
- Габариты: 15 x 15 x 2 мм;  
- Вес: 1 грамм.

# Подключение или распиновка
- VCC — вывод питания 3.3 В;
- GND — заземляющий вывод питания микросхемы
- CL — вывод I2C, подключается к линии I2C микроконтроллера, рабочие напряжение 3 В или 5 В.
	- D1 - GPIO5 #esp
- DA — вывод данных I2C подключается к линии I2C микроконтроллера, рабочие напряжение 3 В или 5 В.
	- D2 - GPIO4 #esp

# Arduino
#arduino 
## Библиотека
- SparkFunHTU21D
	- Поиск по HTU21D
- Wire

## Пример кода
```c
#include <Wire.h>                            // Подключаем библиотеку Wire
#include "SparkFunHTU21D.h"                  // Подключаем библиотеку SparkFunHTU21D
 
HTU21D myHumidity;                           // Создаем объект для работы с датчиком                
 
void setup()
{
  Serial.begin(9600);                        // Открытие последовательного порта на скорости 9600
  Serial.println("HTU21D Example!");         // Отправка сообщения в последовательного порт
 
  myHumidity.begin();                        // Инициализация HTU21D
}
 
void loop()
{
  float humd = myHumidity.readHumidity();    // Считываем влажность
  float temp = myHumidity.readTemperature(); // Считываем температуру
 
  Serial.print("Temperature:");              // Отправка сообщения
  Serial.print(temp, 1);                     // Отправка температуры
  Serial.print("C");                         // Отправка сообщения
  Serial.print(" Humidity:");                // Отправка сообщения
  Serial.print(humd, 1);                     // Отправка влажности
  Serial.print("%");                         // Отправка сообщения
  Serial.println();                          // Отправка сообщения
  delay(1000);                               // Пауза
}
```