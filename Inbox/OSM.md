
# I changed quite a lot of definitions because it Polylines higher than 0x2c (maybe 0x2a is even the last one still rendered) don't seem to be compatible - either to mgkmap in general or to the preproces.pl file. Therefore all polylines are used up. Please save the text below into a .txt file and then rename it to cycling-map-features.csv

# Other polylines

polyline|highway|motorway|0x01||10

polyline|highway|motorway_link|0x02||18

polyline|highway|trunk|0x03||16

polyline|highway|trunk_link|0x03||16

polyline|highway|primary|0x04||19

polyline|highway|primary_link|0x04||19

polyline|highway|secondary|0x05||20

polyline|highway|tertiary|0x06||21

polyline|highway|unclassified|0x07||22

polyline|highway|residential|0x07||22

polyline|highway|living_street|0x07||22

polyline|highway|minor|0x07||22

polyline|highway|service|0x08||22

polyline|aeroway|taxiway|0x09||22

polyline|highway|unsurfaced|0x0a||22

# Cycleways

polyline|highway|bridleway|0x0b||21

polyline|highway|cycleway|0x0c||20

polyline|highway|byway|0x0d||21

polyline|highway|ncn_major|0x0e||10

polyline|highway|rcn_major|0x0e||12

polyline|highway|ncn_minor|0x0e||10

polyline|highway|rcn_minor|0x0e||12

polyline|highway|lcn_major|0x0e||14

polyline|highway|lcn_minor|0x0e||15

polyline|highway|ncn_offroad|0x0f||10

polyline|highway|rcn_offroad|0x0f||12

polyline|highway|lcn_offroad|0x0f||15

# ctd... other polylines

polyline|highway|track|0x10||22

polyline|highway|path|0x11||22

polyline|highway|steps|0x12||22

polyline|railway|subway|0x13||22

polyline|railway|light_rail|0x14||23

polyline|railway|rail|0x14||20

polyline|railway|tram|0x14||22

polyline|railway|narrow_gauge|0x14||24

polyline|aerialway|cable_car|0x15||21

polyline|aerialway|chair_lift|0x16||21

polyline|aerialway|drag_lift|0x17||21

polyline|waterway|stream|0x18||22

polyline|natural|coastline|0x19||10

polyline|route|ferry|0x1a||20

polyline|waterway|drain|0x1b||22

polyline|boundary|political|0x1c||10

polyline|boundary|administrative|0x1d||20

polyline|boundary|national|0x1e||10

polyline|waterway|river|0x1f||10

polyline|waterway|canal|0x1f||22

polyline|waterway|riverbank|0x1f||20

polyline|contour|elevation|0x21||20

# 0x20-0x25 are reserved for elevation and depth contourlines

polyline|highway|pedestrian|0x26||23

polyline|aeroway|runway|0x27||20

polyline|power|line|0x28||24

# Pedestrians only

polyline|highway|footpath|0x29||22

polyline|highway|footway|0x2a||22

# unsure wether 0x2b and 0x2c are rendered or not. Above is NOT rendered.

# Points

point|aeroway|airport|0x59|0x00|20

point|amenity|atm|0x2f|0x06|21

point|amenity|arts_centre|0x2f|0x14|23

point|amenity|bank|0x2f|0x06|21

point|amenity|bank;atm|0x2f|0x06|23

point|amenity|biergarten|0x2d|0x02|23

point|amenity|bus_station|0x2f|0x08|23

point|amenity|car_wash|0x2f|0x0e|23

point|amenity|cinema|0x2d|0x03|23

point|amenity|college|0x2c|0x05|23

point|amenity|courthouse|0x30|0x04|23

point|amenity|drinking_water|0x50|0x00|23

point|waterway|water_point|0x50|0x00|23

point|amenity|fast_food|0x2a|0x07|22

point|amenity|fire_station|0x30|0x08|23

point|amenity|fountain|0x65|0x00|22

point|amenity|fuel|0x2f|0x01|23

point|amenity|grave_yard|0x64|0x03|23

point|amenity|hospital|0x30|0x02|22

point|amenity|library|0x2c|0x03|22

point|amenity|parking|0x2f|0x0b|22

point|amenity|bicycle_parking|0x2f|0x0b|23

point|amenity|pharmacy|0x2e|0x05|23

point|amenity|place_of_worship|0x2c|0x0b|23

point|amenity|police|0x30|0x01|23

point|amenity|post_office|0x2f|0x05|23

point|amenity|post_box|0x2f|0x05|23

point|amenity|pub|0x46|0x00|23

point|amenity|public_building|0x30|0x03|23

point|amenity|recycling|0x2f|0x15|23

point|amenity|restaurant|0x2a|0x00|23

point|amenity|cafe|0x2a|0x00|20

point|amenity|school|0x2c|0x05|23

point|amenity|shelter|0x61|0x00|23

point|amenity|supermarket|0x2e|0x02|23

point|amenity|telephone|0x51|0x00|23

point|amenity|theatre|0x2d|0x01|23

point|amenity|toilets|0x4e|0x00|23

point|amenity|townhall|0x30|0x03|23

point|amenity|university|0x2c|0x05|23

point|amenity|zoo|0x2c|0x07|23

point|highway|bus_stop|0x2f|0x08|23

point|historic|museum|0x2c|0x02|23

point|historic|ruins|0x64|0x16|23

point|historic|castle|0x64|0x02|23

point|historic|memorial|0x2c|0x02|23

point|historic|archaeological_site|0x16|23

point|leisure|golf_course|0x2d|0x05|21

point|leisure|marina|0x43|0x00|21

point|leisure|park|0x2c|0x06|21

point|leisure|pitch|0x2c|0x08|21

