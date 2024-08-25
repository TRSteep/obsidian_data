#osm #map #article
# Links
- https://nixintel.info/osint-tools/getting-started-with-overpass-turbo-part-1/
- https://nixintel.info/osint-tools/getting-started-with-overpass-turbo-part-2/

# Объекты на карте
Базово все объекты на карте бывают трех элементов
- **Node** (точка) - имеет уникальный ID и координаты + не обязательные теги
- **Way** - группа из точек, бывает в виде:
	- **Line** (линия) - незамкнутая группа точек, имеет тип + теги
	- **Closedway** - замкнутая группа точек (забор)
	- **Area** or Shape (фигура) - замкнутая группа точек с площадью (здание)
		- area=yes
- **Relation** (связь) - содержит Way + Node (не для всех типов)

## Внутренняя структура объектов
- Node
- Way
	- Line
	- Area
		- `_json`
			- type - way
			- id - уникальный id
			- [nodes] - точки
				- `__len__` - количество точек
				- номер точки от нуля до len-1
			- [tags] - теги объекта (опциональны)
				- `__len__` - количество тегов от нуля до len-1
				- name - название
				- для здания
					- building = yes (или другие)
					- адрес
						- addr:city
						- addr:street
						- addr:housenumber
						- addr:postcode
				- прочие группы указаны в Tag

# Tags
- [OpenStreetMap Edit map (tags)](OpenStreetMap%20Edit%20map%20(tags).md)
- https://taginfo.openstreetmap.org/