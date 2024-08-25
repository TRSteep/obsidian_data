#linux #log

# Info
- https://habr.com/ru/companies/ruvds/articles/533918/

# Общая информация о логах
## Systemd
состоит из трех основных компонентов: 
- systemd — менеджер системы и сервисов
- systemctl — утилита для просмотра и управление статусом сервисов
- systemd-analyze — предоставляет статистику по процессу загрузки системы, проверяет корректность unit-файлов и так же имеет возможности отладки systemd
## Journald
системный демон журналов systemd. централизованно управлять системными логами от процессов, приложений и т.д. он собирает логи со всей системы и сохраняет их в бинарных файлах. (легко конвертируется в JSON)
### Файл конфигурации journald
- `/etc/systemd/journald.conf`

### Каталог с журналом journald
- `/run/log/journal`
	- Файлы хранятся в бинарном формате, поэтому нормально их просмотреть с помощью cat или nano, как привыкли многие администраторы — не получится.

## Настройка хранения журналов 
По умолчанию journald перезаписывает свои журналы логов при каждой перезагрузке, и вызов journalctl выведет журнал логов начиная с текущей загрузки системы. 

# Просмотр и анализ логов
 - `journalctl --utc`

## Фильтрация событий по важности
- `journalctl -p 0`
### Уровни важности
- 0: emergency (неработоспособность системы)
- 1: alerts (предупреждения, требующие немедленного вмешательства)
- 2: critical (критическое состояние)
- 3: errors (ошибки)
- 4: warning (предупреждения)
- 5: notice (уведомления)
- 6: info (информационные сообщения)
- 7: debug (отладочные сообщения)