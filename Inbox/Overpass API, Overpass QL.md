#dev #osm #map 
## Info
- https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#Query_for_areas_.28is_in.29]

## Sets
- `node[name="Foo"];` - точка
	- `node[!"name"];` - не имя
- `way[name="Foo"];` - линия
- `rel[name="Foo"];` - связь
- `nwr[name="Foo"];` - node + way + rel
- `nw[name="Foo"];` - node + way
- `nr[name="Foo"];` - node + rel
- `wr[name="Foo"];` - way + rel
- `derived[name="Foo"];`
- `area[name="Foo"];`
- несколько фильтров
	- `node[name="Foo"][type="Bar"];`
- Запись в дефолтный сет ._
	- `node[name="Foo"]->._;`
- Запись в отдельный сет .a
	- `(node[name="Foo"];)->.a;`
	- далее можно фильтровать данные в этом сете
		- `node.a[amenity=foo];`
### Мультисет
```python
 (
  node[name="Foo"];
  node[name="Bar"];
 )->._;
```

## Settings
- timeout
	- `[out:json][timeout:25];`
- limit count
	- `out center 100;`

Example
```python
[out:json];
area["boundary"="administrative"]["name"="Berlin"] -> .a;
(
    node(area.a)["amenity"="restaurant"];
); out center 100;
```

```python
node({{bbox}})["amenity"="restaurant"];
out count;
```

- Element limit (mb)
	- `[maxsize:1073741824]`
	- Default value is 536870912 (512 MB)
	- 3145728 ~3mb

## Output format (default value is _xml_:)
- xml
- json
- csv
Example in csv
```python
[out:csv(
::"id", amenity, name, operator, opening_hours, "contact:website", "contact:phone", brand, dispensing, lastcheck
)];
```

## Global bounding box (_bbox_)
- Area for search
	- `[bbox:south,west,north,east]`
- A bbox framing part of Rio de Janeiro, Brazil
	- `[bbox:-23,-43.3,-22.8,-43.1]`
	- `node(area:2400000001);`
	- `way(area:2400000001);`
	- `rel(area:2400000001);`
- in URL
	- `/api/interpreter?data=[bbox];node[amenity=post_box];out;&bbox=7.0,50.6,7.3,50.8`

## Query for areas (_is_in_)
- `is_in;`
- `.a is_in;`
- `is_in->.b;`
- `.a is_in->.b;`
```python
[.input_set] is_in         [-> .result_set];
is_in(latitude, longitude) [-> .result_set];
```
- Example
	- coordinates with two floating point numbers
		- `is_in(50.7,7.2);`
```python
is_in(48.856089,2.29789);
area._[admin_level="2"];     // ._ represents the default inputset, which contains all areas returned by ''is_in''
```

## Date
- format `YYYY-MM-DDThh:mm:ssZ`
- `[date:"2015-10-28T19:20:00Z"]`
- ### Difference between two dates (_diff_)
	- `[diff:"2012-09-14T15:00:00Z"]`
	- `[diff:"2012-09-14T15:00:00Z","2012-09-21T15:00:00Z"]`

## Union
- `(statement_1; statement_2; …)[->.result_set];`
- example
	- `(node[name="Foo"]; way[name="Foo"];);`
	- `(node[name="Foo"]; way[name="Foo"];)->.a;`

## Difference
- `(statement_1; - statement_2;)[->.result_set];`
- example
	- `(node[name="Foo"]; - node(50.0,7.0,51.0,8.0););`
	- `(node[name="Foo"]; - node(50.0,7.0,51.0,8.0);)->.a;`

## Intersection
- `node.a.b;`

## The block statement _if_
```python
 if (<Evaluator>)
 {
   <List of Substatements>
 }
 else
 {
   <List of Substatements>
 }
```

## For-each loop (_foreach_)
```python
  way[name="Foo"];
  foreach
  {
    (
      ._;
      >;
    );
    out;
  }
```
- example
	- `foreach.a(...);`
	- `foreach->.b(...);`
	- `foreach.a->.b(...);`

