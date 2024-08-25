#hardware 
https://www.manualslib.com/manual/445976/3com-3c17700-Superstack-3-Switch-4900.html#product-SuperStack%203%204900

Software
- puttty

## Config Telnet
- Menu
	- bridge             - Administer bridge-wide parameters
	- fabric             - Administer XRN fabrics
	- feature            - Administer system features
	- gettingStarted     - Basic device configuration
	- logout             - Logout of the Command Line Interface
	- physicalInterface  - Administer physical interfaces
	- protocol           - Administer protocols
	- security           - Administer security
	- system             - Administer system-level functions
	- trafficManagement  - Administer traffic management
- VLAN
	- bridge > vlan
		- detail
		- create
			- VLAN ID
			- VLAN NAME
		- modify
			- addPort
				- VLAN ID
				- 1:PORT
				- tagged
- Port
	- bridge > port
		- detail
			- 1:Port
	-  physicalInterface > ethernet
		- summary (counters on interface)
		- portState
			- 1:Port 
			- enable/disable
		- portCapabilities
			- 1:Port
			- 1000full
- IP
	- protocol > IP > interface
		- summary > all (all IP on interface)

## Config WEB
- ### Connect
	- Terminal
		- System > Console
			- Setup
		- GUI
- ### L2
	- VLAN
		- Bridge > VLAN
			- Display/Edit > Create
				- ID
				- Name
				- Select port (но у меня порты НЕ ОТОБРАЖАЮТСЯ)
	- Port Enabled/Disabled
		- Physical Interface >Ethernet
			- Setup
		- GUI
- ### L3
	- Interfaces IP
		- Protocol > IP > Interface
			- Display/Edit
	- GW
		- Protocol > IP > Route
			- Default Gateway
	- Route
		- Protocol > IP > Route
			- Display/Edit
- ### Debug
	- Tracert
		- Protocol > IP
			- Trace Route
	- ARP
		- Protocol > IP > ARP
			- Display/Edit
	- Port Info (Gigabit, etc)
		- Physical Interface >Ethernet
			- Port Setup Summary
- ### Security
	- Password
		- Security > Device > User
			- Modify
	- ACL
		- Security > Network > Access > Access List
			- Display/Edit




# 4900 
### Manual
- https://www.manualslib.com/manual/872536/3com-4900-3c17700.html?page=1
- https://www.manualslib.com/manual/445976/3com-3c17700-Superstack-3-Switch-4900.html?page=1

## Default
- Param
	- Port Status - Enabled
	- Port Speed - Auto-negotiated
	- Duplex Mode - Auto-negotiated
	- Flow Control - Auto-negotiated
- Telnet
	- Virtual LANs (VLANs) - All ports belong to the untagged Default VLAN 1
	- IP - 169.254.100.100 255.255.0.0
		- range 169.254.1.0 to 169.254.254.255
- Terminal
	- 19200
	- 8 data bits
	- no parity
	- 1 stop bit
	- no hardware flow control

### Data
- Visual
	- ![|500](Pasted%20image%2020240317144353.png)
	- ![|500](Pasted%20image%2020240317144521.png)
	- ![|500](Pasted%20image%2020240317141836.png)
- Reset 3COM Switch to Factory Defaults (Forgot Password)
	- The default password for a 3COM 2928 SFP
		- Username: admin
		- Password: blank
	- Connect a Cisco (light blue) console cable between a computer (serial) and the 3COM switch (RJ45 console port)
	- Open PUTTY with a serial connection and the following settings (38400, 8, 1, N)
	- Power on the 3COM switch and wait for the "Starting....." text to appear
	- When "Press Ctrl-B to enter Extended Boot menu..." appears, press "CTRL+B"
		- Please input BootRom password:
		- BOOT MENU
		- Press "7" to "Skip current system configuration"
		- Press "Y" to skip the current config at next reboot
		- Now Press "0" to reboot the switch
	- The switch will reboot, allow it to fully boot this time
	- Press "Enter", you will not need a password to login.
	- Now type "initialize" to delete the configuration file and reboot the switch once more, Press "Y" to accept reboot.
	- The switch will full start up again, this time completely factory reset.
	- Press "Enter", then enter the username "admin" and password "blank". Press "Enter" and you will be logged in.
	- 
	- If you type "summary" you will see all the switch details.
	- Once you can access the web management page for the switch make sure you set a strong password for "admin" and store it in a secure encrypted location for next time.
	- Don't forget to save your new configuration! Otherwise the switch will be at factory defaults if the power goes off!!