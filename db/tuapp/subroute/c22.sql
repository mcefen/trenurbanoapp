delete from ref.subroute_new where route = 'C22' and direction = 'PLAZA_LAS_AMERICAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.060104 18.435378,-66.060296 18.435422,-66.06048 18.435448,-66.060624 18.435367,-66.060733 18.434924,-66.060737 18.434401,-66.060622 18.433984,-66.060034 18.432103,-66.05981 18.431257,-66.059646 18.430616,-66.059338 18.429103,-66.058759 18.426251,-66.058819 18.426148,-66.058947 18.426107,-66.060434 18.425792,-66.063172 18.425056,-66.063709 18.424957,-66.063791 18.425027,-66.064659 18.428264,-66.064749 18.428425,-66.064984 18.42847,-66.065139 18.42843,-66.065521 18.428317,-66.067494 18.427786,-66.06854 18.427481,-66.070312 18.426947,-66.071657 18.426585,-66.073085 18.426075,-66.07465125444217 18.4253208450177,-66.07471462349943 18.42531259151283,-66.07530196980176 18.425359585507533,-66.07542337994236 18.42535238025594,-66.07558429570194 18.425301126752856,-66.07735 18.424488,-66.077472 18.424348,-66.077441 18.424174,-66.075476 18.420368,-66.0744945536088 18.418539519535404,-66.07445650104614 18.41840837659115,-66.074498 18.418263,-66.0769607885385 18.417098999999997,-66.07696819713463 18.417002238579,-66.07664898567313 18.416404084609702,-66.0765305627501 18.41639225382961,-66.075271 18.416992)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'C22','PLAZA_LAS_AMERICAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_new where route = 'C22' and direction = 'SAGRADO_CORAZON';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.075271 18.416992,-66.07402621146151 18.4175807462138,-66.073998 18.417737,-66.074374 18.418566,-66.074583 18.418956,-66.07540081719226 18.420413676489716,-66.077368 18.424209,-66.07737822578841 18.42430974645842,-66.07729967834725 18.424408208215837,-66.07556806077224 18.42523531539278,-66.07540181719226 18.425281830995807,-66.07489080286538 18.425244929529722,-66.074709 18.425239,-66.074342 18.425408,-66.073031 18.426007,-66.071657 18.426526,-66.070299 18.426901,-66.068494 18.427419,-66.067473 18.427726,-66.065492 18.428255,-66.065112 18.428372,-66.064979 18.42837,-66.064907 18.42831,-66.064805 18.428026,-66.064218 18.425861,-66.063972 18.425038,-66.063865 18.424884,-66.063789 18.424871,-66.063164 18.42501,-66.060414 18.425738,-66.05879 18.426081,-66.058678 18.426174,-66.058657 18.426329,-66.059233 18.429118,-66.059529 18.430628,-66.059695 18.431281,-66.059938 18.432135,-66.06056 18.434003,-66.060666 18.43439,-66.060689 18.434688,-66.060685 18.434906,-66.060566 18.43536,-66.060454 18.435682,-66.060416 18.435854,-66.060343 18.435957,-66.060151 18.435989,-66.05988 18.436015,-66.059845 18.436015,-66.059548 18.436015,-66.059453 18.436007,-66.05941 18.435984,-66.059344 18.435908,-66.059316 18.435477,-66.059383 18.435387,-66.05941 18.435264,-66.059473 18.435221,-66.059549 18.435193,-66.05967 18.435187,-66.059786 18.435198)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'C22','SAGRADO_CORAZON', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;