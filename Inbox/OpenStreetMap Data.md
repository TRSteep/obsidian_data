#gis #dev #python 
# Info
**OpenStreetMap** предоставляет геоданные всего мира, вносимые пользователями
Система хранит данные в [PostgreSQL](https://wiki.openstreetmap.org/wiki/PostgreSQL "PostgreSQL") c [PostGIS](https://wiki.openstreetmap.org/wiki/PostGIS "PostGIS") далее рендерит карту с помощью [Mapnik](https://wiki.openstreetmap.org/wiki/Mapnik "Mapnik"). Внутри OSM XML конвертируется в PostGIS
Slippy Map - веб-интерфейс для просмотра преобразованных рендером данных OpenStreetMap
Редакторы:
- https://www.openstreetmap.org/
- https://josm.openstreetmap.de/
- Mobile
	- https://vespucci.io/
	- https://github.com/streetcomplete/StreetComplete/
Существует несколько вариантов работы:
- онлайн через API OSM
	- https://wiki.openstreetmap.org/wiki/API
	- оптимизирован для записи
- онлайн через Overpass API
	- https://wiki.openstreetmap.org/wiki/Overpass_API
	- оптимизирован для чтения
	- зависит от открытых серверов, 
	- менее 10.000 запросов в день или скачиваете менее 5 ГБ данных в день
- офлайн, загрузив предварительно данные
	- https://wiki.openstreetmap.org/wiki/Planet.osm
	- Size
		- 1930.5 GB - OSM XML
		- 140.2 GB - bzip2-compressed
		- 75.7 GB - PBF-compressed
	- Example
		- `curl -OL https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf`
	- OpenStreetMap Data Extracts
		- https://download.geofabrik.de/
- Поиск обьектов
	- https://overpass-turbo.eu

Modules
- GeoPy
	- https://www.geeksforgeeks.org/how-to-get-geolocation-in-python/?ref=ml_lbp
	- https://medium.com/@happynehra/getting-started-with-geocoding-in-python-finding-coordinates-made-easy-4e1e406679c5
	- https://geopy.readthedocs.io/en/stable/index.html?highlight=type#geopy.location.Location.latitude
	- https://thepythoncode.com/article/get-geolocation-in-python
- overpy
	- https://python-overpy.readthedocs.io/en/latest/example.html
	- https://github.com/DinoTools/python-overpy
	- https://dzen.ru/a/Xuu2qj1pCylzI7pc
- https://habr.com/ru/articles/320562/
	- https://github.com/mvexel/overpass-api-python-wrapper
	- https://wiki.openstreetmap.org/wiki/RU:Overpass_API
		- https://wiki.openstreetmap.org/wiki/RU:Overpass_API/Overpass_QL
		- https://wiki.openstreetmap.org/wiki/OSMPythonTools
- ???
	- https://stackoverflow.com/questions/28476117/easy-openstreetmap-tile-displaying-for-python
	- Live Action Map
		- https://github.com/trananhkma/fucking-awesome-python?tab=readme-ov-file#geolocation
	- geopandas
		- https://geopandas.org/en/stable/docs/reference/api/geopandas.GeoSeries.get_coordinates.html
		- https://gis.stackexchange.com/questions/433460/extracting-latitude-and-longitude-pairs-as-list-from-linestring-in-geopandas
	- https://github.com/trananhkma/fucking-awesome-python?tab=readme-ov-file#geolocation
	- https://github.com/china-testing/python-api-tesing?tab=readme-ov-file#%E5%9C%B0%E7%90%86%E4%BD%8D%E7%BD%AEgeolocation
	- https://github.com/EdwardBetts/osm-wikidata
	- https://github.com/dersteppenwolf/pycon
	- https://medium.com/@skavinskyy/geocoding-addresses-to-get-latitude-and-longitude-with-google-api-e85f159069a3
	- https://developers.arcgis.com/python/samples/openstreetmap-exploration/

# Library
## Framework
- Nominatim
	- Nominatim uses OpenStreetMap data to find locations on Earth by name and address (geocoding)
	- https://nominatim.org/
	- https://github.com/osm-search/Nominatim
	- Nominatim API
		- https://nominatim.org/release-docs/develop/api/Overview/
		- https://nominatim.org/release-docs/latest/api/Search/
		- /search - search OSM objects by name or type
		- /reverse - search OSM object by their location
		- /lookup - look up address details for OSM objects by their ID
		- /status - query the status of the server
		- /polygons - list of broken polygons detected by Nominatim
		- /details - show internal details for an object (for debugging only)
- photon (based on Java)
	- https://github.com/komoot/photon
	- https://photon.komoot.io/
	- open source geocoder built for OpenStreetMap data use Nominatim
	- Minutely up to date OSM data

## Python Lib
- Python wrapper (overpass)
	- https://github.com/mvexel/overpass-api-python-wrapper
	- https://overpass-api.de/
	- https://dev.overpass-api.de/overpass-doc/en/
- OverPy
	- продвинутый Python wrapper
- geopy (worked)
	- Get location from address, find address and get address from location
	- https://github.com/geopy/geopy
	- use
		- https://geopy.readthedocs.io/en/latest/#module-geopy.geocoders
		- https://geopy.readthedocs.io/en/latest/#specifying-parameters-once
		- https://www.geeksforgeeks.org/how-to-get-geolocation-in-python/?ref=header_search
		- https://www.linuxfordevices.com/tutorials/geopy-geocode-locations-python
		- https://thepythoncode.com/article/get-geolocation-in-python
		- Pandas
			- https://www.datacamp.com/tutorial/geocoding-for-data-scientists
- **Overpass**
	- https://pypi.org/project/overpass/
	- https://github.com/drolbr/Overpass-API
	- use
		- https://towardsdatascience.com/loading-data-from-openstreetmap-with-python-and-the-overpass-api-513882a27fd0
		- https://github.com/mocnik-science/osm-python-tools/blob/main/docs/overpass.md
	- Overpass turbo
		- https://wiki.openstreetmap.org/wiki/Overpass_turbo
		- https://overpass-turbo.eu/ Online
	- query-overpass
		- https://www.npmjs.com/package/query-overpass
- **OSMPythonTools**
	- https://wiki.openstreetmap.org/wiki/OSMPythonTools
	- https://github.com/mocnik-science/osm-python-tools
- geojson
	- Create geo figures on map
	- https://github.com/jazzband/geojson
- geoip-api-python
	- Get location from IP
	- https://github.com/maxmind/geoip-api-python
- GeoIP
	- https://github.com/maxmind/geoip-api-python
	- Get location from IP
- GeoDjango
	- https://docs.djangoproject.com/en/dev/ref/contrib/gis/
	- geographic web framework
- Django Countries
	- https://github.com/SmileyChris/django-countries
	- https://docs.djangoproject.com/en/dev/ref/contrib/gis/
	- https://docs.djangoproject.com/en/dev/ref/contrib/gis/tutorial/#introduction
	- provides a country field for models and forms