### The block statement _for_
```python
for (<Evaluator>)
 {
   <List of Substatements>
 }
```

input set
```python
 for.<Name of Input Set> (<Evaluator>)
 {
   <List of Substatements>
 }
```

output set
```python
 for->.<Name of Output Set> (<Evaluator>)
 {
   <List of Substatements>
 }
```

both set
```python
 for.<Name of Input Set>->.<Name of Output Set> (<Evaluator>)
 {
   <List of Substatements>
 }
```

### The block statement _complete_
```python
 complete
 {
   <List of Substatements>
 }
```

#### Value matches regular expression (_~_, _!~_)
RegExp
```python
node["name"~"^Foo$"]; - identical to node["name"="foo"];
node["name"~"^Foo"]; - name starts with Foo
node["name"~"Foo$"]; - name ends with Foo
node["name"~"Foo"]; - name contains the substring Foo anywhere in the tag
node["name"~".*"]; - name matches anything - equal to node["name"];
node["name"!~".*"]; - without name tag - identical to node[!"name"];
node["name"~"^Foo$",i]; - Case insensitively
```

Relative to other elements (around)
```python
(around[.input_set]:radius)
(around:radius,latitude,longitude)
```

different radius
```python
node(around:100.0);
way(around:100.0);
rel(around:100.0);
```

Example with linestring
```python
way[highway](around:500,50.540853270068986,8.048780365649707,50.53106288705902,8.030823236553783,50.51780737956311,8.019643105996508,50.50287491071276,8.016749912560886,50.48828159051387,8.022534398052139,50.47599950382573,8.036215335651725,50.467689755650376,8.055945038928135,50.46447690759688,8.079058902127825,50.46679590711731,8.102435269947343,50.47433280529453,8.122917034379736,50.48606755168466,8.137738019645033,50.50041288059356,8.144896569557243,50.51542994506574,8.143425882283827,50.529090915610794,8.13352458229042,50.53955268865336,8.11652989500613,50.545404823255616,8.09473704711951,50.545858734919165,8.07108928349599,50.540853270068986,8.048780365649707)   
;(._;>;);out meta;
```

Find all cinema nodes in Bonn
```python
area[name="Bonn"];
node(area)[highway=bus_stop];
node(around:100)[amenity=cinema];
out;
```

Find both cinema nodes and ways in Bonn, which are at most 100m away from bus stop nodes:
```python
area[name="Bonn"];
node(area)[highway=bus_stop]->.bus_stops;
( 
  way(around.bus_stops:100)[amenity=cinema];
  node(around.bus_stops:100)[amenity=cinema];
);
(._;>;);
out meta;
```

By polygon (poly)
```python
node(poly:"50.7 7.1 50.7 7.2 50.75 7.15");
way(poly:"50.7 7.1 50.7 7.2 50.75 7.15");
rel(poly:"50.7 7.1 50.7 7.2 50.75 7.15");
```


# Examples
Find all pubs in the inner city of Cologne
```python
area[name="Köln"]->.b;
rel(area.b)[name="Innenstadt"];
map_to_area -> .a;
node(area.a)[amenity=pub];
out meta;
```

Find all municipalities (admin_level=8 !) in Hessen without fire station
```python
area[admin_level=4]["name"="Hessen"][boundary=administrative]->.boundaryarea;
( node(area.boundaryarea)["amenity"="fire_station"];
  way(area.boundaryarea)["amenity"="fire_station"];
  >;
) ->.a;

.a is_in -> .b; 
area.b[admin_level=8] -> .bf; 

rel(area.boundaryarea)[admin_level=8];
map_to_area -> .bllf;

(.bllf; - .bf; );
rel(pivot);
(._;>;);
out;
```

