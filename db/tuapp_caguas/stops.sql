delete from ref.stop where gid = 8006; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8006 as gid, NULL as routes, 'Bonneville' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-66.053459 18.2282)');
delete from ref.stop where gid = 8002; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8002 as gid, NULL as routes, 'Terminal San Lorenzo' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-65.96152 18.187474)');
delete from ref.stop where gid = 8003; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8003 as gid, NULL as routes, 'Barrio Cañaboncito' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-66.076889 18.211746)');
delete from ref.stop where gid = 8004; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8004 as gid, NULL as routes, 'Barrio La Mesa \ Barrio La Barra' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-66.057397 18.276993)');
delete from ref.stop where gid = 8005; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8005 as gid, NULL as routes, 'Terminal Aguas Buenas' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-66.102789 18.256372)');
delete from ref.stop where gid = 8000; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8000 as gid, NULL as routes, 'Terminal Caguas' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-66.032452 18.23506)');
delete from ref.stop where gid = 8001; insert into ref.stop (gid, routes, descriptio, ama_id, geom) select 8001 as gid, NULL as routes, 'Valle Tolima' as descriptio, NULL as ama_id, ST_GeomFromEWKT('SRID=4326;POINT(-66.046304 18.242135)');
