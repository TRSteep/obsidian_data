#network #mikrotik #qos 
## Info
- https://mum.mikrotik.com/presentations/RU16I/presentation_3280_1458573256.pdf
- Типы трафика
	- чувствительный к времени задержки (delay)
	-  чувствительный к колебаниям времени задержки (jitter)
	-  чувствительный к потерям (packet loss)
	- выделять гарантированную полосу пропускания
- Типы оптимизации
	- Shaping
		- ![|400](Pasted%20image%2020231011143306.png)
	- Scheduling
		- ![|400](Pasted%20image%2020231011143316.png)
- Типы очередей
	- Simple queues ( простые очереди )
		- ограничение скорости для конкретных пользователей по их IP-адресу
		- Обработка в порядке следования
		- Возможность обойтись без packet mark ( target )
		- Хорошо обрабатываются многоядерными процессорами (семейство роутеров CCR)
		- ![|400](Pasted%20image%2020231011143559.png)
	- Queue tree ( дерево очередей )
		- ![|400](Pasted%20image%2020231011143651.png)
		- Main
			- background
			- e-mail
			- tcp_sql
			- voice
		- Speed
			- Limit at (CIR) гарантирование скорость
			- Max limit (MIR) максмальная скорость
- Маркировка
	- Метки
		- mark connection
		- mark routing (policy routing)
		- mark packet (QoS)
	- Mangle:
		- `/ip firewall mangle`

Обработка трафика
![|500](Pasted%20image%2020231011144117.png)