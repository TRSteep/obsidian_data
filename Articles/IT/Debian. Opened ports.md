#debian #network

- netstat -pnltu
	- `sudo apt install net-tools`
- lsof -i
	- `sudo apt install lsof`
- TCP
	- ss -tl
- UDP
	- ss -lntup

---
Network Diagnostic
- `sudo ss`
	- `sudo ss -t`
	- `sudo ss -u`