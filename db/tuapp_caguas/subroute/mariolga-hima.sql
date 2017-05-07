delete from ref.subroute where route = 'HI' and direction = 'MARIOLGA_HIMA';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.031856 18.235035,-66.031749 18.235322,-66.030735 18.235051,-66.031324 18.233574,-66.031505 18.233171,-66.031832 18.232466,-66.031912 18.232384,-66.032211 18.232007,-66.03301 18.23034,-66.034564 18.228074,-66.034857 18.22758,-66.034906 18.227411,-66.034944 18.227254,-66.035028 18.227115,-66.035145 18.227022,-66.035421 18.226531,-66.035528 18.226415,-66.03572 18.226347,-66.035952 18.226364,-66.036416 18.226563,-66.036799 18.226724,-66.037118 18.226879,-66.037335 18.226863,-66.039676 18.222582,-66.040516 18.221037,-66.040596 18.220826,-66.040703 18.220624,-66.040698 18.220529,-66.040609 18.22048,-66.039698 18.220414,-66.03924 18.220398,-66.037846 18.220279,-66.03779 18.220254,-66.037778 18.220219,-66.037876 18.219283,-66.037898 18.21926,-66.037937 18.219244,-66.038459 18.219284,-66.038514 18.219274,-66.038576 18.219236,-66.038882 18.218241,-66.038885 18.218196,-66.038836 18.218149,-66.038763 18.218135,-66.0386 18.218103,-66.038067 18.218055,-66.037903 18.21803,-66.037757 18.217998,-66.037638 18.217949,-66.036922 18.217514,-66.03638 18.217164,-66.036027 18.216951,-66.035986 18.216926,-66.035938 18.216917,-66.035918 18.216921,-66.035888 18.216929,-66.035862 18.216964,-66.035832 18.217006,-66.035745 18.217187,-66.035683 18.217342,-66.035669 18.217434,-66.03566 18.217562,-66.03566 18.217747,-66.03568 18.217877,-66.035705 18.217967,-66.035719 18.218038,-66.035709 18.218063,-66.035697 18.218083,-66.035655 18.218104,-66.035505 18.218152,-66.035354 18.218234,-66.035148 18.218391,-66.035077 18.218466,-66.03497 18.218613,-66.034745 18.219012,-66.034497 18.21945,-66.034331 18.219755,-66.03431 18.219795,-66.034295 18.219815,-66.034274 18.21983,-66.034247 18.219837,-66.034208 18.219837,-66.034169 18.21983,-66.033962 18.219725,-66.033803 18.219645,-66.033779 18.219632,-66.033759 18.219619,-66.033754 18.219596,-66.033756 18.219568,-66.033894 18.219319,-66.034255 18.218671,-66.034331 18.218551,-66.034717 18.218043,-66.035307 18.217294,-66.035334 18.217262,-66.035343 18.217237,-66.035341 18.217212,-66.035318 18.217175,-66.035155 18.217071,-66.035002 18.216971,-66.034947 18.216934,-66.034911 18.21692,-66.034884 18.216918,-66.034857 18.216921,-66.034827 18.216937,-66.034749 18.217014,-66.034251 18.217662,-66.034209 18.217713,-66.034191 18.217726,-66.034158 18.217732,-66.034116 18.217729,-66.034065 18.217696,-66.033906 18.217584,-66.033842 18.217533,-66.03378 18.21749,-66.033728 18.217453,-66.033696 18.21744,-66.033657 18.217434,-66.033621 18.217439,-66.033598 18.217448,-66.033564 18.217475,-66.033192 18.217968,-66.032865 18.2184,-66.031899 18.219428,-66.031866 18.219445,-66.031831 18.219456,-66.031789 18.219459,-66.031729 18.219458,-66.031666 18.21944,-66.031626 18.219419,-66.031491 18.219319,-66.031386 18.219242,-66.031346 18.219209,-66.031323 18.219183,-66.031322 18.219154,-66.031341 18.219107,-66.031505 18.218921,-66.031548 18.218885,-66.031615 18.218864,-66.031866 18.218828,-66.031977 18.218811,-66.032079 18.21879,-66.032144 18.218774,-66.032178 18.218757,-66.032228 18.218726,-66.032306 18.218637,-66.032362 18.218571,-66.032377 18.21854,-66.032383 18.218507,-66.032375 18.218478,-66.032362 18.218449,-66.032336 18.218438,-66.032309 18.218435,-66.032245 18.218436,-66.032146 18.218449,-66.032002 18.218475)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'HI','MARIOLGA_HIMA', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'HI' and direction = 'TERM_CAGUAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.031906 18.218493,-66.031755 18.218523,-66.031715 18.218551,-66.031661 18.218607,-66.031585 18.218702,-66.031233 18.219107,-66.031226 18.219144,-66.031229 18.21919,-66.031238 18.219227,-66.031251 18.219267,-66.031272 18.219293,-66.031333 18.219342,-66.031573 18.219531,-66.031643 18.219589,-66.031663 18.219604,-66.031691 18.219613,-66.031727 18.219614,-66.031778 18.219616,-66.031834 18.219616,-66.031882 18.219604,-66.031938 18.219546,-66.032532 18.218883,-66.032807 18.218574,-66.03297 18.218379,-66.033253 18.218006,-66.033632 18.2175,-66.03364 18.217452,-66.033626 18.217403,-66.0336 18.217366,-66.033543 18.217317,-66.033405 18.217222,-66.033338 18.217162,-66.03315 18.21696,-66.033046 18.216845,-66.033006 18.216794,-66.032985 18.216751,-66.032976 18.216707,-66.032973 18.216659,-66.03298 18.216573,-66.032999 18.216466,-66.033027 18.216361,-66.033082 18.216257,-66.033225 18.216076,-66.033589 18.215713,-66.034021 18.215303,-66.034243 18.215093,-66.034317 18.215012,-66.034353 18.214967,-66.034405 18.21489,-66.034464 18.214799,-66.034787 18.214251,-66.035157 18.213629,-66.035621 18.21293,-66.035796 18.212674,-66.03592 18.212521,-66.036056 18.212386,-66.036177 18.212275,-66.036435 18.212082,-66.036804 18.211884,-66.036974 18.211812,-66.03716 18.211757,-66.037427 18.211685,-66.037659 18.211657,-66.037891 18.211647,-66.038043 18.211644,-66.038119 18.211652,-66.038155 18.211667,-66.038191 18.211688,-66.038227 18.211744,-66.038285 18.21187,-66.03834 18.212012,-66.038352 18.212088,-66.03835 18.212134,-66.03834 18.21219,-66.03833 18.212226,-66.038304 18.212249,-66.038278 18.212262,-66.038228 18.212272,-66.038098 18.212271,-66.037766 18.212269,-66.037485 18.212308,-66.037175 18.212399,-66.0369 18.212525,-66.036556 18.212779,-66.036373 18.212975,-66.036118 18.213336,-66.036114 18.213358,-66.036117 18.213387,-66.036123 18.213404,-66.036129 18.213427,-66.036166 18.213463,-66.036513 18.213682,-66.036547 18.213702,-66.036568 18.213708,-66.036601 18.213704,-66.036652 18.213696,-66.036679 18.213684,-66.036742 18.213589,-66.036818 18.213493,-66.036904 18.213393,-66.037052 18.213258,-66.037152 18.213185,-66.037282 18.213111,-66.037434 18.213043,-66.037548 18.213007,-66.037676 18.212977,-66.037757 18.21296,-66.037877 18.212945,-66.038021 18.212933,-66.038123 18.212936,-66.038663 18.212992,-66.038753 18.213001,-66.038792 18.213008,-66.038813 18.213017,-66.038819 18.213031,-66.038827 18.21305,-66.038699 18.213993,-66.038694 18.214015,-66.038685 18.214035,-66.038667 18.214056,-66.038637 18.214065,-66.038581 18.214058,-66.038446 18.21404,-66.038373 18.214036,-66.038275 18.214035,-66.038175 18.214038,-66.038086 18.214049,-66.037972 18.214099,-66.037807 18.214185,-66.037694 18.2143,-66.037521 18.21454,-66.036946 18.215385,-66.036616 18.215874,-66.036602 18.215885,-66.036577 18.215888,-66.036518 18.215868,-66.036124 18.215637,-66.035737 18.215391,-66.035676 18.215355,-66.035634 18.215338,-66.035571 18.215331,-66.035524 18.215331,-66.035488 18.215339,-66.035457 18.215365,-66.035273 18.215637,-66.0351 18.215837,-66.034859 18.216058,-66.034807 18.216107,-66.034781 18.216139,-66.034778 18.216161,-66.034787 18.216191,-66.034809 18.216211,-66.03533 18.216525,-66.035844 18.216871,-66.03594 18.216956,-66.036326 18.217198,-66.036679 18.217423,-66.037546 18.217954,-66.037727 18.218031,-66.037957 18.218089,-66.038297 18.218123,-66.038742 18.218176,-66.038796 18.218195,-66.03881 18.21823,-66.038806 18.218281,-66.038609 18.218928,-66.038536 18.219188,-66.038497 18.21922,-66.03844 18.219226,-66.037892 18.219182,-66.037855 18.219193,-66.037828 18.219238,-66.037822 18.219273,-66.037718 18.220227,-66.037735 18.220275,-66.037814 18.22032,-66.039228 18.220438,-66.039725 18.220454,-66.04059 18.220505,-66.040631 18.220529,-66.040625 18.220618,-66.039634 18.222561,-66.037328 18.226743,-66.037129 18.227145,-66.036432 18.228407,-66.036162 18.228931,-66.035612 18.230205,-66.035167 18.231265,-66.035111 18.231277,-66.034879 18.231252,-66.034417 18.231325,-66.03431 18.231827,-66.034118 18.232441,-66.033969 18.232988,-66.03373 18.233717,-66.033503 18.234387,-66.033422 18.234439,-66.033231 18.234841,-66.033154 18.234829,-66.032671 18.234659,-66.032511 18.234623,-66.032442 18.234643,-66.03239 18.234653,-66.032117 18.234566,-66.032047 18.234563,-66.03201 18.234596,-66.031879 18.234972)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'HI','TERM_CAGUAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'HI' and direction = 'MARIOLGA_HIMA'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8000, 0, 'HI', 'MARIOLGA_HIMA'),(8022, 1, 'HI', 'MARIOLGA_HIMA');
delete from ref.subroute_stop where route = 'HI' and direction = 'TERM_CAGUAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8022, 0, 'HI', 'TERM_CAGUAS'),(8000, 1, 'HI', 'TERM_CAGUAS');