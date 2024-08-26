#arduino #dev 
- https://alexgyver.ru/lessons/arduino-buttons/

# Подключение
- ![](Pasted%20image%2020230912000951.png)
Code
```c++
void setup() {
  Serial.begin(9600);
  pinMode(3, INPUT_PULLUP);
}

void loop() {
  // выведет 0, если кнопка нажата
  // и 1, если нет
  Serial.println(digitalRead(3));
  delay(10);
}
```

# Отработка нажатия
## однократно при нажатии
```c++
void setup() {
  Serial.begin(9600);
  pinMode(3, INPUT_PULLUP);
}

bool flag = false;
void loop() {
  // читаем инвертированное значение для удобства
  bool btnState = !digitalRead(3);
  if (btnState && !flag) {  // обработчик нажатия
    flag = true;
    Serial.println("press");
  }
  if (!btnState && flag) {  // обработчик отпускания
    flag = false;  
    //Serial.println("release");
  }
}
```

# Дребезг контактов
- ![](Pasted%20image%2020230912001307.png)
- ![](Pasted%20image%2020230912001314.png)

code
```c++
void setup() {
  Serial.begin(9600);
  pinMode(3, INPUT_PULLUP);
}

bool flag = false;
uint32_t btnTimer = 0;
void loop() {
  // читаем инвертированное значение для удобства
  bool btnState = !digitalRead(3);
  if (btnState && !flag && millis() - btnTimer > 100) {
    flag = true;
    btnTimer = millis();
    Serial.println("press");
  }
  if (!btnState && flag && millis() - btnTimer > 100) {
    flag = false;
    btnTimer = millis();
    //Serial.println("release");
  }
}
```