Count the number of pharmacies per county
```python
[out:csv(::"type",::"id", name, admin_level,::"count")];
area[name="Saarland"][boundary];
 rel(area)[boundary][admin_level=6];
 map_to_area;
 foreach->.d(
   (.d;);out; 
   (node(area.d)[amenity=pharmacy];
    way(area.d)[amenity=pharmacy];
    relation(area.d)[amenity=pharmacy];);
   out count;
 );
```

Named input set
```python
rel(62716)->.b;
  .b out;
  .b map_to_area;
  out;
```

Find the number of bicycle parking facilities per county in California
```python
[out:csv(::"type",::"id", name, admin_level,::"count")];
area[name="California"][boundary];
 rel(area)[boundary][admin_level=6];
 map_to_area;
 foreach->.d(
   (.d;);out; 
   (node(area.d)[amenity=bicycle_parking];
    way(area.d)[amenity=bicycle_parking];
    relation(area.d)[amenity=bicycle_parking];);
   out count;
 );
```

Find all primary roads in London not part of a bus route
```python
area[name="London"]->.a;
way(area.a)[highway=primary]->.primary_roads;
rel(area.a)[route=bus];
way(r)->.bus_routes;
(.primary_roads; - .bus_routes;);
out body;
>;
out skel qt;
```

Find Museums in Paris with Nearby Transportation within 50 Meters
```python
area[name="Paris"]->.a;
(
  node(area.a)["tourism"="museum"];
  way(area.a)["tourism"="museum"];
)->.museums;

(
  node(around.museums:50)["highway"="bus_stop"];
  way(around.museums:50)["highway"="bus_stop"];
  node(around.museums:50)["railway"="tram_stop"];
  way(around.museums:50)["railway"="tram_stop"];
  node(around.museums:50)["railway"="subway_entrance"];
  way(around.museums:50)["railway"="subway_entrance"];
);

/*added by auto repair*/
(._;>;);
/*end of auto repair*/
out meta;
```

Find cafes that are closer than 20 meters from a pedestrian street
```python
area[name="Berlin"]->.a;
way(area.a)[highway=pedestrian]->.pedestrian_streets;
way(area.a)[amenity=cafe]->.cafes;
way.pedestrian_streets(around.cafes:20);
/*added by auto repair*/
(._;>;);
/*end of auto repair*/
out meta;
```

Find Natural Reservations that are bigger than 10 km length in Colorado and that do not have a hiking route inside them.
```python
area[admin_level=4]["name"="Colorado"]->.boundaryarea;
( node(area.boundaryarea)["leisure"="nature_reserve"];
  way(area.boundaryarea)["leisure"="nature_reserve"];
  >;
) ->.a;
.a is_in -> .b;
way.b["route"="hiking"] -> .hiking_routes;
(way(area.boundaryarea)(if: length() > 10000)["leisure"="nature_reserve"]; -  .hiking_routes;);
/*added by auto repair*/
(._;>;);
/*end of auto repair*/
out;
```

Find parks in Berlin that have a playground inside or around 500 meters from the park
```python
area[name="Berlin"]->.region;
rel(area.region)[leisure=park];
map_to_area -> .parks;
node(area.parks)[leisure=playground];
way(area.parks)[leisure=playground];
out;
node(area.parks)[leisure=playground] -> .playgrounds;
node.playgrounds(around:500);
out ;
```

Find longer than 3 km paved runway in the world
```python
way["aeroway"="runway"]["surface"="paved"](if: length() > 3000);
/*added by auto repair*/
(._;>;);
/*end of auto repair*/
out meta;
```

Find all bike rental stations in San Francisco within 50 meters of a railway station
```python
area[name="San Francisco"]->.sf;
node(area.sf)["amenity"="bicycle_rental"]->.bike_rental;
node(around.bike_rental:50)["railway"="station"]->.station;
node(around.station:50)["amenity"="bicycle_rental"]->.filtered_bicycle_rental;

(
  .filtered_bicycle_rental;
  .station;
);
out meta;
```