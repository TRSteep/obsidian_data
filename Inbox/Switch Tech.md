#hardware #network 

# Vlan (802.1q)
- Info
- Config
	- Windows
		- One VLAN
			- Device Manager (`devmgmt.msc`)
				- Expand the Network adapters
				- Advanced tab and find the VLAN ID option
					- ![|300](set-vlanid-driver-properties.jpg)
				- For some NICs, you first need to enable the Packet Priority and VLAN option
					- ![|300](enable-vlan-support-in-windows-driver.jpg)
			- PowerShell
				- `Set-NetAdapter –Name "Ethernet0" -VlanID 24`
		- MultiVLAN
			- Realtek Ethernet Diagnostic Utility
				- Go to the VLAN section, click Add, and add the required VLAN ID. After that, a new network interface will appear in Windows
				- ![|300](create-vlan-on-windows-10-using-the-realtek-ethern.png)
			- Intel Ethernet Network Adapter
				- Intel Advanced Network Services (Intel® ANS) tool
					- Run the configuration tool, go to the Teaming/VLANs tab, click the New button, and specify the name of the network interface and its VLANID.
					- ![|300](add-a-new-vlan-on-windows-using-intel-proset-adapt.png)
			- Configure Multiple VLANs on Windows Server 2022/2019/2016?
				- Open the Server Manager -> Local and click the NIC Teaming link;
				- In the Teams section, click Task -> New Team

# Jumbo Frames
- Info
	- Стандартный фрейм для Ethernet - 1500 байт, однако, к Jumbo относятся фреймы больше 1518 байт. Максимальный фрейм - 16000 байт, однако чаще используется **9000 байт**, как максимум.
	- Преимущества Jumbo Frames проявляются исключительно на гигабите и выше, они есть и значительные. Зато количество глюков, которые вы можете собрать и не сможете диагностировать просто потрясает.
	- плюсы JF
		- за один фрейм можно пробросить больше информации, возрастает скорость передачи данных по сети (но достаточно незначительно 3%-5%).
		- Зато ощутимо падает нагрузка на CPU всех устройств, которые участвуют в приеме-передаче. Это, в свою очередь, увеличивает скорость отклика и дает возможность увеличить нагрузку на сеть.
		- Эффективно для устройств СХД, NAS и т.д.
	- минусы JF
		- все устройства, участвующие в передаче, должны поддерживать фреймы размером, не меньшим, чем отправляющий сервер.
- Важно
	- Большие фреймы MTU должны быть на всем протяжене маршрута 
	- MTU на свитче должно быть больше MTU на устройстве
	- ![|500](Pasted%20image%2020240403075644.png)
- Configuration
	- Windows
		- NIC
			- Advanced
				- Jumbo Packet
	- Linux (ProxMox)
		- Interface file
			- Edit /etc/network/interface like this (add post-up command):
				- `auto eth4`
				- `iface eth4 inet static`
				- `address 192.168.110.4  netmask 255.255.255.240` 
				- `post-up ifconfig eth4 mtu 9000`
			- After this restart interface
				- `ifdown eth4 && ifup eth4`
		- Command
			- `ip link set dev eth0 mtu 9000 (eth0 is the name of the network interface, change accordingly)`
- Проверка
	- Windows:
		- `ping <addr> -f -l <MTU-28>`
		- `ping 192.168.0.1 -f -l 9000`
	- Linux
		- `ping -M do <addr> -s <MTU>`
# Spanning Tree Protocol
- Info
- Важно


# FlowControl
- Info
	- Общее правило гласит по возможности не включать flowcontrol
	- если flowcontrol на портах СХД установлен в none, то и на свиче flowcontrol должен быть установлен в off и наоборот
	- https://www.seanxwang.com/2011/03/cisco-flow-control-with-netapp-nas.html
- Важно
	- Настройки flowcontrol должны соответствовать для обоих
	- Не соответствие настроек flowcontrol приводит к разрыву установленных сессий протоколов
	- Для 10GB сетей крайне не рекомендуется включать flowcontrol.
	- Для сетей 1GB можно включать flowcontrol (в качестве исключения из правила): хранилище отсылает управление потоком, а свитч принимает — на СХД устанавливать flowcontrol в значение send, а на свитче в значение Desired (или send/tx off & receive/rx on).