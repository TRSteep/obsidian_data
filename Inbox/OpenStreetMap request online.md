#map 

- https://overpass-turbo.eu
- Overpass API Language Guide
	- https://wiki.openstreetmap.org/wiki/Overpass_API/Language_Guide

## Теги Для поиска и вывода данных
- ### tourism
	- attraction - стоит посетить
	- viewpoint - точка обзора
	- museum
	- hotel, apartment, motel
	- camp_site, camp_pitch
	- gallery
	- zoo, aquarium
- ### historic
	- yes
	- memorial, monument
	- building
	- castle, fort, cannon
	- city_gate
	- stone
	- ruins
	- aircraft
	- archaeological_site
	- boundary_stone
- ### building
	- church
- ### amenity
	- place_of_worship - церковь
	- fountain
	- restaurant, fast_food, cafe
	- toilets
	- bicycle_parking
	- parking, parking_space, fuel
	- community_centre
	- bank
	- hospital, clinic
	- police
- ### leisure
	- park
- ### water (drinking_water: yes)
	- lake
	- river
	- fountain
	- stream - источник или поток
	- reservoir - водохранилище
- ### waterway
	- waterfall - водопад
- ### natural
	- water
	- peak (Elevation)
	- beach
	- cave_entrance
	- spring - родник
	- grassland
	- coastline
	- cliff (скала)
	- ridge - горный хребет
- ### place
	- island
- ### Info
	- wikipedia
	- wikidata

## Area
- найти на WikiData
	- https://www.wikidata.org/wiki/Q911
		- пример для уфы Q911
- Задать точками
	- node(50.745,7.17,50.75,7.18);

## QL Basics
- Type of object
	- node - search for nodes (points)
	- way - дороги
	- rel (short for "relation") связные обьекты
	- nwr (short for a union of node+way+relation)
	- example
		- `node["name"="Berlin"];`
- Tag request
	- Key
		- `["key"]`
	- NOT Key
		- `[!"key"]`
	- Key and Value
		- `["key"="value"]`
	- Key NOT Value
		- `["key"!="value"]`
	- Key and RegExp Value
		- `["key"~"value"]`
	- Key and NOT RegExp Value
		- `["key"!~"value"]`
	- RegExp for Key and Value
		- `[~"key"~"value"]`
- Bounding box clauses ("bbox query")
	- `/*your query here*/(51.0, 7.0, 52.0, 8.0)`
	- example
		- `node(50.746,7.154,50.748,7.157);out body;`
			- выводит точки в квадрате
		- `way(50.746,7.154,50.748,7.157);(._;>;);out body;`
			- выводит точки в квадрате + дороги, даже если они уходят за квадрат
		- `relation(50.746,7.154,50.748,7.157);(._;>;);out body;`
			- выводит точки в квадрате + все связанные обьекты, даже если они уходят за квадрат
	- Node by name 
		- `node["name"="Gielgen"];out body;`
	- Node by name and location
		- `node["name"="Gielgen"](50.7,7.1,50.8,7.2);out body;`
	- Node by regexp name
		- `node["name"~"holtorf"](50.7,7.1,50.8,7.25);out body;`
	- Node by different letter in word
		- `node["name"~"H[oôóòö]ltorf"](50.7,7.1,50.8,7.25);out body;`
- Area clauses ("area filters")
	- by number
		- `(area:2400000001)`
		- `(area:3600000001)`
	- Selecting areas by name
		- `{{geocodeArea:"United Kingdom"}}->.a;`
			- /* finds an area tagged with "name"="United Kingdom" */
		- `{{geocodeArea:"GB"}}->.a;`
			- /* finds an area tagged with "ISO3166-1"="GB" */
		- queries above will return (into the result set "a")
			- ` /*your query here*/(area.a)`
- Special clauses ("special filters")
	- (around:value)
	- (type:value)

---
# Поисковые запросы
```json
// QL Basics

```
## Визуальный поиск в центре карты
```xml
<query type="node">
  <around {{center}} radius="300.0"/>
  <has-kv k="amenity" v="cafe" />
</query>
<print />
```

Все мемориалы и монументы в Башкортостане
```json
[out:json][timeout:25];
area["wikidata" = "Q5710"]->.place;
// From WikiData
// Ufa Q911, RB Q5710, Russia Q159, KZ Q232, AM Q399, TR Q43
node["historic"~"memorial|monument"](area.place);
out body;
```

Все озера в Башкортостане
```json
[out:json][timeout:25];
area["wikidata" = "Q5710"]->.place;
nwr["water" = "lake"](area.place);
(._;>;);
out body;
```

