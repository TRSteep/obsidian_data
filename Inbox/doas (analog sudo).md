#linux #software 
## Install
- `apt install doas`
## Config
- create user 
	- `adduser USER`
- `nano /etc/doas.conf`
```python
permit persist :wheel as root
permit persist USER as root
permit nopass USER cmd apt apt-get as root
```

## Test
- `su USER`
	- `doas USER `