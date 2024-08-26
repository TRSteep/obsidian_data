#routeos #mikrotik

- IP - Firewall - NAT - Add New
	- ![|300](mikrotik-port-forward-01.jpg)
	- Настройка проброса Web
		- Chain — dstnat;
		- Dst. Address — внешний IP-адрес;
		- Protocol — tcp;
		- Dst. Port — 443;
		- Action — dst-nat;
		- To Address — IP-адрес сервера, на который должно идти перенаправление.
	- Настройка проброса RDP
		- Chain — dstnat;
		- Dst. Address — внешний IP-адрес;
		- Protocol — rdp;
		- Action — dst-nat;
		- To Address — IP-адрес сервера, на который должно идти перенаправление.
	- 