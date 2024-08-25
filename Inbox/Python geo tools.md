#python #dev #osm #map

# Library
- ### OSMPythonTools v0.3.5
	- **nominatim**
		- Для работы с поиском адреса и области по заданному тексту или координатам
		- Либо наоборот поиска координат по заданному тексту
	- **overpassQueryBuilder**
		- создание запроса поиска информации для overpass
	- **overpass**
		- поиск информации на карте OSM по ключам

# Find Area ID by search name
- Поиск ID области по тексту
- Если область не найдена, то результат 0
```python
from OSMPythonTools.nominatim import Nominatim  
nominatim = Nominatim()

def get_area_id(area: str) -> int:  
    """  
    Get area text for search - return area ID in wikidata or 0 if not found    :param area: area text for search    :return: area ID in wikidata  
    """    area_id = nominatim.query(area).areaId()  
    if area_id is None:  
        area_id = 0  
    return area_id
```

# Get Coordinates by search address
- Поиск координат по тексту
```python
from OSMPythonTools.nominatim import Nominatim  
nominatim = Nominatim()

def get_location_from_addr(address: str) -> tuple:  
    """  
    Get coordinates from input    :param address: Text for search     coordinates    :return: latitude and longitude  
    """    get_location = nominatim.query(address)  
    latitude = get_location[0].lat  
    longitude = get_location[0].lon  
    return latitude, longitude
```

# Find address by coordinates
- Поиск адреса по ккординатам
```python
from OSMPythonTools.nominatim import Nominatim
nominatim = Nominatim()

def get_address_from_point(latitude: float, longitude: float) -> str:  
    """  
    Get Address from coordinates (latitude and longitude)    :param latitude: coordinate that specifies the north–south position Float    :param longitude: coordinate that specifies the east–west position Float    :return: Text with address  
    """    address = None  
    while address is None:  
        geo_location = nominatim.query(latitude, longitude, reverse=True)  
        if geo_location.displayName() is None:  
            exit()  
        else:  
            address = geo_location.displayName()  
    address_text = f'Address: \n {address}'  
    return address_text
```

# Find landmark in Area
- Поиск объектов по ключам в заданной по ID побласти
```python
from OSMPythonTools.overpass import overpassQueryBuilder  
from OSMPythonTools.overpass import Overpass  
overpass = Overpass()

def get_landmarks_nw_in_area(area_id: int, key_name: str, key_value: str, count: int) -> tuple:  
    """  
    Get Landmarks data from area with keys for search (OSM)    :param area_id: ID of area, get by nominatim    :param key_name: key name in OSM api    :param key_value: key value in OSM api    :param count: limit elements    :return: Landmarks data  
    """
    # Query  
    selector = f'"{key_name}"="{key_value}"'  
    out = f'center {count}'  
    query = overpassQueryBuilder(area=area_id, elementType=['node', 'area'], selector=selector, out=out)  
    # elementType = ['node', 'area']  
    # out='body', 'center'    # Landmarks    try:  
        landmarks_res = overpass.query(query)  
        landmarks = landmarks_res.elements()  
    except (Exception, BaseException):  
        landmarks = None  
    return landmarks
```

# Find landmark in Radius
- Поиск объектов по ключам в заданной по координате и радиусу области
```python
from OSMPythonTools.overpass import Overpass  
overpass = Overpass()

def get_landmarks_nw_in_radius(latitude: float, longitude: float, radius: int,  
                               key_name: str, key_value: str, count: int) -> tuple:  
    """  
    Get Landmarks data from coordinates, radius in meters with keys for search (OSM)    :param latitude: latitude    :param longitude: longitude    :param radius: radius search in meters    :param key_name: key name in OSM api    :param key_value: key value in OSM api    :param count: limit elements    :return: Landmarks data  
    """  
    # Query
    out = f'center {count}'  
    query = f'(nw[{selector}](around:{radius},{latitude},{longitude}););out {out};'  
    try:  
        landmarks_res = overpass.query(query)  
        landmarks = landmarks_res.elements()  
    except (Exception, BaseException):  
        landmarks = None  
    return landmarks
```