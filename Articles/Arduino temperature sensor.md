#arduino #dev #diy 

Список сенсоров
- https://kotyara12.ru/iot/th_sensors/

# DHT22 (before DHT11) - 
## Spec
- Protocol: one-wire
- Voltage: 3,3 .. 5,5V
- Temp: -40 .. 80C (0,5)
- Humi: 0 .. 100 % (2,0)

## Connect
- Manage Libraries
	- dhtlib
- Слева направо
	- 1. VCC - +5V (resistor10K to 2)
	- 2. Data - Digital PIN (2 for example)
	- 3. 
	- 4. GND - GND
- ![](Pasted%20image%2020230911224842.png)

## Code
```c++
#include "DHT.h"
#define DHTPIN 2
#define DHTTYPE DHT22

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin(); // initialize the sensor
}

void loop() {
  // wait a few seconds between measurements.
  delay(2000);
  //read sensors
  float humi = dht.readHumidity();
  float tempC = dht.readTemperature();
  float tempF = dht.readTemperature(true);
  
  //Print results
  if (isnan(humi) || isnan(tempC) || isnan(tempF)) {
    Serial.println("Failed to read from DHT sensor!");
  } else {
    Serial.print("Humidity: ");
    Serial.print(humi);Serial.print("%");
	Serial.print(" | ");
	Serial.print("Temperature: ");
	Serial.print(tempC);Serial.print("°C ~ ");
	Serial.print(tempF);Serial.println("°F");
  }
}

```

---
# BMP180
## Spec
- Protocol: I2C
- Voltage: 3,3 .. 5,0V module (1,8 .. 3,6V chip)
- Temp: 0 .. 65C (0,5)

## Connect

## Code

---
# BME280
## Spec
- Protocol: I2C or SPI
- Voltage: 3,3 .. 5,0V module (1,7 .. 3,6V chip)
- Temp: -40 .. 85C (0,5)

## Connect

## Code


# DS18B20
## Spec
- Protocol: one-wire
- Voltage: 3,0 .. 5,5V
- Temp: -55 .. 125C (0,5)

## Connect

## Code

---
# LM35 (LM35DZ, LM335, LM34)
## Spec
- Protocol: analog
- Voltage: 4 .. 30V
- Temp: -55 .. 150C (0,5)

## Connect
- +Vs to +5V
- Vout to Analog 0 (A0)
- GND to GND
- ![](Pasted%20image%2020230911220433.png)

## Code
```c++
float temp;
int tempPin = 0;

void setup() {
   Serial.begin(9600);
}

void loop() {
   temp = analogRead(tempPin);
   // read analog volt from sensor and save to variable temp
   temp = temp * 0.48828125;
   // convert the analog volt to its temperature equivalent
   Serial.print("TEMPERATURE = ");
   Serial.print(temp); // display temperature value
   Serial.print("*C");
   Serial.println();
   delay(1000); // update sensor reading each one second
}
```
