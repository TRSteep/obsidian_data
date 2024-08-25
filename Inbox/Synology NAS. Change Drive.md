#nas #synology #hardware #hdd 

# Change Hard Drive on Synology NAS
## Before You Start
- impact the capacity of your storage pool
	- use https://www.synology.com/en-us/support/RAID_calculator
- drive can only replace a drive of the same type
	- SATA to SATA
- drive must be same or grater size
## Replace HDD
### Eject Drive
- Storage Manager > HDD/SSD
	- Logs
		- you can see error on drive and HDD SN
		- write or screen SN
	- HDD/SSD
		- Select Drive
		- Action > Deactivate Drive
- Power off your Synology NAS.
	- ![|200](Pasted%20image%2020240824163847.png)
- Remove correct drive
	- Check model and SN
### Attaché Drive
- Add new drive
- Power on your Synology NAS
- Storage Manager > HDD/SSD
	- make sure the new drive is recognized
- Storage pool
	- Repair the storage pool with **Degraded** status
		- Action > Repair
		- Select new HDD
	- Follow the wizard to finish
	- Check result in status 
		- Wait end of **Repairing**
### Storage
- Allocate new space
	- Storage Manager > Volume
		- Action > Configure
			- Max
				- OK
	- ![|500](Pasted%20image%2020240825100248.png)