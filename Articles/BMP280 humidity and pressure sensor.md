#arduino #diy #dev #sensor
## Info

## Connect
- VCC — вывод питания 3.3 В;
- GND — заземляющий вывод питания микросхемы
- I2C
	- ![|300](Pasted%20image%2020231015134545.png)
	- CL — вывод I2C, подключается к линии I2C микроконтроллера, рабочие напряжение 3 В или 5 В.
		- D1 - GPIO5 #esp
	- DA — вывод данных I2C подключается к линии I2C микроконтроллера, рабочие напряжение 3 В или 5 В.
		- D2 - GPIO4 #esp
- SPI
	- ![|300](Pasted%20image%2020231015134555.png)
	- 
- 

## Library

## Code 

Проверка адреса модуля
```C
#include <Wire.h>
void setup() {
  Serial.begin(115200);
  Serial.println("Start scan");
}
void loop() {
  for (uint8_t i = 1; i < 128; i++) {
    Wire.beginTransmission(i);
    if (!Wire.endTransmission()) Serial.println(i, HEX);
  }
  Serial.println("...");
  delay(5000);
}
```