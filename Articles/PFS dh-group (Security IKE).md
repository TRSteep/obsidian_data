#vpn #security 
Perfect Forward Secrecy (PFS)
позволяет удостовериться, что ключи, которые используются на второй фазе (то есть, для защиты данных), не были получены из ключей на первой фазе
При включенном PFS во время второй фазы выполняется генерация нового ключа с помощью алгоритма DH. PFS DH Group - длина ключа PFS.

## Diffie-Hellman group (DH group)
Таблица соответствия
- Avoid
	- `group1`—768-bit MODP
	- `group2`—1024-bit MODP
	- `group5`—1536-bit MODP
- Minimum
	- `group14`—2048-bit MODP
- Use IKE Group
	- `group15`—3072-bit MODP
	- `group16`—4096-bit MODP
- Recommended
	- `group19`—256-bit random Prime ECP
- Next Generation Encryption
	- `group20`—384-bit random ECP
	- `group21`—521-bit random ECP
		- use with a 256-bit key or higher
	- `group24`—2048-bit MODP Group with 256-bit prime order subgroup.
		- use with a 256-bit key or higher

## Алгоритмы
- MODP - More Modular Exponential Diffie-Hellman groups
	- модульный экспоненциальный алгоритм
- ECP - Elliptic Curve Groups
	- случайные эллиптические кривые группы по модулю алгоритма Prime

## Рекомендации
- Использовать минимум 15 группу (group15)
- Лучше, выше 19 (group19)
- Для шифрования используйте AES.
- with a 256-bit key or higher, use DH group 21 or 24

## Info
- https://security.stackexchange.com/questions/196832/which-pfs-group-is-recommended-for-ipsec-configuration
- https://www.keylength.com/en/compare/