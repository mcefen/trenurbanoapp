delete from ref.subroute where route = 'CR' and direction = 'CARRAIZO';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.03234 18.23515,-66.031816 18.235178,-66.031746 18.235361,-66.032007 18.235497,-66.032627 18.235705,-66.032715 18.23574,-66.032805 18.235769,-66.032878 18.235762,-66.032931 18.235729,-66.032995 18.235735,-66.033253 18.235829,-66.03496 18.236462,-66.035069 18.236533,-66.035096 18.236643,-66.035155 18.237611,-66.035178 18.238273,-66.035194 18.238564,-66.035211 18.23901,-66.035215 18.239216,-66.035247 18.239705,-66.035275 18.240162,-66.035315 18.240711,-66.035571 18.244759,-66.035687 18.246479,-66.036187 18.253834,-66.036255 18.254697,-66.036296 18.255167,-66.036445 18.256498,-66.036563 18.257307,-66.036735 18.258012,-66.036871 18.258564,-66.037145 18.259499,-66.037428 18.260462,-66.037699 18.261426,-66.03777 18.26167,-66.03815 18.262942,-66.038209 18.263135,-66.0388 18.265144,-66.039363 18.26709,-66.039941 18.269043,-66.040504 18.270988,-66.040718 18.271762,-66.040933 18.272536,-66.041054 18.273197,-66.041276 18.274088,-66.041372 18.274582,-66.041447 18.27503,-66.04185 18.277435,-66.041909 18.277735,-66.042358 18.280564,-66.042823 18.283557,-66.042948 18.284272,-66.043116 18.284902,-66.043327 18.285581,-66.043552 18.286145,-66.044154 18.287367,-66.044685 18.288262,-66.045254 18.289077,-66.046011 18.290018,-66.047165 18.29113,-66.048715 18.292354,-66.050351 18.293836,-66.051207 18.294505,-66.051232 18.294592,-66.051153 18.294687,-66.050647 18.295297,-66.05008 18.295989,-66.049655 18.296472,-66.049352 18.296719,-66.049013 18.296905,-66.048739 18.297028,-66.048021 18.29735,-66.047653 18.297509,-66.047249 18.297632,-66.047024 18.297661,-66.046854 18.297661,-66.046642 18.29765,-66.046369 18.297662,-66.046177 18.297689,-66.046001 18.297775,-66.045811 18.29801,-66.045574 18.298336,-66.045417 18.298467,-66.045242 18.298559,-66.045016 18.298633,-66.044657 18.298725,-66.044467 18.2988,-66.044328 18.298901,-66.044186 18.299067,-66.044077 18.299291,-66.043948 18.299618,-66.043718 18.300213,-66.043668 18.30044,-66.043687 18.300629,-66.043746 18.300911,-66.04392 18.301544,-66.043957 18.30178,-66.043934 18.301991,-66.043779 18.302224,-66.043598 18.302364,-66.043415 18.302435,-66.043244 18.302451,-66.04311 18.302438,-66.042987 18.302402,-66.042221 18.302104,-66.041748 18.30188,-66.041654 18.301833,-66.041204 18.301664,-66.040736 18.301554,-66.040278 18.301562,-66.039995 18.301587,-66.039447 18.301756,-66.03915 18.301902,-66.038934 18.302044,-66.038679 18.302255,-66.037495 18.303188,-66.036788 18.303737,-66.036297 18.304124,-66.035916 18.304446,-66.035694 18.304668,-66.035477 18.30495,-66.035 18.305638,-66.034788 18.305894,-66.034638 18.306037,-66.034282 18.306188,-66.034086 18.306214,-66.033868 18.306192,-66.033728 18.306145,-66.033579 18.306083,-66.033337 18.305995,-66.033113 18.305954,-66.032816 18.305968,-66.032422 18.306032,-66.03214 18.306039,-66.031878 18.30599,-66.031583 18.305912,-66.030838 18.305636,-66.030556 18.305582,-66.030359 18.305606,-66.030066 18.305724,-66.029801 18.30593,-66.029619 18.306179,-66.029348 18.306637,-66.028923 18.307308,-66.028709 18.307712,-66.028511 18.307841)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'CR','CARRAIZO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'CR' and direction = 'TERM_CAGUAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.028544 18.30787,-66.028741 18.307744,-66.028977 18.307337,-66.029401 18.306666,-66.029671 18.30621,-66.029846 18.30597,-66.030098 18.305774,-66.030375 18.305663,-66.030554 18.305642,-66.030821 18.305693,-66.031564 18.305967,-66.031863 18.306047,-66.032135 18.306098,-66.032428 18.30609,-66.032823 18.306026,-66.033109 18.306012,-66.03332 18.306052,-66.033556 18.306137,-66.033706 18.306199,-66.033854 18.306249,-66.034087 18.306272,-66.034299 18.306245,-66.034674 18.306086,-66.034834 18.305933,-66.03505 18.305672,-66.035528 18.304983,-66.035741 18.304706,-66.035959 18.304488,-66.036338 18.304169,-66.036827 18.303782,-66.037534 18.303233,-66.038719 18.302299,-66.038971 18.30209,-66.039182 18.301952,-66.039471 18.30181,-66.040007 18.301645,-66.040282 18.30162,-66.040729 18.301613,-66.041185 18.301719,-66.041628 18.301886,-66.04172 18.301932,-66.042196 18.302157,-66.042966 18.302457,-66.043098 18.302496,-66.043244 18.30251,-66.043429 18.302492,-66.04363 18.302415,-66.043825 18.302263,-66.043993 18.302011,-66.044019 18.301779,-66.043981 18.301532,-66.043806 18.300897,-66.043748 18.30062,-66.04373 18.300443,-66.043777 18.300229,-66.044006 18.299638,-66.044134 18.299314,-66.044238 18.299098,-66.044371 18.298944,-66.044498 18.298851,-66.044677 18.298781,-66.045034 18.298688,-66.045267 18.298613,-66.045453 18.298515,-66.04562 18.298375,-66.045861 18.298044,-66.046041 18.297821,-66.046196 18.297745,-66.046375 18.29772,-66.046641 18.297708,-66.046852 18.297719,-66.047028 18.297719,-66.047263 18.29769,-66.047675 18.297564,-66.048047 18.297402,-66.048766 18.297081,-66.049042 18.296956,-66.049387 18.296767,-66.049699 18.296514,-66.050128 18.296025,-66.050695 18.295333,-66.051202 18.294723,-66.051295 18.29462,-66.051329 18.294482,-66.051319 18.294332,-66.051197 18.294226,-66.050944 18.294002,-66.050474 18.293647,-66.049967 18.293265,-66.049166 18.292627,-66.048737 18.292263,-66.048 18.29167,-66.047249 18.291051,-66.046613 18.290459,-66.04607 18.289896,-66.045279 18.288932,-66.044722 18.288118,-66.044215 18.287238,-66.043904 18.286606,-66.043655 18.28602,-66.04343 18.285454,-66.043221 18.284785,-66.043054 18.284158,-66.04293 18.283446,-66.042465 18.280453,-66.041984 18.27773,-66.04194 18.277427,-66.041758 18.276226,-66.041503 18.275022,-66.041428 18.274573,-66.041332 18.274078,-66.041247 18.273171,-66.041067 18.272403,-66.040823 18.271558,-66.040597 18.270867,-66.040041 18.268977,-66.039465 18.267067,-66.038354 18.263159,-66.038278 18.262837,-66.037948 18.261826,-66.037808 18.261405,-66.037533 18.260441,-66.037245 18.259491,-66.036967 18.258475,-66.036849 18.258006,-66.036688 18.257256,-66.036553 18.256495,-66.03642 18.255185,-66.036366 18.254648,-66.036334 18.253936,-66.035837 18.246462,-66.035737 18.244966,-66.035627 18.243314,-66.035473 18.241293,-66.035425 18.240734,-66.035397 18.240146,-66.035392 18.240022,-66.035397 18.239854,-66.035444 18.23966,-66.035532 18.239439,-66.035619 18.23932,-66.036012 18.239035,-66.03615 18.238916,-66.036602 18.238463,-66.03664 18.238378,-66.036938 18.238047,-66.036953 18.237966,-66.036928 18.237879,-66.036873 18.237813,-66.036788 18.237762,-66.036427 18.23745,-66.036227 18.237243,-66.036158 18.237145,-66.036116 18.237048,-66.036114 18.236912,-66.036118 18.236821,-66.036248 18.236302,-66.036214 18.236241,-66.036036 18.236188,-66.035359 18.235949,-66.034139 18.235498,-66.0332 18.235112,-66.033152 18.235083,-66.03316 18.235029,-66.033196 18.234918,-66.033193 18.234836,-66.033049 18.234781,-66.032509 18.23461,-66.032444 18.234647,-66.032296 18.23463,-66.03211 18.234574,-66.032032 18.234583,-66.032378 18.235102)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'CR','TERM_CAGUAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'CR' and direction = 'TERM_CAGUAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8018, 0, 'CR', 'TERM_CAGUAS'),(8000, 1, 'CR', 'TERM_CAGUAS');
delete from ref.subroute_stop where route = 'CR' and direction = 'CARRAIZO'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8000, 0, 'CR', 'CARRAIZO'),(8018, 1, 'CR', 'CARRAIZO');
