#arduino #threads #dev 

# Arduino запуск нескольких потоков
```C++
unsigned long millisnow; // Переменная для хранения точки отсчета
void setup() {
}

void loop() {
 if (millis() - millisnow > 10000){ // значение паузы - 10 seconds
  millisnow = millis(); 
  //Start action every 10 sec
 }
}
```

---
Если нам нужно несколько потоков с разным временем, то нужно несколько таймеров, например
1. мигание лампы каждые 2 сек
2. вывод сообщения каждую минуту
```c++
unsigned long millis_led_now;
int millis_led_delay = 2000;
unsigned long millis_message_now;
int millis_message_delay = 60000;

void loop() {
 if (millis() - millis_led_now > millis_led_delay){
  millis_led_now = millis(); 
  //Start action every 10 sec
  }
 }

 if (millis() - millis_message_now > millis_message_delay){ // значение паузы - 10 seconds
  millis_message_now = millis(); 
  //Start action every 10 sec
 }
}
```