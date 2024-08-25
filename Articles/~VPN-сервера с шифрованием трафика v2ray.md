Сработал скрипт [Marzban](obsidian://open?vault=Obsidian%20Vault&file=ShadowSocks%20%D0%BE%D1%82%20Marzban%20(%D1%80%D0%B0%D0%B1%D0%BE%D1%87%D0%B0%D1%8F%20%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F))

Ручная настройка - не сработала
## Server 
#Linux #debian #vpn
- `apt update && apt upgrade`
- `apt install shadowsocks-libev`
- https://github.com/shadowsocks/v2ray-plugin/releases
	- [Архитектура CPU](obsidian://open?vault=Obsidian%20Vault&file=%D0%90%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0%20CPU)
	- `wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz`
- `sudo tar -xf v2ray-plugin-linux-*`
- `sudo mv v2ray-plugin_linux_amd64 /etc/shadowsocks-libev/v2ray-plugin`
- `nano /lib/systemd/system/shadowsocks-libev.service`
	- `#CapabilityBoundingSet=CAP_NET_BIND_SERVICE`
	- `#AmbientCapabilities=CAP_NET_BIND_SERVICE`
- `systemctl daemon-reload`
- `service shadowsocks-libev start`
- `sudo setcap 'cap_net_bind_service=+eip' /etc/shadowsocks-libev/v2ray-plugin`
- `sudo setcap 'cap_net_bind_service=+eip' /usr/bin/ss-server`
- ~~setcap cap_net_bind_service+ep /usr/bin/ss-server`
- `getcap /usr/bin/ss-server`
	- Result must be /usr/bin/ss-server = cap_net_bind_service+ep
- `sudo nano /etc/shadowsocks-libev/v2ray.json`
	- Сменить пароль
	- Сменить DNS сервер, например на 1.1.1.1
```
{
    "server":"0.0.0.0",
    "server_port":443,
    "password":"ваш пароль",
    "local_port":1080,
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open":true,
    "reuse_port":true,
    "plugin":"/etc/shadowsocks-libev/v2ray-plugin",
    "plugin_opts":"server",
    "nameserver":"ваш DNS сервер"
}
```
- `sudo nano /etc/systemd/system/ss-v2ray.service`
```
[Unit]
Description=Shadowsocks-libev with V2RAY-websocket obfuscation
Documentation=man:shadowsocks-libev(8)
After=network.target

[Service]
Type=simple
User=nobody
Group=nogroup
LimitNOFILE=51200
ExecStart=/usr/bin/ss-server -c /etc/shadowsocks-libev/
v2ray.json

[Install]
WantedBy=multi-user.target
```
- `sudo systemctl enable ss-v2ray.service && sudo systemctl restart ss-v2ray.service`

## Настройка клиента

### Windows:
Скачиваем клиент с [официального сайта](https://shadowsocks.org/). Переименовываем клиент в v2ray.exe.
- https://github.com/shadowsocks/shadowsocks-windows/releases
- https://cloudflare-ipfs.com/ipfs/QmZZUw2SAYE38xdF47se8QbnUtviY1dobWC6FHSiaJ6791/
- Plugin
	- v2ray-plugin-windows-amd64-v1.3.1.tar
	- Переименовываем клиент в v2ray.exe и кладем в папку в программой

В опциях плагина указываем параметр, куда «идёт» трафик.
> host=example.com.


### Linux:
Скачиваем плагин, перемещаем в тот же путь, что и на сервере.
- `sudo wget https://cloudflare-ipfs.com/ipfs/QmZZUw2SAYE38xdF47se8QbnUtviY1dobWC6FHSiaJ6791/v2ray-plugin-linux-amd64-v1.3.1.tar.gz`
- `sudo tar -xf v2ray-plugin-linux*`
- `mv v2ray-plugin_linux_amd64 /etc/shadowsocks-libev/v2ray-plugin`

Затем в config.json указываем всё то же, что указывали в v2ray.json, меняя 0.0.0.0 в строке «server» на адрес сервера, и «server» на «host=example.com» в строке «plugin_opts»​.

### Android:
Скачиваем v2ray plugin в Google Play и указываем в настройках плагина, в опции host, любой сайт​.
- https://github.com/shadowsocks/shadowsocks-android