#hardware 

- Imax B6
	- в режиме NiCd, выставлял ограничение по току 1800мА и использовал (не всегда) датчик температуры
	- в режиме Li-Ion - 2 шт. последовательно
	- альтернативная прошивка https://github.com/stawel/cheali-charger
- Обычным модулем DC-DC StepDown
	- построечным резистором мы снижаем выходное напряжение на клеммах понижающей схемы до 1.8 - 1.85 V (соответствует 95-98% заряду Ni-Zn аккумулятора)

> Можно запитать такой зарядник от 12 V в авто.
> Можно записать от блока питания ноутбука 19 V,  
> Можно взять питание от USB адаптера, или даже от компьютерного USB.