Все пляжи в Башкортостане
```json
[out:json][timeout:25];
area["wikidata" = "Q5710"]->.place;
nwr["natural" = "beach"](area.place);
(._;>;);
out body;
```

---

## Найти остановки в радусе от координат
```json
[out:json];
(
  node["public_transport"="platform"](around:500,54.739,55.956);
);
out body center qt;
>;
out skel qt;
```

## Все музей в радусе
```json
[out:json];
(
  node["tourism"="museum"](around:1000,54.739,55.956);
);
out body;
```

### Все музеи Уфы
```json
[out:json][timeout:25];
// fetch area “Ufa” to search in
{{geocodeArea:Ufa}}->.searchArea;
// gather results
nwr["tourism"="museum"](area.searchArea);
// print results
out geom;
```
Еще вариант
- script should time out after waiting for 25 seconds
- assigns the area called Ufa to a variable called searchArea
	- Если сделать **Convert to OverpassQL** , то он заменит area на ее номер
		- area(3601549169)
```json
[out:json][timeout:25];
{{geocodeArea:Ufa}}->.searchArea;
(
  node["tourism"="museum"](area.searchArea);
  way["tourism"="museum"](area.searchArea);
  relation["tourism"="museum"](area.searchArea);
);
out body;
>;
out skel qt;
```

## Все остановки Уфы
```json
{{geocodeArea:Ufa}}->.searchArea;
node["highway"="bus_stop"](area.searchArea);
out body;
```

### Поиск всех монументов в России
```json
[out:json][timeout:25];
// fetch area “Russia” to search in
{{geocodeArea:Russia}}->.searchArea;
// gather results
nwr["historic"="monument"](area.searchArea);
// print results
out geom;
```

### Тюрьмы в России
- [ссылка на overpass](https://overpass-turbo.eu/?Q=%2F*%0AThis+has+been+generated+by+the+overpass-turbo+wizard.%0AThe+original+search+was%3A%0A%E2%80%9Camenity%3Dprison+in+Russia%E2%80%9D%0A*%2F%0A%5Bout%3Ajson%5D%5Btimeout%3A25%5D%3B%0A%2F%2F+fetch+area+%E2%80%9CRussia%E2%80%9D+to+search+in%0A%7B%7BgeocodeArea%3ARussia%7D%7D-%3E.searchArea%3B%0A%2F%2F+gather+results%0Anwr%5B%22amenity%22%3D%22prison%22%5D%28area.searchArea%29%3B%0A%2F%2F+print+results%0Aout+geom%3B&C=52.890081%3B87.541744%3B3)
```json
/*
This has been generated by the overpass-turbo wizard.
The original search was:
“amenity=prison in Russia”
*/
[out:json][timeout:25];
// fetch area “Russia” to search in
{{geocodeArea:Russia}}->.searchArea;
// gather results
nwr["amenity"="prison"](area.searchArea);
// print results
out geom;
```

### Все пятерочки
```json
[out:json][timeout:25];
area["wikidata" = "Q5710"]->.place;
// From WikiData
// Ufa Q911, RB Q5710, Russia Q159, KZ Q232, AM Q399, TR Q43
nwr["brand" = "Пятёрочка"](area.place);
out body;
```

### Все супермаркеты
```json
[out:json][timeout:25];
area["wikidata" = "Q911"]->.place;
// From WikiData
// Ufa Q911, RB Q5710, Russia Q159, KZ Q232, AM Q399, TR Q43
nwr["shop" = "supermarket"](area.place);
out body;
```

## Все монументы украины
```json
/* Finds area with tag “wikidata” and value “Q212” which is Wikidata ID for Ukraine. 
# Q212 - Ukriane
# Q159 - Russia
*/
area["wikidata" = "Q212"]->.place;

/*Finds nodes with tag “historic” and values “memorial” OR “monument”. “~” character specifies that the value should match the regular expression. Only nodes located inside the area (Ukraine) will be returned.*/
node["historic"~"memorial|monument"](area.place);
out body;
```

### Все индустриальные здания на видимой площади
```json
// fetch both ways and relations with landuse=industrial in your current bbox
wr["landuse"="industrial"]({{bbox}});

// visualize landuse=industrial ways and relations for debugging purposes
out geom;

// explicitly convert relation to area, also include ways in search area
map_to_area -> .searchArea;

// query for buildings inside search area
nwr["building"](area.searchArea);

// and print results
out body;
>;
out skel qt;
```

### Отметки туризм на видимой карте 
```json
[out:json][timeout:25];
// gather results
nwr["tourism"]({{bbox}});
// print results
out geom;
```