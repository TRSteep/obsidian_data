#mikrotik #wireguard #vpn 

Info
- https://blog.neuronvm.com/configure-wireguard-on-mikrotik/

Udpate to v7
- Update Firmware on MikroTik 

Config
- Прежде всего нам нужно создать интерфейс, чтобы получить публичный ключ или Public Key
	- go to the “System” tab in the web interface and click “WireGuard.”
	- “Add New Peer” button
	- ![|400](1-create-wireguard-on-mikrotik.webp)
		- MTU to 1412; otherwise, leave it as 1420.
- add the IP address to your new interface
	- ![|400](2-mikrotik-wireguard-address.webp)
- Go to the “Peers” section
	- Duplicate the Public Key and assign it to a specific address permitted for the WireGuard network
	- ![|400](3-mikrotik-wireguard-add-peer.webp)
- firewall section
	- you have to allow the UDP port for WireGuard
		- In this tutorial, the port is set to 33333
	- ![|400](4-firewall-wireguard-allow.webp)
- 