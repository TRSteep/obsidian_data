#debian #firewall #linux 

# Info
- https://ru.linux-console.net/?p=21119
- https://computingforgeeks.com/how-to-install-and-configure-firewalld-on-debian/

# Troubleshooting Firewalld Issues
## Investigating Firewalld Issues
- Checking Firewalld Status
	- `sudo firewall-cmd --state`
	- `sudo systemctl status firewalld`
- Check Rules
	- `sudo firewall-cmd --list-all`
- Reviewing Firewalld Logs
	- `sudo journalctl -u firewalld`
- Verifying Configuration
	- `sudo less /etc/firewalld/firewalld.conf`
## Resolving Common Firewalld Issues
- Issue: Firewalld not Responding to Commands
	- `sudo firewall-cmd --reload`
- Issue: Need to Reset Firewalld to Defaults
	- `sudo firewall-cmd --complete-reload`
- Issue: Need to Remove a Specific Rule
	- `sudo firewall-cmd --permanent --zone=public --remove-service=http`
### Issue: The firewall Rule is Not Working
- Scenario: You Didn’t Assign the Interface to the Correct Zone
	- `sudo firewall-cmd --zone=internal --list-interfaces`
	- If the output doesn’t include your intended interface, you can assign it
		- `sudo firewall-cmd --zone=internal --add-interface=eth1`
- Scenario: The Zone Doesn’t Enable the Service
	-  if a zone has a service enabled
		- `sudo firewall-cmd --zone=dmz --query-service=http`
	- If the service isn’t active
		- `sudo firewall-cmd --zone=dmz --add-service=http`

# Основные концепции в firewalld
## Zones
Зоны представляют собой набор правил, который определяет разрешенный трафик в зависимости от уровня доверия в сети. Зоне назначаются сетевые интерфейсы, определяющие поведение, которое должен разрешать брандмауэр.
- drop:
	- самый низкий уровень доверия. Все входящие соединения отбрасываются без ответа и разрешаются только исходящие соединения.
- block:
	- аналогично вышеописанному, но запросы входящих соединений не просто отбрасываются, а отклоняются с сообщением icmp-host-prohibited или icmp6-adm-prohibited.
- ### public:
	- публичные сети, к которым нет доверия. Вы не доверяете другим компьютерам, но можете разрешать отдельные входящие соединения на разовой основе.
- external:
	- внешние сети, если вы используете брандмауэр в качестве шлюза. Эта зона настроена для маскировки NAT, чтобы ваша внутренняя сеть оставалась частной, но доступной.
- dmz (Demilitarized Zone):
	- используется для компьютеров в ДМЗ (изолированные компьютеры, у которых нет доступа к остальной части вашей сети). Разрешены только некоторые входящие соединения.
- work:
	- используется для рабочих компьютеров. Большинство компьютеров в сети являются доверенными. Могут быть разрешены некоторые дополнительные службы.
- ### home:
	- домашняя среда. Обычно подразумевается, что вы доверяете большей части других компьютеров и что будут приниматься запросы еще нескольких служб.
- internal:
	- другая сторона внешней зоны, используемая для внутренней части шлюза. Компьютеры в основном достойны доверия, доступны некоторые дополнительные службы.
- trusted:
	- все компьютеры в сети являются доверенными. Наиболее открытый из доступных вариантов, который следует использовать с осторожностью.

## Постоянство правил
правила можно применять к текущему набору правил времени исполнения или использовать как постоянные
Временные правила позволяют не потерять контроль к серверу
Большинство операций firewall-cmd могут принимать флаг --permanent, указывающий на необходимость применения изменений к постоянной конфигурации. 

# Install
- Установка
	- `apt install firewalld`
- Сервис автозапуска
	- `systemctl enable firewalld`
	- `systemctl start firewalld`
	- OR
		- `sudo systemctl enable --now firewalld`
- Проверка работы и доступность службы, можно использовать следующую команду:
	- `sudo firewall-cmd --state`
	- `sudo firewall-cmd --version`

# Config
- general syntax of Firewalld commands
	- `firewall-cmd [options] command`
-  Specifies the zone to operate on. default zone is 
	- `--zone=zone`
- Adds the specified service to the zone. The change is effective immediately but not persistent across reboots unless --permanent is added.
	- `--add-service=service`
- Lists all currently active zones along with their associated interfaces.
	- `--get-active-zones`
- Lists all available services known to Firewalld
	- `--get-services`
- Reloads the Firewalld configuration, implementing any changes made with --permanent without requiring a system reboot
	- `--reload`

## Zones
### Default zone
- Displaying Default Zone
	- `firewall-cmd --get-default-zone`
- Changing the Default Zone
	- `sudo firewall-cmd --set-default-zone=your_zone_name`

### Listing all Active Firewalld Zones
- `sudo firewall-cmd --get-active-zones`

## Services
### Listing Services in a Zone
- `sudo firewall-cmd --zone=your_zone_name --list-services`

### Adding a Service to a Zone
- `sudo firewall-cmd --zone=your_zone_name --add-service=your_service_name`


## Advanced Firewalld Commands and Scenarios
### Enabling Masquerading
- `sudo firewall-cmd --zone=public --add-masquerade`

### Forwarding Ports
- `sudo firewall-cmd --zone=public --add-forward-port=port=5000:proto=tcp:toport=80`

### Defining a New Service
- `sudo firewall-cmd --permanent --new-service=myservice`
- `sudo firewall-cmd --permanent --service=myservice --set-short="My Custom Service"`
### Adjusting Default Zone
- `sudo firewall-cmd --set-default-zone=home`
### Creating a Custom Zone
- `sudo firewall-cmd --permanent --new-zone=customzone`
