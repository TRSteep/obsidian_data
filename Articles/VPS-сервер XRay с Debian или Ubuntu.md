#vpn
Разработчики XRay подготовили скрипт, который автоматически скачивает XRay под используемую систему и создает systemd-юнит
- https://github.com/XTLS/Xray-install
- https://xtls.github.io/en/document/level-0/ch07-xray-server.html#_7-2-%E5%AE%89%E8%A3%85-xray
	- in china
- https://github.com/XTLS/Xray-examples
	- https://github.com/XTLS/Xray-examples/blob/main/VLESS-TCP-TLS-WS%20(recommended)/README.ENG.md
	- https://github.com/XTLS/Xray-examples/tree/main/VLESS-TCP-TLS%20(minimal%20by%20rprx)
	- https://github.com/chika0801/Xray-examples
- https://habr.com/ru/articles/728836/
- 
- 

XRay установка из оф мануала
- Подготовка системы
	- `apt update && apt upgrade`
- Скрипт установки XRay
	- cd /home
	- `wget https://github.com/XTLS/Xray-install/raw/main/install-release.sh`
	- `sudo bash install-release.sh`
	- `rm /home/install-release.sh`
	- Либо
		- `bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install`
- ?? Папка для сертификатов
	- `mkdir ~/xray_cert`
	- `curl https://get.acme.sh | sh`
	- `source  ~/.bashrc`
	- `acme.sh --help`
	- `apt install idn`
```sh
acme.sh --install-cert -d freelio.sbs --ecc \
            --fullchain-file ~/xray_cert/xray.crt \
            --key-file ~/xray_cert/xray.key
```

```sh
acme.sh --issue --dns dns_gd -d betestar888.com --dns dns_gd -d *.betestar888.com --installcert --key-file /etc/nginx/cert/betestar888.com.key --fullchain-file /etc/nginx/cert/betestar888.com.crt --reloadcmd "nginx -s reload" --debug 2
```

- Сертификаты 2.0
	- `apt install certbot`
	- `certbot certonly --standalone --preferred-challenges http -d freelio.sbs`
	- `nano /etc/letsencrypt/renewal/freelio.sbs.conf`
		- Добавить в конце
			- renew_hook = systemctl reload xray
	- `nano /opt/xray/config.json` 
	- `nano /usr/local/etc/xray/` 
		- в случае использования скрипта

- Разрешение на чтение
	- `chmod +r ~/xray_cert/xray.key`
- Авто обновление сертификата
	- `nano ~/xray_cert/xray-cert-renew.sh`
```sh
#!/bin/bash

/home/vpsadmin/.acme.sh/acme.sh --install-cert -d a-name.yourdomain.com --ecc --fullchain-file /home/vpsadmin/xray_cert/xray.crt --key-file /home/vpsadmin/xray_cert/xray.key
echo "Xray Certificates Renewed"

chmod +r /home/vpsadmin/xray_cert/xray.key
echo "Read Permission Granted for Private Key"

sudo systemctl restart xray
echo "Xray Restarted"
```
- Разрешение на исполнение
	- `chmod +x ~/xray_cert/xray-cert-renew.sh`
- Crontab
	- `crontab -e`
