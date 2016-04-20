delete from ref.subroute where route = 'CA' and direction = 'LAS_CAROLINAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.032602 18.23491,-66.03223 18.23478,-66.032031 18.234801,-66.031936 18.234928,-66.031773 18.235321,-66.031813 18.235433,-66.03274 18.235751,-66.032905 18.235748,-66.033089 18.235811,-66.033204 18.235713,-66.033565 18.235053,-66.033705 18.234681,-66.033795 18.23458,-66.034338 18.23478,-66.03453 18.234791,-66.036835 18.235653,-66.037735 18.235901,-66.037927 18.235881,-66.038031 18.235738,-66.038173 18.234741,-66.03838 18.234601,-66.040009 18.23456,-66.041505 18.23465,-66.041883 18.234591,-66.042471 18.234381,-66.045406 18.233571,-66.046605 18.233334,-66.049983 18.233245,-66.050661 18.233328,-66.051176 18.233451,-66.051771 18.233645,-66.052368 18.23391,-66.054998 18.235408,-66.056473 18.236568,-66.056971 18.23701,-66.0579 18.238109,-66.059017 18.239191,-66.059518 18.239808,-66.060271 18.241133,-66.060669 18.241726,-66.061088 18.24224,-66.061584 18.242583,-66.062164 18.242821,-66.062871 18.242916,-66.063648 18.242831,-66.065248 18.242553,-66.065996 18.242573,-66.066658 18.242771,-66.06775 18.243341,-66.069281 18.24447,-66.069913 18.24485,-66.070565 18.245123,-66.07123 18.245308,-66.072035 18.245412,-66.072359 18.245493,-66.072918 18.245616,-66.07322 18.245712,-66.073324 18.245797,-66.073387 18.245945,-66.073382 18.246169,-66.073269 18.246448,-66.073036 18.24699,-66.072794 18.247564,-66.072526 18.248098,-66.072466 18.248317,-66.072469 18.248557,-66.072535 18.24943,-66.072526 18.249646,-66.072486 18.24984,-66.072382 18.250043,-66.071723 18.251071,-66.07163 18.251197,-66.071466 18.251312,-66.071314 18.251367,-66.071161 18.2514,-66.070971 18.251421,-66.070807 18.251443,-66.070619 18.251482,-66.070527 18.251536,-66.070429 18.251662,-66.070369 18.251829,-66.070303 18.252008,-66.070242 18.252149,-66.070136 18.252331,-66.069856 18.252813,-66.069629 18.253223,-66.068594 18.255234,-66.068433 18.255557,-66.068384 18.255819,-66.068328 18.25584,-66.068243 18.255859,-66.063302 18.256395,-66.063242 18.256391,-66.063179 18.256343,-66.063134 18.256248,-66.063128 18.255939,-66.063181 18.255701,-66.063136 18.25548,-66.063057 18.255343,-66.062968 18.25491,-66.062939 18.254469,-66.062996 18.254428,-66.0646 18.254229,-66.065173 18.254185,-66.066165 18.254083)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'CA','LAS_CAROLINAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'CA' and direction = 'TERM_CAGUAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.066177 18.254041,-66.066105 18.253221,-66.066062 18.25313,-66.065921 18.253089,-66.065091 18.253177,-66.065028 18.25313,-66.064999 18.252925,-66.064806 18.251883,-66.064746 18.251489,-66.064798 18.251404,-66.066079 18.250966,-66.066892 18.250696,-66.067232 18.250646,-66.067577 18.250625,-66.067946 18.250712,-66.06811 18.250759,-66.068525 18.250936,-66.068741 18.251054,-66.06917 18.251393,-66.06947 18.251719,-66.069597 18.251798,-66.070184 18.252128,-66.070257 18.252146,-66.070296 18.252116,-66.070315 18.252072,-66.070335 18.252023,-66.070398 18.25185,-66.070446 18.251686,-66.07054 18.251561,-66.070624 18.251508,-66.070807 18.251471,-66.070975 18.25145,-66.071163 18.251427,-66.071323 18.251396,-66.071484 18.251339,-66.07164 18.251229,-66.07176 18.25108,-66.072399 18.250091,-66.072514 18.249875,-66.072562 18.24966,-66.072564 18.249432,-66.072488 18.248557,-66.072485 18.248319,-66.072546 18.248114,-66.072811 18.247571,-66.073054 18.246996,-66.073287 18.246455,-66.07341 18.246194,-66.073475 18.246019,-66.073509 18.245915,-66.073522 18.245789,-66.073474 18.245686,-66.073375 18.245623,-66.072683 18.245395,-66.071068 18.24514,-66.070233 18.244863,-66.069393 18.244428,-66.067594 18.243074,-66.066492 18.242541,-66.065665 18.24239,-66.06473 18.242461,-66.062965 18.242756,-66.062276 18.242706,-66.061638 18.242483,-66.061026 18.242053,-66.060559 18.241466,-66.05949 18.239605,-66.059055 18.239079,-66.058015 18.2381,-66.056696 18.236588,-66.055392 18.235541,-66.055001 18.235276,-66.053259 18.234313,-66.052136 18.233628,-66.051171 18.233253,-66.050493 18.233106,-66.049953 18.233053,-66.046188 18.233191,-66.043325 18.233923,-66.041928 18.234361,-66.041556 18.23444,-66.040268 18.2344,-66.038696 18.234466,-66.037792 18.234415,-66.036648 18.234481,-66.036044 18.234343,-66.035898 18.234348,-66.03388 18.233766,-66.033745 18.233803,-66.033268 18.234768,-66.032903 18.234728,-66.032571 18.234633,-66.032005 18.234583,-66.032005 18.234708,-66.032165 18.234803,-66.032263 18.234941)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'CA','TERM_CAGUAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'CA' and direction = 'TERM_CAGUAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8024, 0, 'CA', 'TERM_CAGUAS'),(8000, 1, 'CA', 'TERM_CAGUAS');
delete from ref.subroute_stop where route = 'CA' and direction = 'LAS_CAROLINAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8000, 0, 'CA', 'LAS_CAROLINAS'),(8024, 1, 'CA', 'LAS_CAROLINAS');
