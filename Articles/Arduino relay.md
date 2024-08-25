#arduino #dev 

## Connect
![](Pasted%20image%2020230911224213.png)

## Code
```c++
int RELAY_PIN = 13; // Plug the relay into Digital Pin 13

void setup() {
  pinMode(RELAY_PIN, OUTPUT);
}

void loop() {
  digitalWrite(relay, HIGH); // Turn the relay on
  delay(1000); // Wait 1 second
  digitalWrite(relay, LOW); // Turn the relay Off
  delay(1000); // Wait 1 second
}
```