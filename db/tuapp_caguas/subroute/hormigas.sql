delete from ref.subroute where route = 'HO' and direction = 'HORMIGAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.031847 18.235033,-66.031736 18.235393,-66.032763 18.23576,-66.032977 18.235735,-66.034855 18.236444,-66.036035 18.236808,-66.036087 18.237118,-66.036247 18.237332,-66.036726 18.237779,-66.037062 18.237952,-66.037517 18.237269,-66.037792 18.236643,-66.038041 18.235785,-66.038155 18.23477,-66.038208 18.234656,-66.038408 18.234543,-66.040033 18.234498,-66.041655 18.234603,-66.042696 18.234236,-66.046019 18.233364,-66.046368 18.233304,-66.04909 18.23321,-66.049673 18.233139,-66.050304 18.233121,-66.050373 18.232857,-66.050525 18.232649,-66.051409 18.232226,-66.051669 18.231992,-66.052293 18.230426,-66.052487 18.230193,-66.052888 18.229898,-66.053036 18.229687,-66.053513 18.22828,-66.053623 18.228259,-66.054126 18.228545,-66.054193 18.228526,-66.058104 18.224572,-66.058737 18.224019,-66.060627 18.22206,-66.061159 18.221747,-66.061359 18.221695,-66.06438 18.220254,-66.065144 18.219465,-66.065721 18.218999,-66.06653 18.218543,-66.06733 18.218228,-66.068017 18.218225,-66.068764 18.218461,-66.06943 18.218374,-66.069781 18.21837,-66.070004 18.218429,-66.070505 18.218942,-66.071125 18.21973,-66.071539 18.219796,-66.071808 18.219972,-66.071732 18.220514,-66.071782 18.220659,-66.071923 18.220728,-66.072003 18.220718,-66.072287 18.220584,-66.07241 18.220573,-66.072701 18.220857,-66.072836 18.220909,-66.072975 18.220874,-66.0733 18.220642,-66.07353 18.22061,-66.074002 18.220645,-66.074305 18.220521,-66.074376 18.220394,-66.074376 18.220205,-66.074059 18.219448,-66.074075 18.21932,-66.074161 18.219212,-66.074412 18.219119,-66.075377 18.21919,-66.075967 18.218846,-66.076093 18.218815,-66.076228 18.218839,-66.076384 18.218969,-66.076764 18.219627,-66.0768 18.219991,-66.076731 18.220593,-66.076775 18.220806,-66.0774 18.221341,-66.077692 18.221389,-66.079079 18.22122,-66.079258 18.221111,-66.07959 18.220715,-66.079664 18.220681,-66.079764 18.2207,-66.080107 18.221062,-66.080317 18.221175,-66.080501 18.221125,-66.081173 18.220749,-66.081283 18.220624,-66.081307 18.220352,-66.081045 18.219389,-66.081026 18.219176,-66.081192 18.219037,-66.081712 18.218848,-66.081822 18.218853,-66.081917 18.218989,-66.081799 18.219885,-66.081835 18.220098,-66.083159 18.222908,-66.083296 18.223098,-66.083875 18.223534,-66.084741 18.224555,-66.085366 18.224833,-66.086141 18.225343,-66.086881 18.225744,-66.087244 18.226031,-66.087552 18.226164,-66.088949 18.22644,-66.089821 18.22674,-66.090084 18.226679,-66.090364 18.226378,-66.090513 18.226314,-66.09179 18.226485,-66.091964 18.226469,-66.092567 18.226027,-66.09296 18.225807,-66.093138 18.225637,-66.093172 18.225468,-66.093017 18.22507,-66.093062 18.224911,-66.093143 18.224821,-66.093297 18.224758,-66.093897 18.224671,-66.095029 18.224036,-66.09603 18.223884,-66.096305 18.223755,-66.096442 18.223544,-66.096629 18.22273,-66.09684 18.222255,-66.096806 18.22182,-66.096856 18.221664,-66.097093 18.221522,-66.097827 18.221368,-66.098104 18.22115,-66.09818 18.220826,-66.098101 18.220045,-66.098021 18.219865,-66.097664 18.219559,-66.097513 18.219296,-66.09734 18.2182,-66.097324 18.217742,-66.09776 18.217006,-66.098986 18.215356,-66.099036 18.215109,-66.098882 18.214071,-66.098944 18.213758,-66.099065 18.213418,-66.099203 18.213187,-66.099967 18.21258,-66.100194 18.212297,-66.100526 18.211151,-66.100948 18.210166,-66.101086 18.209128,-66.101148 18.209009,-66.101122 18.208973,-66.101085 18.209005)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'HO','HORMIGAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'HO' and direction = 'TERM_CAGUAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.101077 18.209025,-66.100903 18.210155,-66.100481 18.211136,-66.100136 18.212283,-66.099868 18.21259,-66.099186 18.213118,-66.099039 18.213346,-66.098925 18.213647,-66.098828 18.214072,-66.09898 18.215067,-66.098937 18.215335,-66.097699 18.217,-66.097331 18.217576,-66.097259 18.217757,-66.097301 18.218315,-66.097461 18.219311,-66.097623 18.219592,-66.097976 18.219895,-66.098058 18.220076,-66.098139 18.220827,-66.098071 18.22112,-66.097986 18.221226,-66.097811 18.221332,-66.097077 18.221485,-66.096817 18.221639,-66.096759 18.221818,-66.096794 18.222245,-66.096584 18.222717,-66.096397 18.22353,-66.096272 18.223723,-66.09602 18.22384,-66.095013 18.223994,-66.093879 18.22463,-66.093286 18.224715,-66.093118 18.224783,-66.093021 18.224891,-66.092976 18.225028,-66.093131 18.225478,-66.09308 18.22565,-66.09195 18.226432,-66.091797 18.226446,-66.090508 18.226275,-66.090336 18.226349,-66.090067 18.226644,-66.089825 18.226701,-66.088959 18.226402,-66.087563 18.226126,-66.087267 18.225998,-66.086903 18.225711,-66.086163 18.22531,-66.085388 18.224799,-66.084768 18.224525,-66.083904 18.223505,-66.083325 18.223069,-66.083196 18.22289,-66.081873 18.220085,-66.081839 18.219886,-66.081958 18.218984,-66.08184 18.218818,-66.081704 18.218809,-66.081176 18.219002,-66.081079 18.219047,-66.080987 18.219165,-66.081006 18.219398,-66.081267 18.220358,-66.081245 18.220608,-66.081149 18.220717,-66.080482 18.221091,-66.080319 18.221136,-66.080136 18.221034,-66.079785 18.220666,-66.079658 18.220642,-66.079562 18.220686,-66.079231 18.221081,-66.079063 18.221184,-66.077692 18.22135,-66.077421 18.221305,-66.076812 18.220786,-66.076774 18.220593,-66.076843 18.219993,-66.076805 18.219615,-66.076419 18.218946,-66.076243 18.218801,-66.076093 18.218774,-66.075948 18.218809,-66.075366 18.21915,-66.07441 18.219078,-66.074135 18.21918,-66.074034 18.219307,-66.074017 18.219451,-66.074335 18.220213,-66.074311 18.220444,-66.074217 18.220536,-66.073996 18.220604,-66.07353 18.220569,-66.073285 18.220604,-66.072952 18.220839,-66.072839 18.220868,-66.072727 18.220824,-66.072425 18.220533,-66.07227 18.220546,-66.071995 18.220678,-66.071816 18.220633,-66.071775 18.220512,-66.071858 18.220094,-66.071837 18.219947,-66.071517 18.219738,-66.071177 18.21971,-66.070385 18.218747,-66.070114 18.218456,-66.069967 18.218364,-66.069428 18.218337,-66.068765 18.218424,-66.067846 18.218143,-66.067322 18.218191,-66.066294 18.2186,-66.065692 18.21896,-66.065135 18.219403,-66.064541 18.220037,-66.064304 18.220222,-66.063702 18.220506,-66.062779 18.220864,-66.061321 18.221582,-66.060713 18.221937,-66.060206 18.222365,-66.058619 18.224022,-66.058481 18.224108,-66.056916 18.225731,-66.054162 18.22845,-66.054099 18.228457,-66.05356 18.22814,-66.053447 18.228128,-66.053379 18.228168,-66.052931 18.22961,-66.052752 18.22985,-66.052418 18.230076,-66.052187 18.230344,-66.05155 18.231924,-66.051314 18.232131,-66.050462 18.232527,-66.050082 18.232966,-66.049749 18.233084,-66.046667 18.233174,-66.045994 18.233256,-66.042696 18.234122,-66.041661 18.234459,-66.040446 18.234405,-66.03814 18.234499,-66.037965 18.23463,-66.037933 18.23475,-66.037842 18.235818,-66.03768 18.236544,-66.037393 18.237222,-66.036982 18.237834,-66.036875 18.237821,-66.036652 18.237651,-66.036153 18.237138,-66.036108 18.236969,-66.036254 18.236334,-66.036221 18.236263,-66.033243 18.235142,-66.03316 18.235054,-66.033217 18.234905,-66.033189 18.234851,-66.032744 18.234686,-66.03251 18.234626,-66.032386 18.234652,-66.032037 18.234551,-66.031897 18.234878)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'HO','TERM_CAGUAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'HO' and direction = 'TERM_CAGUAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8027, 0, 'HO', 'TERM_CAGUAS'),(8000, 1, 'HO', 'TERM_CAGUAS');
delete from ref.subroute_stop where route = 'HO' and direction = 'HORMIGAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8000, 0, 'HO', 'HORMIGAS'),(8027, 1, 'HO', 'HORMIGAS');