```sh
# 1:00am, 1st day each month, run `xray-cert-renew.sh`
0 1 1 * *   bash /home/vpsadmin/xray_cert/xray-cert-renew.sh
```
- VLESS
	- единый протокол + 80 резервный порт
	- Генерирование UID
		- `xray uuid`
	- Журналирование
		- `mkdir ~/xray_log`
		- `touch ~/xray_log/access.log && touch ~/xray_log/error.log`
		- `chmod a+w ~/xray_log/*.log`
	- `sudo nano /usr/local/etc/xray/config.json````
```json
// REFERENCE:
// https://github.com/XTLS/Xray-examples
// https://xtls.github.io/config/
// 常用的 config 文件，不论服务器端还是客户端，都有 5 个部分。外加小小白解读：
// ┌─ 1*log 日志设置 - 日志写什么，写哪里（出错时有据可查）
// ├─ 2_dns DNS-设置 - DNS 怎么查（防 DNS 污染、防偷窥、避免国内外站匹配到国外服务器等）
// ├─ 3_routing 分流设置 - 流量怎么分类处理（是否过滤广告、是否国内外分流）
// ├─ 4_inbounds 入站设置 - 什么流量可以流入 Xray
// └─ 5_outbounds 出站设置 - 流出 Xray 的流量往哪里去
{
  // 1\_日志设置
  "log": {
    "loglevel": "warning", // 内容从少到多: "none", "error", "warning", "info", "debug"
    "access": "/home/vpsadmin/xray_log/access.log", // 访问记录
    "error": "/home/vpsadmin/xray_log/error.log" // 错误记录
  },
  // 2_DNS 设置
  "dns": {
    "servers": [
      "https+local://1.1.1.1/dns-query", // 首选 1.1.1.1 的 DoH 查询，牺牲速度但可防止 ISP 偷窥
      "localhost"
    ]
  },
  // 3*分流设置
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      // 3.1 防止服务器本地流转问题：如内网被攻击或滥用、错误的本地回环等
      {
        "type": "field",
        "ip": [
          "geoip:private" // 分流条件：geoip 文件内，名为"private"的规则（本地）
        ],
        "outboundTag": "block" // 分流策略：交给出站"block"处理（黑洞屏蔽）
      },
      {
        // 3.2 防止服务器直连国内
        "type": "field",
        "ip": ["geoip:cn"],
        "outboundTag": "block"
      },
      // 3.3 屏蔽广告
      {
        "type": "field",
        "domain": [
          "geosite:category-ads-all" // 分流条件：geosite 文件内，名为"category-ads-all"的规则（各种广告域名）
        ],
        "outboundTag": "block" // 分流策略：交给出站"block"处理（黑洞屏蔽）
      }
    ]
  },
  // 4*入站设置
  // 4.1 这里只写了一个最简单的 vless+xtls 的入站，因为这是 Xray 最强大的模式。如有其他需要，请根据模版自行添加。
  "inbounds": [
    {
      "port": 443,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "", // 填写你的 UUID
            "flow": "xtls-rprx-vision",
            "level": 0,
            "email": "vpsadmin@yourdomain.com"
          }
        ],
        "decryption": "none",
        "fallbacks": [
          {
            "dest": 80 // 默认回落到防探测的代理
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "tls",
        "tlsSettings": {
          "alpn": "http/1.1",
          "certificates": [
            {
              "certificateFile": "/home/vpsadmin/xray_cert/xray.crt",
              "keyFile": "/home/vpsadmin/xray_cert/xray.key"
            }
          ]
        }
      }
    }
  ],
  // 5*出站设置
  "outbounds": [
    // 5.1 第一个出站是默认规则，freedom 就是对外直连（vps 已经是外网，所以直连）
    {
      "tag": "direct",
      "protocol": "freedom"
    },
    // 5.2 屏蔽规则，blackhole 协议就是把流量导入到黑洞里（屏蔽）
    {
      "tag": "block",
      "protocol": "blackhole"
    }
  ]
}

```
- Запуск службы
	- `sudo systemctl start xray`
	- `sudo systemctl status xray`
		- `sudo systemctl stop xray`
		- `sudo systemctl restart xray`
		- `sudo systemctl disable xray`
		- `sudo systemctl enable xray`
- BBR
	- `sudo nano /etc/apt/sources.list`
	- Добавить
		- `deb http://deb.debian.org/debian buster-backports main`
	- `sudo apt update && sudo apt -t buster-backports install linux-image-amd64`
	- `sudo nano /etc/sysctl.conf`
		- Добавить
			- `net.core.default_qdisc=fq`
			- `net.ipv4.tcp_congestion_control=bbr`
	- `sudo reboot`
	- `lsmod | grep bbr`
		- Результат должен быть такой
		- tcp_bbr
- Перенаправление на https
	- `sudo nano /etc/nginx/nginx.conf`
		- `return 301 https://$http_host$request_uri;`
```nginx
server {
   listen 127.0.0.1:8080;
   root /home/vpsadmin/www/webpage;
   index index.html;
   add_header Strict-Transport-Security "max-age=63072000" always;
}
```
- `sudo systemctl restart nginx`
- `sudo nano /usr/local/etc/xray/config.json`
	- `sudo systemctl restart xray`

### Клиенты
- Windows - v2rayN
	- https://github.com/2dust/v2rayN/releases
- Linux
- Android - 
	- NecoRay
		- `wget -qO- https://raw.githubusercontent.com/ohmydevops/nekoray-installer/main/installer.sh | bash`
	- NekoBox
		- https://github.com/MatsuriDayo/NekoBoxForAndroid/releases
		- Есть возможность роутить как приложения, так и домены и IP
		- Можно пускать в обход туннеля VPN  и в другой туннель
	- v2rayNG
		- https://github.com/2dust/v2rayNG/releases
- iPhone
	- 
- Мультиплатформенный - Qv2ray
	- https://github.com/Qv2ray/Qv2ray/releases