point|leisure|sports_centre|0x2d|0x0a|21

point|leisure|stadium|0x2c|0x08|21

point|leisure|track|0x2c|0x08|21

point|man_made|tower|0x64|0x11|21

point|man_made|power_wind|0x64|0x00|21

point|man_made|reservoir_covered|0x65|0x0f|21

point|man_made|reservoir|0x65|0x0f|21

point|man_made|water_tower|0x65|0x0f|21

point|power|generator|0x64|0x00|21

point|power|sub_station|0x64|0x00|21

point|power|tower|0x64|0x00|21

point|natural|beach|0x66|0x04|20

point|natural|cliff|0x66|0x07|20

point|natural|peak|0x66|0x16|20

point|natural|rock|0x66|0x14|20

point|natural|spring|0x65|0x11|23

point|natural|geyser|0x65|0x09|22

point|natural|glacier|0x65|0x0a|20

point|place|city|0x04||10

point|place|hamlet|0x11||23

point|place|locality|0x11||23

point|place|suburb|0x0a||23

point|place|town|0x08||16

point|place|village|0x0b||20

point|railway|halt|0x2f|0x08|22

point|railway|station|0x2f|0x08|22

point|railway|tram_stop|0x2f|0x08|23

point|shop|bakers|0x2e|0x00|23

point|shop|bakery|0x2e|0x00|23

point|shop|butchers|0x2e|0x00|23

point|shop|butcher|0x2e|0x00|23

point|shop|book|0x2e|0x00|23

point|shop|convenience|0x2e|0x00|23

point|shop|doityourself|0x2e|0x00|23

point|shop|kiosk|0x2e|0x00|23

point|shop|outdoor|0x2e|0x00|23

point|shop|bicycle|0x2e|0x00|23

point|shop|supermarket|0x2e|0x00|23

point|shop|electronics|0x2e|0x00|23

point|tourism|attraction|0x64|0x02|23

point|tourism|camp_site|0x2b|0x03|23

point|tourism|caravan_site|0x2b|0x03|23

point|tourism|hotel|0x2b|0x01|23

point|tourism|guest_house|0x2b|0x01|20

point|tourism|information|0x4c|0x00|23

point|tourism|motel|0x2b|0x01|23

point|tourism|picnic_site|0x4a|0x00|23

point|tourism|theme_park|0x2c|0x01|23

point|tourism|viewpoint|0x52|0x00|23

point|tourism|zoo|0x2c|0x07|23

# Land-use Polygons

polygon|amenity|college|0x0a||18

polygon|amenity|grave_yard|0x1a||22

polygon|amenity|hospital|0x0b||22

polygon|amenity|parking|0x05||22

polygon|amenity|bicycle_parking|0x05||22

polygon|amenity|prison|0x04||22

polygon|amenity|public_building|0x0a||22

polygon|amenity|supermarket|0x08||22

polygon|amenity|university|0x0a||22

polygon|amenity|school|0x0a||22

polygon|shop|supermarket|0x08||22

polygon|aeroway|apron|0x0e||20

polygon|aeroway|terminal|0x13||20

polygon|building|commercial|0x13||22

polygon|building|church|0x13||22

polygon|building|cathedral|0x13||22

polygon|building|railroad_station|0x13||22

polygon|building|university|0x13||22

polygon|building|tower|0x13||22

polygon|building|tramdepot|0x13||22

polygon|building|sport|0x19||22

polygon|building|yes|0x13||22

polygon|landuse|allotments|0x4e||22

polygon|landuse|cemetary|0x1a||22

polygon|landuse|cemetery|0x1a||22

polygon|landuse|commercial|0x0c||22

polygon|landuse|forest|0x50||16

polygon|landuse|industrial|0x0c||22

polygon|landuse|reservoir|0x3f||22

polygon|landuse|residential|0x01||22

polygon|place|locality|0x0d||24

polygon|landuse|runway|0x0e||20

polygon|leisure|common|0x0d||20

polygon|leisure|garden|0x4e||22

polygon|leisure|golf_course|0x18||22

polygon|leisure|miniature_golf|0x18||22

polygon|leisure|marina|0x09||22

polygon|leisure|nature_reserve|0x16||20

polygon|leisure|park|0x17||22

polygon|leisure|pitch|0x19||22

polygon|leisure|sports_center|0x19||22

polygon|leisure|sports_centre|0x19||22

polygon|leisure|stadium|0x19||22

polygon|leisure|track|0x19||22

polygon|leisure|water_park|0x09||22

polygon|military|airfield|0x04||22

polygon|military|barracks|0x04||22

polygon|military|danger_area|0x04||22

polygon|military|range|0x04||22

polygon|power|generator|0x0c||22

polygon|power|sub_station|0x0c||22

polygon|natural|wood|0x50||20

polygon|natural|lake|0x3c||14

polygon|natural|marsh|0x51||22

polygon|natural|mud|0x51||22

polygon|natural|scrub|0x4f||22

polygon|natural|scree|0x4f||22

polygon|natural|water|0x3c||14

polygon|natural|land|0x54||14

polygon|natural|glacier|0x4d||14

polygon|sport|pitch|0x19||22

polygon|sport|tennis|0x19||22

polygon|sport|soccer|0x19||22

polygon|sport|football|0x19||22

polygon|sport|horse_racing|0x19||22

polygon|sport|golf|0x18||22

polygon|sport|model_aerodrome|0x0e||22

polygon|tourism|zoo|0x17||22

polygon|historic|archaeological_site|0x0d||22

polygon|waterway|riverbank|0x3c||14

polygon|man-made|wastewater_plant|0x3c||22

polygon|man-made|pool|0x3c||22