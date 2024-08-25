#pandas #python 

## Example of data frame
```python
import pandas as pd
data = {'name': ['John', 'Anna', 'Peter', 'Linda'],
        'age': [25, 32, 45, 28],
        'city': ['New York', 'Paris', 'London', 'Tokyo']}

df = pd.DataFrame(data)
```

## Удалить строки по индексу или по условию
Drop строки с индексами 0 и 2
```python
df.drop([0, 2], inplace=True)
```
Параметр inplace=True указывает на то, что изменения должны быть внесены в сам DataFrame

## Удаление строк по условию
Удаляем строки, где возраст больше 35
```python
df.drop(df[df['Возраст'] > 35].index, inplace=True)
```

## Использование метода query()
Этот метод позволяет нам выполнять запросы к DataFrame с использованием SQL-подобного синтаксиса
Удаляем строки, где возраст больше 35
```python
df = df.query('Возраст <= 35')
```

