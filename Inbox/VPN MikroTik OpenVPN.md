#vpn #mikrotik 
# Information
- https://help.mikrotik.com/docs/display/ROS/OpenVPN
- https://www.shellhacks.com/mikrotik-openvpn-server-setup/

# Configure
## Certificate
- Create the CA key pair
```c
/certificate add name=ca-template \
	common-name=ovpn-ca \
	days-valid=36500 \
	key-size=2048 \
	key-usage=crl-sign,key-cert-sign
/certificate sign ca-template name=ovpn-ca
```

- Create the OpenVPN server key pair and sign it with the CA key
```c
/certificate add name=server-template \
	common-name=ovpn-server\
	days-valid=36500 \
	key-size=2048 \
	key-usage=digital-signature,key-encipherment,tls-server
/certificate sign server-template name=ovpn-server \
	ca=ovpn-ca
```

- Create the OpenVPN client key pair and sign it with the CA key
```c
/certificate add name=client-template \
	common-name=ovpn-client1 \
	days-valid=36500 \
	key-size=2048 \
	key-usage=tls-client
/certificate sign client-template name=ovpn-client1 \
	ca=ovpn-ca
```
	Individual Client Keys: For each OpenVPN client it is recommended to create an individual key pair to avoid an impact on the other users if one of the private keys is compromised.
- To list the certificates
	- `/certificate print`

## Configure OpenVPN Server
- Create a pool of IP addresses for OpenVPN clients
```c
/ip pool add name=ovpn-dhcp-pool \
	range=192.168.99.10-192.168.99.254
```

- Configure and start the OpenVPN server
```c
/ppp profile add name=ovpn-server \
	use-encryption=yes \
	local-address=192.168.99.1 \
	dns-server=192.168.99.1 \
	remote-address=ovpn-dhcp-pool
/interface ovpn-server server set default-profile=ovpn-server \
	/interface ovpn-server server set default-profile=ovpn-server \
	require-client-certificate=yes \
	auth=sha1 \
	cipher=aes128-gcm,aes192-gcm,aes256-gcm \
	port=443 \
	enabled=yes
```
- dns-server=192.168.99.1 – Configures the Mikrotik router to be also a DNS server for the OpenVPN clients
- port=443 – Starts the OpenVPN server on the port 443 (by default: 1194) to avoid an Internet service provider (ISP) from detecting and blocking the VPN traffic

- Enable a dynamic DNS (DDNS) service to connect to the OpenVPN server by a permanent domain name
```c
/ip cloud set ddns-enabled=yes
/ip cloud print
```