#arduino #esp #dev 

## Arduino IDE
- file > preferences > Additional Boards Manager URLs
	- `http://arduino.esp8266.com/stable/package_esp8266com_index.json`
	- `https://dl.espressif.com/dl/package_esp32_index.json, http://arduino.esp8266.com/stable/package_esp8266com_index.json`
- tools > board > board manager
	- search:
		- esp8266 
	- install
- tools > board > esp8266
	- Generic esp8266 Module
- Arduino sketch
	- `#include <ESP8266WiFi.h>`