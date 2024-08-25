#python #dev #template

# Для любого приложения

Main structure
- LICENSE
- README.md
- requirements.txt
- main.py
- .gitignore
	- ignored files for Git
- src
	- modules
- db
	- database
- cfg
	- config files (not for public)
- logs
	- logs files (not for public)
- 

## Requirements.txt
```python
pyTelegramBotAPI==4.20.0  
requests==2.32.3  
geopy==2.4.1  
loguru==0.7.2  
wikipedia==1.4.0  
configparser~=7.0.0
```

## README.md
```python
Installation
How to Use
Examles
Classes and Functions Explained
Known Issues
Versions
References
Acknowledgements
Future Plans
Dependencies
Contact Information
Instructions for Contributing
```

## License
```python
Some of the most common copyleft open source licenses are:

    GNU GPL (strong copyleft)
    Eclipse Public License 2.0 (weak copyleft)
    LGPL (weak copyleft)
    Common Development and Distribution License, CDDL, (weak copyleft)

And some of the popular permissive open source licenses are:

    Apache-2.0
    MIT License
    Berkeley Software Distribution, BSD
```

---
# Для пакетов Python
## `__init__.py`
Пустой файл. Его наличие указывает интерпретатору Python, что данный каталог следует рассматривать как Python пакет.

## Setup.py
```python

import setuptools
from setuptools import setup

with open("README.md", 'r') as f:
    long_description = f.read()

setup(
	name='Watermarkd',
	version='0.7.1.2',
	description='A friendly watermarking tool with optional GUI component.',
	license="Apache-2.0",
	long_description=long_description,
	long_description_content_type="text/markdown",
	author='holypython.com',
	author_email='watermarkd@holypython.com',
	url="https://holypython.com/",
	download_url = 'https://github.com/holypython/Watermarkd/archive/0.7.1.2.tar.gz',
	packages=['Watermarkd'],
	install_requires=[
	    'pillow',
	    'pysimplegui',
	],
	
	python_requires='>=3.6'
)
```