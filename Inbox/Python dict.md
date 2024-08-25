#python #dev 

## Create dict
```python
d = {}
# or
d = {'dict': 1, 'dictionary': 2}
# {'dict': 1, 'dictionary': 2}

# dict func
d = dict(short='dict', long='dictionary')
# {'short': 'dict', 'long': 'dictionary'}

# fromkeys
d = dict.fromkeys(['a', 'b'])
# {'a': None, 'b': None}
d = dict.fromkeys(['a', 'b'], 100)
# {'a': 100, 'b': 100}

# generate
d = {a: a ** 2 for a in range(7)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36}
```

## Get values
```python
d = {1: 2, 2: 4, 3: 9}
d[1]
# 2
```

## Methods
```python
dict.clear() - очищает словарь.
dict.copy() - возвращает копию словаря.
classmethod dict.fromkeys(seq[, value]) - создает словарь с ключами из seq и значением value (по умолчанию None).
dict.get(key[, default]) - возвращает значение ключа, но если его нет, не бросает исключение, а возвращает default (по умолчанию None).
dict.items() - возвращает пары (ключ, значение).
dict.keys() - возвращает ключи в словаре.
dict.pop(key[, default]) - удаляет ключ и возвращает значение. Если ключа нет, возвращает default (по умолчанию бросает исключение).
dict.popitem() - удаляет и возвращает пару (ключ, значение). Если словарь пуст, бросает исключение KeyError. Помните, что словари неупорядочены.
dict.setdefault(key[, default]) - возвращает значение ключа, но если его нет, не бросает исключение, а создает ключ со значением default (по умолчанию None).
dict.update([other]) - обновляет словарь, добавляя пары (ключ, значение) из other. Существующие ключи перезаписываются. Возвращает None (не новый словарь!).
dict.values() - возвращает значения в словаре.
```
