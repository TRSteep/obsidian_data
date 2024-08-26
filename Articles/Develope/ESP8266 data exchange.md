#esp #arduino #diy

Передача данных от платы с датчиком к плате приемники.
Без обработки входящего сообщения.

Info
- https://randomnerdtutorials.com/esp-now-auto-pairing-esp32-esp8266/


Get MAC for receiver
- [Get MAC](obsidian://open?vault=Obsidian%20Vault&file=ESP8266%20get%20MAC%20address)
- and set it in 0xFF format

---
# Sender ESP8266
```python
#include <ESP8266WiFi.h>
#include <espnow.h>

uint8_t receiverAddress[] = {0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC};
char sensor_id[20] = "test";
const char* payload = "{\"temperature\":%.02f,\"humidity\":%.02f}";

typedef struct sensor_message {
  char id[20];
  char payload[180];
} sensor_message;
sensor_message myMessage;

void setup() {
  Serial.begin(115200);
  Serial.println();

  WiFi.mode(WIFI_STA);

  setupEspNow();
}

void setupEspNow() {  
  if (esp_now_init() != 0) {
    Serial.println("Error initializing ESP-NOW");
    delay(1000);
    ESP.restart();
  }

  esp_now_set_self_role(ESP_NOW_ROLE_CONTROLLER);
  esp_now_register_send_cb(onDataSent);
  
  int status = esp_now_add_peer(receiverAddress, ESP_NOW_ROLE_SLAVE, 1, NULL, 0);
  if (status == 0) {
    Serial.println("Adding peer succeeded");
  } else {
    Serial.print("Adding peer failed.");
  }
}

void onDataSent(uint8_t* mac_addr, uint8_t sendStatus) {
  if (sendStatus == 0){
    Serial.println("Delivery succeeded");
  } else{
    Serial.print("Delivery failed!");
  }
}

void loop() {
  float temperature = 12.50;
  float humidity = 49.31;
  strcpy(myMessage.id, sensor_id);
  snprintf(myMessage.payload, 180, payload, temperature, humidity);

  int status = esp_now_send(receiverAddress, (uint8_t *) &myMessage, sizeof(myMessage));
  if (status == 0) {
    Serial.println("Sending message succeeded");
  } else {
    Serial.print("Sending message failed");
  }

  delay(30000);
}

```

---
# Receiver ESP8266
```python
#include <ESP8266WiFi.h>
#include <espnow.h>

uint8_t fixedAddress[] = {0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC};

void setup() {
  Serial.begin(115200);
  WiFi.disconnect();
  WiFi.mode(WIFI_STA);
  wifi_set_macaddr(STATION_IF, &fixedAddress[0]);
  if (esp_now_init() != 0) {
    delay(1000);
    ESP.restart();
  }
  esp_now_set_self_role(ESP_NOW_ROLE_SLAVE);
  esp_now_register_recv_cb(onDataRecv);
}

void onDataRecv(uint8_t *macAddress, uint8_t *incomingData, uint8_t length) {
  Serial.write(incomingData, length);
  Serial.write('\n');
}

void loop() {}

```