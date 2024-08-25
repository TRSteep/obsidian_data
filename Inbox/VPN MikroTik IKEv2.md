#vpn #mikrotik 
## Info
- https://mum.mikrotik.com/presentations/CN19/presentation_7073_1571797375.pdf
	- IKEv2 is supported in current RouterOS versions, and one way to make it work is by using EAP-MSCHAPv2, which is covered in this presentat
	- Static or dynamic public 
	-  port forwarding UDP ports 500 and 4500
	- Static public IP only needs to create a DNS A record
- https://forum.mikrotik.com/viewtopic.php?p=919648


## Create Self-Signed Certificates in RouterOS
- Generate a Self-Signed CA certificate and sign it
	- `/certificate add name="Home CA" common-name="Home CA" key-size=4096 days-valid=7300 key-usage=key-cert-sign,crl-sign`
		- `/certificate add name=my.ca common-name=my.ca key-usage=key-cert-sign,crl-sign trusted=yes`
	- `/certificate sign "Home CA"`
		- `/certificate sign my.ca`
- Generate a certificate for the vpn server (the router), sign it and trust it
	- `/certificate add name=vpn.server common-name=vpn.server`
	- `/certificate sign vpn.server ca=my.ca`
	- `/certificate set trusted=yes vpn.server`
- Generate a certificate for the vpn client (your phone) and sign it
	- `/certificate add name=vpn.client common-name=vpn.client`
	- `/certificate sign vpn.client ca=my.ca`
	- `/certificate set trusted=yes vpn.client`
- Export the CA certificate to a file
	- `/certificate export`
	- our exported CA certificate is now in Files with the filename cert_export_my.ca.crt
- Export the Client to a file w/ a Passphrase
	- `/certificate export-certificate vpn.client export-passphrase=12345678 type=pkcs12`
	- Your exported client key pair is now in Files with the filename cert_export_vpn.client.p12
- ![|500](mikrotik-export-certificates-ikev2.png.webp)

## Configure IKEv2 in RouterOS
- Firewall
- Create an IP Pool
	- Check first you may already have one if you have an existing PPTP, LT2P, or SSTP VPN setup. You can reuse the existing pool or create a new one just for IKEv2 VPN clients.
	- `/ip pool add name=vpn ranges=192.168.89.0/24`
	- ![|250](ikev2-ip-pool-vpn.png.webp)
- Create a new IPSec Mode Config
	- This is the glue that tells the IPSec Peer what IP pool to use.
	- `/ip ipsec mode-config`
		- `add address-pool=vpn name=cfg1 static-dns=8.8.8.8 system-dns=no`
	- ![|250](ikev2-ipsec-mode-config-467x270.png.webp)
- Create an IPSec Proposal
	- `/ip ipsec proposal add auth-algorithms=sha256 enc-algorithms=aes-256-cbc name=ios-ikev2-proposal pfs-group=none`
		- or modp1024
	- ![|250](IKEv2-IPSec-Proposal-for-Apple-IOS.png.webp)
- Create an IPSec Profile
	- Hash: sha256
	- PRF: sha256
	- Encrypt: aes-256
	- DH: modp2048
	- Lifetime: 1h
	- NAT Traversal
- Group
	- group_IKEv2
- Create an IPSec Peer
	- `/ip ipsec peer`
		- `add address=0.0.0.0/0 auth-method=rsa-signature certificate=server dh-group=modp2048 dpd-interval=1h \`
		- `enc-algorithm=aes-256,aes-128 exchange-mode=ike2 generate-policy=port-strict hash-algorithm=sha256 \`
		- `lifetime=1h mode-config=cfg1 my-id=fqdn:vpn.server passive=yes remote-certificate=vpn.client \`
		- `send-initial-contact=no`
	- Wow, that’s one big nasty RoS command, here are some screenshots to compare.
		- ![|250](IKEv2-IPSec-Peer-General.png.webp)
		- ![|250](IKEv2-IPSec-Peer-Advanced.png.webp)
		- ![|250](IKEv2-IPSec-Peer-Encryption.png.webp)
## Install Certificates on the PC
```c
certutil -f -importpfx "\path\to\your\file.p12" NoExport
```
- We need to install both the Client certificate and the CA certificate on your device.
- email these certificates to yourself as attachments and install them from the mail client on your phone

### Enable stronger ciphers for IKEv2
By default Windows 7 up to Windows 11 propose only the weak `**modp1024**` Diffie-Hellman key exchange algorithm that has been deprecated
- Info
	- https://docs.strongswan.org/docs/5.9/interop/windowsClients.html
	- https://github.com/hwdsl2/vpn-extras/releases/download/v1.0.0/Enable_Stronger_Ciphers_for_IKEv2_on_Windows.reg
- Regedit
	- https://github.com/hwdsl2/vpn-extras/releases/download/v1.0.0/Enable_Stronger_Ciphers_for_IKEv2_on_Windows.reg
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Rasman\Parameters\NegotiateDH2048_AES256`
- 0 - Disable AES-256-CBC and MODP-2048. This is the default
- 1 - Enable AES-256-CBC and MODP-2048
- 2 - Enforce the usage of AES-256-CBC and MODP-2048
	- ike = aes256-sha1-sha256-sha384-modp2048
	- Unfortunately the ESP proposals still contain the weak single DES and even NULL encryption
		- esp = aes256-aes128-3des-des-null-sha1

## Create a new VPN profile on Windows
### Default Windows VPN connection
```c
# Create VPN connection (replace server address with your own value)
powershell -command ^"Add-VpnConnection -ServerAddress 'Your VPN Server IP (or DNS name)' ^
  -Name 'My IKEv2 VPN' -TunnelType IKEv2 -AuthenticationMethod MachineCertificate ^
  -EncryptionLevel Required -PassThru^"
# Set IPsec configuration
powershell -command ^"Set-VpnConnectionIPsecConfiguration -ConnectionName 'My IKEv2 VPN' ^
  -AuthenticationTransformConstants GCMAES128 -CipherTransformConstants GCMAES128 ^
  -EncryptionMethod AES256 -IntegrityCheckMethod SHA256 -PfsGroup None ^
  -DHGroup Group14 -PassThru -Force^"
```


## Create a new VPN profile in phone
- Open Setting | VPN
- Tap Add VPN Configuration…
- Choose type IKEv2
- Enter the remaining settings as followsDescription: IKEv2 MikroTikServer: {external ip of router}Remote ID: vpn.server (cn from server certificate)Local ID: vpn.client (cn from client certificate)User Authentication: None (trust me that’s the right one)
- Use Certificate: On
- Certificate: Choose the vpn.client certificate from the list
- ![|250](95651-595x1024.jpg.webp)

## Debug
- Make sure your have NAT rule that masqurades traffic from the IP pool out the WAN interface. My NAT rule looks like this…
	- `/ip firewall nat`
		- `add action=masquerade chain=srcnat out-interface=ether1`