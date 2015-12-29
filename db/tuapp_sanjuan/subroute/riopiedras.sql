delete from ref.subroute where route = 'RIO_PIEDRAS' and direction = 'RIO_PIEDRAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.049731 18.39608,-66.049485 18.396856,-66.049655 18.396949,-66.052775 18.397791,-66.052601 18.398401,-66.049527 18.397681,-66.046045 18.397656,-66.046032 18.398413,-66.04942 18.398455,-66.049414 18.397689,-66.049538 18.397688,-66.0496 18.396917,-66.04992 18.395927,-66.049882 18.395858,-66.049809 18.39587,-66.049731 18.396078)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'RIO_PIEDRAS','RIO_PIEDRAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
