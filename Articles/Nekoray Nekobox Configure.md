#vpn #vmess #vless 

# Info
- https://matsuridayo.github.io/index_docs/
- https://www.v2fly.org/config/routing.html
- Режимы работы ядра
	- Xray - более совместимый
	- Sing-box - поддерживает больше новых протоколов

---
# Application OS
## Android
- App
	- NecoBox
		- https://github.com/MatsuriDayo/NekoBoxForAndroid/releases
			- https://play.google.com/store/apps/details?id=moe.nb4a
	- husi
		- https://github.com/xchacha20-poly1305/husi/releases

## Windows
- https://github.com/MatsuriDayo/nekoray/releases

## Linux
- https://github.com/MatsuriDayo/nekoray/releases

---
# Configure
### Info
- https://www.v2fly.org/config/routing.html
### Настройка серверов
- Подписка
	- Группа→Создать группу→Тип группы: Подписка
- Добавление серверов отдельно
- JSON
	- https://matsuridayo.github.io/n-configuration/#json
```json
{
    "type": "wireguard",
    "system_interface": false,
    "interface_name": "wg0",
    "local_address": [
        "10.0.0.2/32"
    ],
    "private_key": "YNXtAzepDqRv9H52osJVDQnznT5AM11eCK3ESpwSt04=",
    "peer_public_key": "Z1XXLsKYkYxuiYjJIkRvtIKFepCYHTgON+GwPq7SOV4=",
    "pre_shared_key": "31aIhAPwktDGpH4JDhA8GNvjFXEf/a6+UaQRyOAiyfM=",
    "mtu": 1408
}
```

---
### Настройка маршрутов
Default options
```json
{
    "rules": [
    ]
}
```
- https://matsuridayo.github.io/n-configuration/#json
- https://www.v2fly.org/config/routing.html
- Политика
	- IPIfNonMatch
- домен (без поддоменов)
	- google.com
	- full:google.com
- домен + поддомены
	- domain:google.com
- regexp
	- `regexp:\.goo.*\.com$`
		- соответствует www.google.com, fonts.googleapis.com, но не соответствует google.com
- строка в адресе
	- keyword:sina.com
		- может соответствовать sina.com, sina.com.cn, но не sina.cn или www.sina.company
- Предопределенные имена
	- geosite:cn
		- список из https://github-com.translate.goog/v2fly/domain-list-community
	- geosite:category-ads-all
	- geosite:category-porn
	- geosite:private
	- geosite:tiktok
	- geosite:category-anticensorship
	- geosite:category-media
	- geosite:category-media
	- geosite:category-dev
	- geosite:geolocation-!cn
- Определенные в файле
	- ext:geosite.dat
- ГЕО IP
	- geoip:ru

- JSON
```json
{
    "domainStrategy": "AsIs",
    "domainMatcher": "mph",
    "rules": [],
    "balancers": []
}
```
```JSON
{
    "rules": [
        {
            "domain": [
                "regexp:.*\\.ir$"
            ],
            "outboundTag": "direct",
            "type": "field"
        }
    ]
}
```

- domainStrategy
	- **AsIs**: использовать только доменные имена для выбора маршрутизации, значение по умолчанию
	- **IPIfNonMatch**: Если доменное имя не соответствует никаким правилам на основе доменного имени, разрешите доменное имя в IP (запись A или запись AAAA) и выполните сопоставление на основе правил IP
	- **IPOnDemand**: Если во время сопоставления обнаруживается какое-либо правило на основе IP, имя домена будет немедленно преобразовано в IP для сопоставления
- domainMatcher
	- linear: использовать алгоритм линейного сопоставления, значение по умолчанию
	- mph: использовать алгоритм минимального идеального хеширования
		- скорость сопоставления увеличена примерно на 30%, а использование памяти уменьшено примерно на 15%
- rules
	- Для каждого соединения маршрутизация будет оцениваться в соответствии с этими правилами по очереди. Когда правило вступит в силу, соединение будет перенаправлено на то, которое оно указывает outboundTag(или balancerTagV2Ray 4.4+). Если ни одно правило не соответствует, трафик по умолчанию перенаправляется на первое outbound
- balancers
	- Массив, каждый элемент которого представляет собой конфигурацию балансировщика нагрузки. Когда правило указывает на балансировщик нагрузки, V2Ray выбирает его через этот балансировщик нагрузки outbound и перенаправляет на него трафик

Правила
- Если одновременно указано несколько атрибутов, эти атрибуты должны быть удовлетворены одновременно, чтобы текущее правило вступило в силу. То есть правила domainsи ipнужно использовать отдельно.

```json
{
    "domainMatcher": "mph",
    "type": "field",
    "domains": [
        "baidu.com",
        "qq.com",
        "geosite:cn",
        "ext:customizedGeoSiteFile.dat:cn"
    ],
    "ip": [
        "0.0.0.0/8",
        "10.0.0.0/8",
        "fc00::/7",
        "fe80::/10",
        "geoip:cn",
        "geoip:!cn",
        "ext:customizedGeoIPFile.dat:cn",
        "ext:customizedGeoIPFile.dat:!cn",
        "ext-ip:customizedGeoIPFile.dat:cn",
        "ext-ip:customizedGeoIPFile.dat:!cn"
    ],
    "port": "53,443,1000-2000",
    "sourcePort": "53,443,1000-2000",
    "network": "tcp",
    "source": [
        "10.0.0.1"
    ],
    "user": [
        "love@v2ray.com"
    ],
    "inboundTag": [
        "tag-vmess"
    ],
    "protocol": [
        "http",
        "tls",
        "bittorrent"
    ],
    "attrs": "attrs[':method'] == 'GET'",
    "outboundTag": "direct",
    "balancerTag": "balancer"
}

```
