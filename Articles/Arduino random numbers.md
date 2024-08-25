#arduino #dev 

Info
- https://alexgyver.ru/lessons/random/
Code
- random(max)
	-  0 .. max-1
- random(min, max)
	- min .. max-1
- randomSeed(value)
	- установить новое начальное число для отсчёта

Random from air

## Test
```c++
Serial.println(analogRead(A0));
delay(100);
```

# Good random
```c++
uint32_t seed = 0;
for (int i = 0; i < 16; i++) {
  seed *= 4;
  seed += analogRead(A0) & 3;
  randomSeed(seed);
}
```