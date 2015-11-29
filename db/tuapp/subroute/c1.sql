delete from ref.subroute_new where route = 'C1' and direction = 'SAGRADO_CORAZON'; with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.04468435488552 18.400037720115932,-66.0438525651034 18.40004513116194,-66.04373396141598 18.400238348903848,-66.04345089087589 18.400268099017154,-66.04335791824866 18.400397384888883,-66.04336619432634 18.400782108343886,-66.04339619102097 18.40129946471654,-66.04338010469854 18.40184458649646,-66.04344332015589 18.401948848567088,-66.04359553931319 18.40198436548289,-66.04435734752722 18.401847869183776,-66.04592544925582 18.401667456473433,-66.05053077992585 18.401140839029107,-66.05072236648462 18.401136022932427,-66.05153817199098 18.401245835153464,-66.05192246297828 18.401397374561785,-66.05201479263108 18.40145893740832,-66.05208092062566 18.401602189331452,-66.05210448618807 18.401750135917993,-66.05205899079203 18.402228861805,-66.05193552571751 18.40412185671456,-66.05192634496939 18.40602349239178,-66.05196870316028 18.406293416656357,-66.05271988060304 18.408152711186204,-66.0529509683972 18.408274020136925,-66.05511470646566 18.408152643169725,-66.0558311160916 18.40813618136816,-66.056311 18.408125886648158,-66.0564953449694 18.408273682684435,-66.05665 18.413508,-66.05671700920794 18.41757304625262,-66.05710881584086 18.420024880739998,-66.057544 18.421789,-66.05817 18.424112,-66.058795 18.426937,-66.059362 18.429688,-66.059686 18.43131,-66.060525 18.433782,-66.06066452902289 18.43462191484403,-66.06058358706869 18.43524739167758,-66.060419 18.43588)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'C1','SAGRADO_CORAZON', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_new where route = 'C1' and direction = 'CAPETILLO'; with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.05932646436635 18.43592326232038,-66.05920152241214 18.43433499496531,-66.05912834166402 18.434005704149296,-66.05907758045794 18.43226395606817,-66.05892381925187 18.43122082012092,-66.05858152241215 18.429555999999998,-66.058174 18.427655,-66.05743183595183 18.424080178974826,-66.057059 18.422693,-66.056435 18.420243,-66.055844 18.417969,-66.0553696593056 18.41591208161471,-66.05470473296924 18.413374264145816,-66.05428482504881 18.412102735310036,-66.05351677900904 18.410044264633452,-66.05287520904557 18.4082984592438,-66.0520604577556 18.406275,-66.05200792542735 18.40603169697591,-66.05199445775563 18.4052910227535,-66.0520226428636 18.40412002721333,-66.05215381584085 18.402214655059723,-66.05219983425678 18.40158772314168,-66.05213581933812 18.401436443293882,-66.05205970975946 18.40138435164912,-66.05156312595119 18.401181904425588,-66.05073266022242 18.401086666809398,-66.0505207983418 18.401087563391705,-66.04967010957867 18.40117471268173,-66.0459985174541 18.401606114306414,-66.04601398188937 18.400711094424288,-66.04601563850375 18.4001427608926,-66.04595826164427 18.400062159996537,-66.04586121351461 18.400025325349006,-66.04473940632056 18.400036045813703)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'C1','CAPETILLO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;