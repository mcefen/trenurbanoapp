delete from ref.subroute_new where route = 'D27' and direction = 'GUAYNABO'; with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.101666 18.390898,-66.102544 18.390925,-66.102717 18.390911,-66.102818 18.390848,-66.103245 18.390439,-66.103451 18.390239,-66.103916 18.389484,-66.103906 18.38942,-66.103873 18.389375,-66.103758 18.389311,-66.103489 18.389243,-66.102843 18.389243,-66.102456 18.389211,-66.101953 18.389129,-66.101394 18.389143,-66.100817 18.389202,-66.100441 18.389199,-66.099991 18.389173,-66.09966 18.389158,-66.099332 18.38919,-66.098782 18.389318,-66.097325 18.389767,-66.096371 18.390063,-66.095957 18.39011,-66.094906 18.390183,-66.094848 18.390168,-66.094836 18.390124,-66.094879 18.389153,-66.094922 18.388589,-66.09496 18.38838,-66.094974 18.388178,-66.095029 18.387642,-66.0951 18.387379,-66.095231 18.387222,-66.095376 18.3871,-66.09564 18.386951,-66.095827 18.386867,-66.096018 18.386832,-66.096849 18.38687,-66.097158 18.386829,-66.097648 18.386724,-66.098143 18.386539,-66.09878 18.38617,-66.099159 18.385843,-66.09966 18.385235,-66.100041 18.384433,-66.100487 18.383405,-66.100969 18.382204,-66.101055 18.38191,-66.101067 18.381606,-66.100979 18.380606,-66.10088 18.379664,-66.100853 18.379545,-66.100761 18.379515,-66.10062 18.37951,-66.099021 18.379617,-66.098879 18.379609,-66.098364 18.379431,-66.097446 18.378898,-66.097105 18.378655,-66.096921 18.378547,-66.096749 18.378489,-66.096442 18.378422,-66.095956 18.378253,-66.095279 18.37791,-66.095117 18.377804,-66.094949 18.377594,-66.094722 18.377205,-66.094667 18.377071,-66.094667 18.376969,-66.094697 18.376637,-66.094691 18.376512,-66.094627 18.376416,-66.094434 18.376311,-66.093097 18.375765,-66.092155 18.375445,-66.091291 18.375244,-66.089454 18.37482,-66.089173 18.374698,-66.088683 18.374369,-66.088186 18.373857,-66.087519 18.373209,-66.086998 18.3727,-66.086763 18.372368,-66.086523 18.371966,-66.086121 18.370937,-66.086121 18.370767,-66.086142 18.370649,-66.086232 18.370552,-66.086446 18.370418,-66.08676 18.370263,-66.086941 18.370234,-66.087075 18.370217,-66.087255 18.370198,-66.087578 18.37014,-66.087778 18.37008,-66.088136 18.369938,-66.088799 18.369553,-66.089196 18.36928,-66.089554 18.368974,-66.089869 18.368623,-66.090151 18.368378,-66.090357 18.368213,-66.090791 18.368006,-66.091074 18.367948,-66.091577 18.36786,-66.092983 18.367649,-66.093479 18.367554,-66.093979 18.367413,-66.094438 18.367243,-66.095057 18.366912,-66.095351 18.366722,-66.095409 18.366702,-66.095466 18.36671,-66.095522 18.366746,-66.096138 18.367566,-66.096648 18.3682,-66.097114 18.368686,-66.09771 18.369239,-66.098762 18.370217,-66.099638 18.370924,-66.100443 18.371316,-66.101771 18.371923,-66.102163 18.372016,-66.102198 18.372013,-66.103736 18.372105,-66.105091 18.372141,-66.106371 18.372169,-66.107683 18.372216,-66.107902 18.372262,-66.108574 18.372564,-66.10961 18.373064,-66.109836 18.37311,-66.113005 18.373215,-66.113692 18.373219,-66.113819 18.37319,-66.113863 18.373116,-66.113894 18.372253,-66.113949 18.370477,-66.113968 18.370182,-66.113934 18.370089,-66.113848 18.370041,-66.112848 18.369799,-66.112565 18.369724,-66.111952 18.369243,-66.111373 18.368788,-66.111361 18.368729,-66.111399 18.368663,-66.111741 18.368222,-66.111782 18.36807,-66.111784 18.367888,-66.111618 18.367612,-66.110762 18.366913,-66.110649 18.366817,-66.11063 18.366758,-66.110652 18.366703,-66.110772 18.366573,-66.110937 18.366365,-66.111015 18.366226,-66.111542 18.364438,-66.111616 18.36413,-66.111642 18.363884,-66.111625 18.363619,-66.111368 18.362418,-66.111171 18.36172,-66.111195 18.361663,-66.111265 18.361608,-66.113856 18.360949,-66.114911 18.360748,-66.115309 18.360703,-66.115716 18.360712,-66.116005 18.360748,-66.116087 18.360741,-66.116212 18.3607,-66.116293 18.360655,-66.116375 18.360572,-66.116462 18.360112,-66.116491 18.359867,-66.116491 18.359591,-66.116459 18.359365,-66.116389 18.359138,-66.116255 18.358862,-66.116006 18.358524,-66.115841 18.358393)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'D27','GUAYNABO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_new where route = 'D27' and direction = 'MARTINEZ_NADAL'; with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.115841 18.358393,-66.115451 18.358068,-66.115262 18.358041,-66.115042 18.358229,-66.114265 18.359501,-66.113953 18.360052,-66.113874 18.360296,-66.113789 18.360536,-66.1137 18.36066,-66.113553 18.360742,-66.113404 18.360813,-66.112095 18.361216,-66.111294 18.361457,-66.111164 18.361518,-66.111103 18.361576,-66.111082 18.361644,-66.111091 18.361719,-66.111378 18.362847,-66.11138 18.362884,-66.111563 18.363636,-66.111585 18.363811,-66.11157 18.363992,-66.111537 18.364188,-66.111433 18.364545,-66.110975 18.366187,-66.110922 18.366306,-66.110756 18.366514,-66.110594 18.366709,-66.110579 18.366759,-66.110587 18.366817,-66.110644 18.366885,-66.111564 18.367626,-66.11167 18.367783,-66.111716 18.367866,-66.111725 18.367971,-66.111708 18.368103,-66.111623 18.368279,-66.111319 18.36865,-66.111293 18.368753,-66.111319 18.368812,-66.111897 18.369277,-66.112538 18.369772,-66.112844 18.369866,-66.113707 18.370053,-66.113867 18.370127,-66.113896 18.3702,-66.113901 18.370316,-66.113802 18.372993,-66.113795 18.373064,-66.113764 18.373123,-66.113716 18.373162,-66.113639 18.373164,-66.110898 18.373093,-66.10978 18.373036,-66.109582 18.372972,-66.108227 18.372299,-66.107919 18.372196,-66.107671 18.372155,-66.105046 18.372088,-66.103891 18.37205,-66.102884 18.371999,-66.102176 18.371961,-66.101928 18.371913,-66.101663 18.371825,-66.100255 18.371169,-66.099601 18.370841,-66.098601 18.370014,-66.096871 18.368372,-66.096673 18.368152,-66.095648 18.366852,-66.095535 18.366688,-66.095439 18.366629,-66.095357 18.36664,-66.095292 18.366684,-66.09436 18.367209,-66.094036 18.367321,-66.093732 18.367433,-66.093421 18.367515,-66.09271 18.367631,-66.091695 18.367777,-66.090828 18.367924,-66.090643 18.368004,-66.090428 18.368103,-66.090217 18.368236,-66.089982 18.368381,-66.089838 18.368531,-66.089721 18.368675,-66.08949 18.368914,-66.089325 18.369105,-66.089099 18.369276,-66.088177 18.369849,-66.087898 18.369957,-66.087551 18.370073,-66.087237 18.370139,-66.086915 18.37018,-66.086725 18.370218,-66.086597 18.370259,-66.086436 18.370351,-66.086299 18.370417,-66.086017 18.370556,-66.085945 18.370622,-66.085893 18.370746,-66.085884 18.370905,-66.086033 18.371391,-66.086411 18.372257,-66.086638 18.372619,-66.086958 18.372983,-66.087823 18.373804,-66.088578 18.37456,-66.089146 18.374909,-66.089571 18.37506,-66.090336 18.37522,-66.091605 18.3755,-66.092264 18.375661,-66.093249 18.376007,-66.094467 18.376529,-66.094584 18.37662,-66.094615 18.376702,-66.094594 18.376855,-66.094601 18.377056,-66.094618 18.377166,-66.09469 18.377271,-66.094882 18.377577,-66.095071 18.377828,-66.09552 18.378081,-66.095996 18.378321,-66.096423 18.378462,-66.096723 18.378526,-66.096976 18.378623,-66.097327 18.378875,-66.09788 18.379212,-66.098408 18.379487,-66.098783 18.379607,-66.099008 18.379655,-66.099391 18.379641,-66.100637 18.379566,-66.100743 18.379566,-66.100796 18.379591,-66.100817 18.379632,-66.100998 18.381611,-66.100986 18.381908,-66.10088 18.382326,-66.100697 18.382727,-66.100212 18.383872,-66.099689 18.385052,-66.099498 18.385336,-66.099177 18.385726,-66.098829 18.386041,-66.098514 18.386267,-66.09786 18.386603,-66.097472 18.386722,-66.096942 18.386833,-66.096549 18.386824,-66.096054 18.386781,-66.095585 18.386774,-66.095383 18.386767,-66.095292 18.38684,-66.095222 18.387011,-66.095111 18.387272,-66.09502 18.387443,-66.094964 18.3878,-66.09489 18.388467,-66.094837 18.388791,-66.094762 18.390051,-66.094777 18.390144,-66.094825 18.390195,-66.094904 18.390224,-66.095063 18.390217,-66.096346 18.390121,-66.096505 18.390067,-66.097772 18.389671,-66.098855 18.389351,-66.099317 18.389255,-66.099594 18.389227,-66.099949 18.389225,-66.100656 18.389259,-66.101404 18.3892,-66.101892 18.389193,-66.102414 18.389269,-66.102708 18.389285,-66.103247 18.389307,-66.103547 18.389316,-66.103718 18.389346,-66.103786 18.389408,-66.10379 18.389538,-66.103716 18.389673,-66.103372 18.390172,-66.103253 18.390338,-66.103104 18.390482,-66.102725 18.390823,-66.102562 18.391001,-66.102545 18.391106,-66.102547 18.391268,-66.102515 18.391338,-66.102412 18.391358,-66.102142 18.391367,-66.101229 18.391317,-66.101107 18.391286,-66.101037 18.391204,-66.101015 18.391106,-66.10103 18.391009,-66.101066 18.390935,-66.101202 18.390885,-66.101434 18.390883,-66.101554 18.390892)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'D27','MARTINEZ_NADAL', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;