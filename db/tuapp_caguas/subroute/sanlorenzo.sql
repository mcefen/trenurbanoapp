delete from ref.subroute where route = 'SL' and direction = 'SAN_LORENZO';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.031869 18.234987,-66.031768 18.235329,-66.030998 18.2351,-66.030818 18.23502,-66.03077 18.234896,-66.031082 18.234083,-66.031729 18.232736,-66.032263 18.231903,-66.0326 18.23127,-66.032754 18.230836,-66.032983 18.230391,-66.032954 18.230313,-66.029694 18.227648,-66.0292 18.227118,-66.027495 18.225703,-66.027195 18.22535,-66.026641 18.224488,-66.026316 18.224031,-66.026032 18.223821,-66.025741 18.223683,-66.024973 18.223513,-66.024238 18.223461,-66.020655 18.224053,-66.014894 18.224063,-66.014593 18.22403,-66.014094 18.223883,-66.013563 18.223551,-66.013361 18.223341,-66.013182 18.223067,-66.012724 18.222043,-66.012278 18.221329,-66.011396 18.220141,-66.010765 18.219641,-66.009525 18.218835,-66.008921 18.218486,-66.008306 18.218215,-66.006011 18.217556,-66.005646 18.217395,-66.004925 18.216923,-66.004628 18.216548,-66.00423 18.216306,-66.003789 18.216091,-66.00368 18.216012,-66.003304 18.21583,-66.003128 18.215706,-66.002955 18.215523,-66.002526 18.214766,-66.002424 18.214709,-66.002308 18.214454,-66.00215 18.213846,-66.002259 18.210036,-66.00225 18.20986,-66.00221 18.209724,-66.002121 18.209587,-66.001844 18.209419,-66.001386 18.209187,-66.001258 18.209058,-66.001186 18.208871,-66.000964 18.207603,-66.000899 18.207496,-66.000783 18.207458,-66.000641 18.207557,-66.000579 18.207621,-66.000508 18.207661,-66.000078 18.207766,-65.999951 18.207749,-65.999573 18.207625,-65.999354 18.20749,-65.99922 18.207232,-65.999214 18.206996,-65.999283 18.206758,-65.999323 18.206584,-65.999281 18.206488,-65.999251 18.206441,-65.999178 18.206407,-65.998571 18.206424,-65.998099 18.206438,-65.997883 18.206458,-65.997672 18.206396,-65.997485 18.20628,-65.997361 18.206104,-65.997271 18.205838,-65.997213 18.205757,-65.997166 18.20572,-65.997103 18.205685,-65.997023 18.205661,-65.996876 18.205661,-65.996704 18.205698,-65.996565 18.205695,-65.99626 18.205627,-65.996116 18.205608,-65.995739 18.205616,-65.995631 18.20561,-65.995444 18.20558,-65.994634 18.205348,-65.994548 18.205326,-65.994433 18.205294,-65.994273 18.205185,-65.994177 18.205104,-65.994109 18.205048,-65.994011 18.205003,-65.993868 18.204973,-65.993767 18.204983,-65.99369 18.205004,-65.993546 18.205059,-65.993438 18.205075,-65.993315 18.205053,-65.990776 18.204068,-65.99065 18.204003,-65.990451 18.203953,-65.990237 18.203925,-65.99015 18.203897,-65.990065 18.203844,-65.989888 18.203695,-65.989714 18.203602,-65.989611 18.203571,-65.989504 18.203582,-65.989408 18.20362,-65.989131 18.203738,-65.988893 18.203784,-65.988675 18.20369,-65.988525 18.203641,-65.98788 18.203065,-65.987653 18.202954,-65.98691 18.202877,-65.98666 18.202823,-65.985932 18.202559,-65.985844 18.202535,-65.984771 18.202461,-65.984487 18.202417,-65.984006 18.202227,-65.983797 18.202237,-65.983343 18.202398,-65.983179 18.202431,-65.982974 18.202426,-65.982831 18.202406,-65.98228 18.202333,-65.981293 18.202111,-65.980501 18.201866,-65.980132 18.201714,-65.978328 18.20085,-65.977334 18.200326,-65.976445 18.199748,-65.975759 18.199493,-65.975031 18.199348,-65.974357 18.199113,-65.973738 18.198783,-65.972168 18.197493,-65.96749 18.193033,-65.96477 18.19129,-65.964153 18.191006,-65.962429 18.190328,-65.961453 18.189821,-65.961128 18.18961,-65.961072 18.189558,-65.961102 18.189453,-65.961979 18.188216,-65.962534 18.187521,-65.962888 18.186973,-65.96304 18.186649,-65.963065 18.18656,-65.962944 18.18643,-65.9628 18.186303,-65.962646 18.186316,-65.961965 18.187308,-65.961914 18.18737,-65.961881 18.187382,-65.961739 18.187321,-65.96164 18.187285)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'SL','SAN_LORENZO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'SL' and direction = 'TERM_CAGUAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-65.961608 18.187281,-65.961513 18.187259,-65.96143 18.187258,-65.961186 18.18761,-65.961173 18.187644,-65.961186 18.187682,-65.961515 18.187884,-65.961964 18.188164,-65.962419 18.188444,-65.962425 18.188501,-65.962123 18.189048,-65.961852 18.189547,-65.961664 18.189869,-65.961658 18.189946,-65.961686 18.189988,-65.962411 18.190365,-65.964136 18.191043,-65.964749 18.191325,-65.967463 18.193064,-65.972139 18.197523,-65.973519 18.198834,-65.974272 18.199273,-65.974987 18.199514,-65.975756 18.19965,-65.976366 18.199861,-65.978328 18.200905,-65.979788 18.201589,-65.980118 18.201754,-65.980486 18.201904,-65.981289 18.20214,-65.982271 18.202373,-65.982825 18.202446,-65.98297 18.202466,-65.983183 18.202472,-65.983355 18.202437,-65.983806 18.202277,-65.983999 18.202268,-65.984475 18.202456,-65.984766 18.202501,-65.985837 18.202575,-65.985919 18.202597,-65.986648 18.202862,-65.986903 18.202917,-65.987641 18.202993,-65.987855 18.203098,-65.988503 18.203676,-65.988659 18.203728,-65.988888 18.203826,-65.989144 18.203777,-65.989425 18.203657,-65.989515 18.203622,-65.989607 18.203612,-65.989697 18.203639,-65.989863 18.203728,-65.990039 18.203876,-65.990131 18.203934,-65.990227 18.203965,-65.990443 18.203993,-65.990634 18.204041,-65.990758 18.204105,-65.993303 18.205092,-65.993437 18.205116,-65.993557 18.205098,-65.993704 18.205042,-65.993775 18.205023,-65.993866 18.205014,-65.993997 18.205041,-65.994085 18.205082,-65.994149 18.205134,-65.994246 18.205217,-65.994414 18.205331,-65.994536 18.205365,-65.994622 18.205387,-65.995434 18.205619,-65.995626 18.20565,-65.995738 18.205656,-65.996114 18.205648,-65.996252 18.205667,-65.996573 18.205747,-65.99671 18.205738,-65.996885 18.205711,-65.997005 18.205707,-65.997094 18.205727,-65.997161 18.205777,-65.997224 18.205865,-65.997322 18.206122,-65.997454 18.206309,-65.997654 18.206433,-65.997879 18.206499,-65.998102 18.206478,-65.998572 18.206464,-65.999169 18.206448,-65.999221 18.206472,-65.999243 18.206506,-65.999279 18.206588,-65.999242 18.206748,-65.999171 18.206991,-65.999178 18.207242,-65.999321 18.207518,-65.999554 18.207662,-65.999941 18.207788,-66.00008 18.207807,-66.000524 18.207699,-66.000606 18.207653,-66.00067 18.207587,-66.00079 18.207503,-66.00087 18.207529,-66.000923 18.207617,-66.001145 18.208881,-66.001221 18.20908,-66.00136 18.20922,-66.001823 18.209454,-66.00209 18.209616,-66.002171 18.20974,-66.002208 18.209867,-66.002216 18.210036,-66.002107 18.21385,-66.002116 18.214267,-66.00232 18.214755,-66.002568 18.215173,-66.002773 18.215505,-66.002981 18.215739,-66.003412 18.215999,-66.004209 18.216341,-66.004599 18.216578,-66.00492 18.21699,-66.005609 18.217467,-66.005971 18.217633,-66.008284 18.218312,-66.008913 18.218577,-66.00949 18.218924,-66.010717 18.219746,-66.011185 18.220055,-66.011423 18.220305,-66.012224 18.221367,-66.01267 18.222109,-66.01312 18.223119,-66.013315 18.223383,-66.013534 18.223581,-66.013777 18.223791,-66.014064 18.223951,-66.014331 18.224045,-66.014593 18.224109,-66.014998 18.224151,-66.020668 18.224146,-66.022271 18.223973,-66.023225 18.223789,-66.02424 18.223603,-66.024603 18.223598,-66.024985 18.223641,-66.025651 18.223756,-66.025977 18.223916,-66.026268 18.224132,-66.02656 18.224482,-66.027146 18.225388,-66.027448 18.225799,-66.029059 18.227167,-66.029679 18.227697,-66.032536 18.230047,-66.032331 18.2306,-66.032109 18.231164,-66.031803 18.231958,-66.031616 18.232446,-66.03123 18.233454,-66.031228 18.233502,-66.031241 18.233562,-66.031269 18.233596,-66.03135 18.233646,-66.031863 18.233822,-66.031909 18.233858,-66.031902 18.233893,-66.031715 18.234395,-66.031732 18.234432,-66.03199 18.234524,-66.032004 18.234592,-66.031891 18.234919)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'SL','TERM_CAGUAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'SL' and direction = 'TERM_CAGUAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8002, 0, 'SL', 'TERM_CAGUAS'),(8000, 1, 'SL', 'TERM_CAGUAS');
delete from ref.subroute_stop where route = 'SL' and direction = 'SAN_LORENZO'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8000, 0, 'SL', 'SAN_LORENZO'),(8002, 1, 'SL', 'SAN_LORENZO');
