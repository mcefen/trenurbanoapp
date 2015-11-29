delete from ref.subroute_new where route = 'D91' and direction = 'SANTA_JUANITA';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.155252 18.400612,-66.154876 18.400698,-66.154776 18.400734,-66.154726 18.400802,-66.154705 18.400863,-66.154711 18.400951,-66.154789 18.40123,-66.154799 18.401351,-66.154788 18.401423,-66.154753 18.401474,-66.15469 18.401484,-66.154544 18.401471,-66.153175 18.401289,-66.152814 18.401247,-66.152214 18.401154,-66.150813 18.400937,-66.149856 18.400784,-66.149203 18.400682,-66.148426 18.400529,-66.147663 18.400351,-66.14736 18.400275,-66.147106 18.400171,-66.146885 18.40006,-66.146662 18.399919,-66.145442 18.398968,-66.144275 18.397971,-66.144176 18.397856,-66.144027 18.397657,-66.143927 18.397438,-66.143845 18.397202,-66.143798 18.396944,-66.143787 18.395429,-66.143641 18.394473,-66.143578 18.394352,-66.14345 18.394201,-66.14317 18.393896,-66.142915 18.393489,-66.141831 18.391634,-66.141474 18.390944,-66.141417 18.39076,-66.141349 18.39052,-66.1413 18.390226,-66.141292 18.389808,-66.14134 18.389441,-66.141918 18.386577,-66.141965 18.386408,-66.142035 18.386356,-66.14306 18.386268,-66.144059 18.38618,-66.144296 18.386144,-66.144637 18.386048,-66.144885 18.385909,-66.145044 18.38581,-66.145107 18.385752,-66.145139 18.385712,-66.145133 18.385657,-66.145067 18.385561,-66.143718 18.383906,-66.143346 18.383509,-66.143073 18.383231,-66.142942 18.383099,-66.142855 18.383008,-66.142786 18.382869,-66.142753 18.382767,-66.142757 18.38265,-66.142805 18.382438,-66.143447 18.379259,-66.14372 18.377917,-66.143788 18.377645,-66.14383 18.377225,-66.143808 18.376946,-66.143785 18.376737,-66.143609 18.375686,-66.143317 18.374252,-66.142837 18.373184,-66.142828 18.373103,-66.142752 18.372935,-66.142671 18.372754,-66.142684 18.372695,-66.142858 18.372619,-66.14298589717308 18.37256566844932,-66.14296060507937 18.372503549022507,-66.142665 18.372639,-66.142565 18.372735,-66.142575 18.372896,-66.142836 18.373408,-66.143096 18.373945,-66.14327 18.374338,-66.143372 18.374806,-66.143722 18.376719,-66.143747 18.376897,-66.143765 18.377013,-66.143792 18.377106,-66.143878 18.377131,-66.144114 18.37714,-66.144771 18.377166,-66.145181 18.377166,-66.145521 18.377128,-66.145882 18.377028,-66.146149 18.376937,-66.146592 18.376704,-66.147249 18.376232,-66.151842 18.372884,-66.154761 18.370754,-66.155927 18.369899,-66.156429 18.369486,-66.158676 18.367348,-66.159082 18.367008,-66.159666 18.366711,-66.161511 18.365894,-66.161564 18.36586,-66.161579 18.365792,-66.161564 18.365691,-66.161446 18.365268,-66.161407 18.364918,-66.161404 18.364566,-66.161452 18.364256,-66.161651 18.363695,-66.162623 18.361269,-66.162936 18.360493,-66.163279 18.359873,-66.163804 18.35903,-66.164123 18.358645,-66.165349 18.357208,-66.165911 18.356562,-66.165911 18.356523,-66.165872 18.356472,-66.165763 18.356382,-66.165413 18.356197,-66.165036 18.356121,-66.164577 18.356112,-66.16188 18.356093,-66.161535 18.35607,-66.161343 18.355992,-66.160949 18.355684,-66.16021 18.354999,-66.16001 18.354852,-66.159687 18.354731,-66.158432 18.35449)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'D91','SANTA_JUANITA', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_new where route = 'D91' and direction = 'BAYAMON';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.158432 18.35449,-66.157815 18.354381,-66.157718 18.354381,-66.157611 18.354431,-66.157576 18.354516,-66.157519 18.354687,-66.157326 18.355059,-66.157145 18.355312,-66.155049 18.358,-66.154874 18.358225,-66.154477 18.358752,-66.154313 18.359029,-66.154369 18.359242,-66.154565 18.359435,-66.154629 18.35964,-66.154589 18.360008,-66.154677 18.360304,-66.15482 18.360607,-66.155036 18.360903,-66.15522 18.361233,-66.155212 18.361609,-66.155084 18.361889,-66.154966 18.361978,-66.15483 18.362035,-66.154638 18.362051,-66.153957 18.362013,-66.153739 18.362043,-66.153321 18.362158,-66.152662 18.36244,-66.15245 18.362617,-66.152227 18.362807,-66.151401 18.363196,-66.150816 18.363357,-66.150505 18.363405,-66.150177 18.363524,-66.15011 18.363676,-66.150152 18.363955,-66.150418 18.364299,-66.15061 18.364634,-66.150655 18.364838,-66.150556 18.365026,-66.150356 18.365251,-66.150163 18.365536,-66.150186 18.36578,-66.15033 18.366013,-66.15076 18.366276,-66.151102 18.36653,-66.151678 18.36708,-66.152297 18.367805,-66.153109 18.368753,-66.153633 18.36936,-66.154412 18.370275,-66.154612 18.37054,-66.154604 18.370707,-66.15434 18.370919,-66.153779 18.371303,-66.151507 18.37298,-66.14973 18.374256,-66.14659 18.376532,-66.14634 18.376684,-66.146106 18.376792,-66.145742 18.376948,-66.14544 18.377008,-66.144868 18.377043,-66.144072 18.377021,-66.143583 18.377086,-66.142951 18.377171,-66.142306 18.377257,-66.142033 18.377298,-66.141745 18.377379,-66.141563 18.377442,-66.141425 18.37751,-66.141281 18.377618,-66.141071 18.377789,-66.140898 18.378011,-66.140798 18.378167,-66.140704 18.378366,-66.140637 18.378598,-66.140619 18.37877,-66.140603 18.379283,-66.140576 18.380248,-66.140536 18.381821,-66.140527 18.382326,-66.140506 18.382472,-66.140407 18.382553,-66.140255 18.382588,-66.139935 18.382556,-66.139778 18.382507,-66.139635 18.382489,-66.139552 18.382495,-66.139462 18.382529,-66.139413 18.382572,-66.139402 18.382673,-66.139396 18.382781,-66.139401 18.382881,-66.139416 18.382935,-66.139437 18.382976,-66.139531 18.383013,-66.140185 18.383039,-66.140189 18.383039,-66.140748 18.383082,-66.142238 18.383365,-66.142381 18.383406,-66.142441 18.383455,-66.142472 18.383517,-66.142475 18.383615,-66.141979 18.386075,-66.141307 18.389291,-66.141236 18.389682,-66.141228 18.3899,-66.141228 18.390128,-66.141277 18.390495,-66.141375 18.390838,-66.141552 18.391234,-66.143111 18.39391,-66.143472 18.394383,-66.143563 18.394547,-66.143642 18.395458,-66.143641 18.396968,-66.143668 18.397239,-66.1438 18.397556,-66.143936 18.397795,-66.144095 18.397989,-66.144413 18.398279,-66.145914 18.399486,-66.146792 18.400147,-66.147295 18.400365,-66.148233 18.400597,-66.151412 18.401158,-66.152915 18.401386,-66.15437 18.401571,-66.155188 18.401682,-66.155504 18.401678,-66.155745 18.401657,-66.155809 18.401646,-66.155824 18.401589,-66.155827 18.401404,-66.155745 18.400743,-66.155714 18.400636,-66.15562 18.400571,-66.155481 18.400557,-66.155282 18.400586)'), 32161) geom) insert into ref.subroute_new(route, direction, geom) select 'D91','BAYAMON', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;