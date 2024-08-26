#doh #dns

# Technology
- ### DNS Crypt (DNSSEC)
	- uses its unique protocol for encryption
	- on the standard port (443)
- ### DNS over HTTPS (DoH)
	- uses the HTTPS protocol
	- Full encryption of the DNS protocol
	- Uses standard HTTP/2 or HTTP/3, on the standard port (443)
- ### DNS over TLS (DoT)
	- uses the TLS protocol
	- Full encryption of the DNS protocol
	- Uses a dedicated port (853) likely to be blocked or monitored in situations where DNS encryption is useful
- ### DNS over SSH
	- Full encryption of the DNS protocol

# Server
- Select by perfomance
	- https://www.dnsperf.com/#!dns-resolvers
- [DOH Server List](DOH%20Server%20List.md)

# Configure software
- ### Mozilla Firefox
	- Options > General > Network Settings
		- Enable DNS over HTTPS. Under Use Provider, choose Custom
- ### Google Chrome
	- In Chrome's address bar, enter
		-  chrome://flags/#dns-over-https
		- and set Secure DNS Lookups to Enabled.
	- OR
	- Select the three-dot menu in your browser > Settings.
		- Select Privacy and security > Security.
		- Scroll down and enable Use secure DNS.
		- Select the **With** option, and from the drop-down menu choose _Cloudflare (1.1.1.1)_.

# Software
- List
	- https://dnscrypt.info/implementations
	- DNSCrypt-Proxy 
		- https://github.com/DNSCrypt/dnscrypt-proxy 2023
	- dnsproxy
		- https://github.com/AdguardTeam/dnsproxy/releases 2023
	- dnslookup
		- https://github.com/ameshkov/dnslookup 2023

# Check
- CloufFlare
	- https://1.1.1.1/help
- 