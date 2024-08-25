#esp #arduino #dev

```c++
#ifdef
  #include <WiFi.h>
#else
  #include <ESP8266WiFi.h>
#endif

void setup(){
  Serial.begin(115200);
  Serial.println();
  delay(1000);                      // Wait for a second for initialization
  Serial.println("Start:");
}

void loop(){
  delay(10000);                      // Wait
  Serial.println("MAC:");
  Serial.println(WiFi.macAddress());
}
```