#vpn
# Description
IPSec secure packet exchange over unprotected IP/IPv6 networks such as the Internet
- https://help.mikrotik.com/docs/display/ROS/IPsec

IPsec protocol suite can be divided into the following groups:
- **Internet Key Exchange (IKE)** protocols
	- Dynamically generates and distributes cryptographic keys for AH and ESP
- **Authentication Header (AH)** 
	- FC 4302
- **Encapsulating Security Payload (ESP)**
	- RFC 4303

# Internet Key Exchange Protocol (IKE)
The Internet Key Exchange (IKE) is a protocol that provides authenticated keying material for the Internet Security Association and Key Management Protocol (ISAKMP) framework
In both cases, peers establish a connection and execute 2 phases:
- **Phase 1**
	- use in the following IKE messages and authenticate. 
	- This phase should match the following settings:
		- authentication method
		- DH group
		- encryption algorithm
			- **AES** - 128-bit, 192-bit, and 256-bit key AES-CBC, AES-CTR, and AES-GCM algorithms;
			- **Blowfish** - added since v4.5
			- **Twofish** - added since v4.5
			- **Camellia** - 128-bit, 192-bit, and 256-bit key Camellia encryption algorithm added since v4.5
			- **DES** - 56-bit DES-CBC encryption algorithm;
			- **3DES** - 168-bit DES encryption algorithm;
		- exchange mode
		- hash algorithm
		- NAT-T
		- DPD and lifetime (optional)
- **Phase 2**
	- The peers establish one or more SAs that will be used by IPsec to encrypt data.
	- This phase should match the following settings:
		- IPsec protocol
		- mode (tunnel or transport)
		- authentication method
			- EAP Authentication methods
				- EAP-MD5
				- EAP-MSCHAPv2
				- EAP-PEAPv0
				- EAP-SIM
				- EAP-TLS
				- EAP-TTLS
			- Authentication Header (AH)
				- SHA2 (256, 512)
				- SHA1
				- MD5
		- PFS (DH) group
			- Group 1
			- Group 2
				- 1024 bits MODP group
			- Group 5
			- Group 14
				- 2048 bits MODP group
			- Group 15
			- Group 16
				- 4096 bits MODP group
			- Group 17
			- Group 18
				- 8192 bits MODP group
			- **Group 19** (optimal in 2024)
				- 256 bits random ECP group
			- Group 20
				- 384 bits random ECP group
			- Group 21
				- 521 bits random ECP group
		- lifetime

