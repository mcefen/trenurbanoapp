delete from ref.subroute where route = 'C1' and direction = 'CAPETILLO';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.059326 18.435923,-66.059202 18.434335,-66.059128 18.434006,-66.059078 18.432264,-66.058924 18.431221,-66.058582 18.429556,-66.058174 18.427655,-66.057432 18.42408,-66.057059 18.422693,-66.056435 18.420243,-66.055844 18.417969,-66.05537 18.415912,-66.054705 18.413374,-66.054285 18.412103,-66.053517 18.410044,-66.052875 18.408298,-66.05206 18.406275,-66.052008 18.406032,-66.051994 18.405291,-66.052023 18.40412,-66.052154 18.402215,-66.0522 18.401588,-66.052136 18.401436,-66.05206 18.401384,-66.051563 18.401182,-66.050733 18.401087,-66.050521 18.401088,-66.04967 18.401175,-66.045999 18.401606,-66.046014 18.400711,-66.046016 18.400143,-66.045958 18.400062,-66.045861 18.400025,-66.044739 18.400036)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'C1','CAPETILLO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'C1' and direction = 'SAGRADO_CORAZON';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.044684 18.400038,-66.043853 18.400045,-66.043734 18.400238,-66.043451 18.400268,-66.043358 18.400397,-66.043366 18.400782,-66.043396 18.401299,-66.04338 18.401845,-66.043443 18.401949,-66.043596 18.401984,-66.044357 18.401848,-66.045925 18.401667,-66.050531 18.401141,-66.050722 18.401136,-66.051538 18.401246,-66.051922 18.401397,-66.052015 18.401459,-66.052081 18.401602,-66.052104 18.40175,-66.052059 18.402229,-66.051936 18.404122,-66.051926 18.406023,-66.051969 18.406293,-66.05272 18.408153,-66.052951 18.408274,-66.055115 18.408153,-66.055831 18.408136,-66.056311 18.408126,-66.056495 18.408274,-66.05665 18.413508,-66.056717 18.417573,-66.057109 18.420025,-66.057544 18.421789,-66.05817 18.424112,-66.058795 18.426937,-66.059362 18.429688,-66.059686 18.43131,-66.060051 18.432559,-66.060413 18.433686,-66.060547 18.434043,-66.060623 18.434323,-66.060665 18.434622,-66.06065 18.434895,-66.060584 18.435247,-66.060419 18.43588)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'C1','SAGRADO_CORAZON', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'C1' and direction = 'SAGRADO_CORAZON'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (1605, 0, 'C1', 'SAGRADO_CORAZON'),(91, 1, 'C1', 'SAGRADO_CORAZON'),(92, 2, 'C1', 'SAGRADO_CORAZON'),(93, 3, 'C1', 'SAGRADO_CORAZON'),(94, 4, 'C1', 'SAGRADO_CORAZON'),(95, 5, 'C1', 'SAGRADO_CORAZON'),(96, 6, 'C1', 'SAGRADO_CORAZON'),(97, 7, 'C1', 'SAGRADO_CORAZON'),(98, 8, 'C1', 'SAGRADO_CORAZON'),(99, 9, 'C1', 'SAGRADO_CORAZON'),(100, 10, 'C1', 'SAGRADO_CORAZON'),(101, 11, 'C1', 'SAGRADO_CORAZON'),(32, 12, 'C1', 'SAGRADO_CORAZON'),(33, 13, 'C1', 'SAGRADO_CORAZON'),(34, 14, 'C1', 'SAGRADO_CORAZON'),(35, 15, 'C1', 'SAGRADO_CORAZON'),(36, 16, 'C1', 'SAGRADO_CORAZON');
delete from ref.subroute_stop where route = 'C1' and direction = 'CAPETILLO'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (53, 0, 'C1', 'CAPETILLO'),(54, 1, 'C1', 'CAPETILLO'),(55, 2, 'C1', 'CAPETILLO'),(56, 3, 'C1', 'CAPETILLO'),(148, 4, 'C1', 'CAPETILLO'),(149, 5, 'C1', 'CAPETILLO'),(150, 6, 'C1', 'CAPETILLO'),(151, 7, 'C1', 'CAPETILLO'),(152, 8, 'C1', 'CAPETILLO'),(153, 9, 'C1', 'CAPETILLO'),(154, 10, 'C1', 'CAPETILLO'),(155, 11, 'C1', 'CAPETILLO'),(156, 12, 'C1', 'CAPETILLO'),(157, 13, 'C1', 'CAPETILLO'),(158, 14, 'C1', 'CAPETILLO'),(159, 15, 'C1', 'CAPETILLO'),(160, 16, 'C1', 'CAPETILLO');
