delete from ref.subroute where route = 'GU' and direction = 'TERM_CAGUAS';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-65.970704 18.256519,-65.97059 18.25659,-65.970498 18.256559,-65.970493 18.25647,-65.970668 18.256187,-65.970749 18.256056,-65.970754 18.255963,-65.97075 18.255877,-65.970787 18.25586,-65.970912 18.25585,-65.970982 18.255832,-65.971008 18.255767,-65.971204 18.255201,-65.971299 18.25487,-65.971341 18.254763,-65.971399 18.254729,-65.971798 18.2548,-65.972141 18.254773,-65.972773 18.254687,-65.973794 18.25447,-65.975095 18.254119,-65.976209 18.253793,-65.977379 18.253492,-65.977618 18.253398,-65.977838 18.253216,-65.977907 18.253056,-65.978093 18.252249,-65.978206 18.25208,-65.978405 18.251949,-65.980077 18.251118,-65.981451 18.25045,-65.98287 18.249778,-65.983681 18.249386,-65.984475 18.248987,-65.985108 18.248771,-65.98566 18.248708,-65.986478 18.248776,-65.986817 18.248773,-65.987411 18.248695,-65.988224 18.248573,-65.988913 18.248508,-65.989893 18.248452,-65.99064 18.248452,-65.991898 18.248526,-65.992626 18.248554,-65.992974 18.248545,-65.994461 18.248497,-65.995003 18.248426,-65.996334 18.248076,-65.997329 18.247801,-65.998191 18.247504,-65.999298 18.247104,-66.000059 18.246839,-66.001818 18.24621,-66.00229 18.246044,-66.002475 18.246004,-66.002653 18.245999,-66.002785 18.246014,-66.003035 18.246075,-66.005085 18.246732,-66.00601 18.247009,-66.006308 18.247086,-66.006578 18.247074,-66.00687 18.24695,-66.007116 18.246726,-66.007294 18.246311,-66.007548 18.245569,-66.007786 18.244921,-66.008131 18.243976,-66.008243 18.243623,-66.008774 18.241906,-66.00892 18.24157,-66.009127 18.241322,-66.009547 18.241036,-66.01092 18.240232,-66.011591 18.239824,-66.012085 18.239523,-66.01247 18.239394,-66.012684 18.239366,-66.01291 18.239374,-66.013447 18.239421,-66.014083 18.23956,-66.016285 18.240356,-66.01658 18.240379,-66.016898 18.240297,-66.017276 18.240134,-66.018067 18.239787,-66.018773 18.239517,-66.019545 18.239185,-66.019807 18.239076,-66.022462 18.238003,-66.023521 18.237552,-66.024414 18.237186,-66.024744 18.237072,-66.025046 18.236987,-66.025673 18.236889,-66.026788 18.236763,-66.027364 18.236738,-66.028113 18.236743,-66.02853 18.236773,-66.02911 18.236849,-66.029706 18.236974,-66.029939 18.236877,-66.03024 18.236193,-66.030653 18.235228,-66.030843 18.235171,-66.031714 18.235402,-66.031888 18.235459,-66.032628 18.235717,-66.032824 18.235764,-66.032905 18.23574,-66.032932 18.235663,-66.032947 18.235583,-66.033141 18.23511,-66.033128 18.235051,-66.033064 18.235016,-66.032478 18.234842,-66.032318 18.23504)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'GU','TERM_CAGUAS', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'GU' and direction = 'GURABO';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.032303 18.235076,-66.031874 18.235088,-66.031751 18.235295,-66.030787 18.235069,-66.030612 18.235083,-66.030465 18.235204,-66.029891 18.236577,-66.029838 18.236683,-66.029651 18.23681,-66.029457 18.236817,-66.029231 18.236781,-66.02848 18.236654,-66.028135 18.236628,-66.027338 18.236587,-66.026763 18.236598,-66.025652 18.23676,-66.025011 18.236838,-66.024671 18.236939,-66.024308 18.237071,-66.023446 18.237411,-66.022363 18.237861,-66.019594 18.239036,-66.018053 18.23973,-66.01727 18.240057,-66.016804 18.240264,-66.016432 18.240298,-66.016257 18.240257,-66.014108 18.239501,-66.013453 18.239379,-66.012874 18.239307,-66.012657 18.239302,-66.012466 18.239325,-66.012195 18.239417,-66.011551 18.239752,-66.010881 18.240166,-66.00954 18.240976,-66.00924 18.24114,-66.009066 18.241275,-66.008799 18.241576,-66.008547 18.242262,-66.008397 18.242745,-66.007938 18.244124,-66.007656 18.24488,-66.007435 18.245542,-66.007174 18.24631,-66.007026 18.24664,-66.006816 18.246844,-66.006549 18.246945,-66.006323 18.246955,-66.006049 18.246884,-66.005128 18.246608,-66.003039 18.245923,-66.0028 18.245884,-66.002549 18.245872,-66.001784 18.246113,-66.000022 18.246788,-65.999278 18.247071,-65.998184 18.247447,-65.997315 18.24777,-65.996299 18.24805,-65.994977 18.24839,-65.994462 18.248458,-65.992952 18.248511,-65.99259 18.248513,-65.9919 18.248496,-65.99064 18.248422,-65.989889 18.248418,-65.988905 18.248464,-65.988236 18.248532,-65.987399 18.248662,-65.986812 18.248739,-65.986557 18.248744,-65.985672 18.248669,-65.985096 18.248735,-65.984473 18.248944,-65.983652 18.249352,-65.982871 18.249718,-65.981597 18.250328,-65.979865 18.251174,-65.978984 18.251599,-65.978502 18.251845,-65.97816 18.252039,-65.978032 18.252213,-65.977786 18.253143,-65.977559 18.253345,-65.977364 18.253415,-65.975084 18.254073,-65.973782 18.254439,-65.972774 18.254663,-65.972136 18.25475,-65.971954 18.254767,-65.97179 18.254775,-65.971564 18.25473,-65.971398 18.254694,-65.971318 18.254728,-65.971289 18.254796,-65.971185 18.25518,-65.971052 18.255518,-65.970959 18.255813,-65.970876 18.255815,-65.970805 18.25581,-65.970766 18.255833,-65.970728 18.255935,-65.970729 18.256007,-65.970813 18.256109,-65.970866 18.256222,-65.970815 18.256348)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'GU','GURABO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute_stop where route = 'GU' and direction = 'GURABO'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8000, 0, 'GU', 'GURABO'),(8014, 1, 'GU', 'GURABO');
delete from ref.subroute_stop where route = 'GU' and direction = 'TERM_CAGUAS'; insert into ref.subroute_stop (stop, stop_order, route, direction) values (8014, 0, 'GU', 'TERM_CAGUAS'),(8000, 1, 'GU', 'TERM_CAGUAS');
