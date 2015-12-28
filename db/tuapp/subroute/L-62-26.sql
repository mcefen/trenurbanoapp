delete from ref.subroute where route = 'L-62-26' and direction = 'SAN_JUAN';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.047203 18.397307,-66.047114 18.397541,-66.04701 18.39765,-66.046394 18.397648,-66.046137 18.397645,-66.046027 18.397692,-66.046009 18.398341,-66.045986 18.398401,-66.045888 18.398404,-66.044973 18.398384,-66.043696 18.398368,-66.043571 18.398402,-66.043431 18.398489,-66.043405 18.398738,-66.043392 18.39928,-66.043384 18.399534,-66.043381 18.399769,-66.04335 18.402044,-66.043752 18.406363,-66.043859 18.409347,-66.043834 18.409692,-66.04376 18.409966,-66.043577 18.410736,-66.043029 18.412745,-66.042882 18.413415,-66.042832 18.41392,-66.042821 18.414587,-66.042901 18.415248,-66.04402 18.421591,-66.044184 18.422282,-66.044338 18.422598,-66.045906 18.424549,-66.047687 18.425655,-66.047994 18.425996,-66.048638 18.426825,-66.048731 18.42704,-66.048723 18.427219,-66.048667 18.427365,-66.048229 18.427855,-66.047751 18.428596,-66.047363 18.429183,-66.046651 18.430285,-66.046479 18.430493,-66.046253 18.430686,-66.045762 18.43095,-66.045479 18.431032,-66.045163 18.431035,-66.044764 18.431165,-66.044291 18.431432,-66.044117 18.431629,-66.044038 18.43182,-66.044038 18.432039,-66.045016 18.434893,-66.050004 18.435673,-66.050406 18.435827,-66.053921 18.437487,-66.057814 18.437995,-66.057944 18.437991,-66.058838 18.43792,-66.059351 18.437871,-66.059438 18.437827,-66.059475 18.43772,-66.059425 18.437447,-66.059404 18.437267,-66.05935 18.436208,-66.059307 18.435636,-66.059297 18.435379,-66.059354 18.435324,-66.059574 18.435331,-66.059908 18.435352,-66.060307 18.43541,-66.060466 18.435459,-66.060509 18.435528,-66.060394 18.43582,-66.060273 18.436356,-66.060188 18.436765,-66.060188 18.437109,-66.060209 18.437284,-66.060188 18.437334,-66.059577 18.437771,-66.059481 18.437962,-66.059572 18.438152,-66.059861 18.438577,-66.062578 18.441622,-66.064453 18.443182,-66.06768 18.445708,-66.070239 18.447577,-66.074424 18.450817,-66.075422 18.451499,-66.076972 18.452473,-66.07829 18.453151,-66.078859 18.453499,-66.079864 18.454179,-66.080459 18.454549,-66.081188 18.454926,-66.08253 18.455525,-66.08337 18.455914,-66.084649 18.456504,-66.085354 18.456831,-66.085702 18.457103,-66.085952 18.45743,-66.086041 18.457714,-66.086202 18.458361,-66.086333 18.459145,-66.086444 18.460026,-66.086673 18.460643,-66.08686 18.460978,-66.087215 18.461202,-66.0876 18.461325,-66.088014 18.461431,-66.088716 18.461686,-66.089093 18.461786,-66.089391 18.461819,-66.090064 18.461938,-66.090993 18.462135,-66.092368 18.462429,-66.094019 18.462789,-66.094619 18.46291,-66.094969 18.462949,-66.097071 18.462967,-66.098576 18.462979,-66.098855 18.462988,-66.099809 18.46316,-66.101194 18.463419,-66.101597 18.463495,-66.101701 18.463534,-66.103334 18.464423,-66.103523 18.464519,-66.104966 18.46492,-66.105825 18.465154,-66.106328 18.465216,-66.107124 18.46529,-66.10764 18.465227,-66.107745 18.465175,-66.107827 18.463953,-66.107848 18.463905,-66.107921 18.4639,-66.110361 18.464042,-66.110464 18.464086,-66.110487 18.464136,-66.110487 18.464253,-66.11044 18.464306,-66.110374 18.464393,-66.110341 18.46457,-66.110359 18.464705,-66.110412 18.464929)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'L-62-26','SAN_JUAN', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
delete from ref.subroute where route = 'L-62-26' and direction = 'CAPETILLO';with line_tmp as (select ST_Transform(ST_GeomFromEWKT('SRID=4326;LINESTRING(-66.110422 18.464961,-66.110478 18.465011,-66.110946 18.46494,-66.111118 18.464915,-66.111217 18.464862,-66.111202 18.46477,-66.111081 18.46433,-66.110996 18.46408,-66.110903 18.463996,-66.110551 18.463971,-66.109874 18.463954,-66.108139 18.463881,-66.107133 18.463829,-66.106989 18.463844,-66.106888 18.463899,-66.10623 18.464943,-66.106026 18.46506,-66.105826 18.465068,-66.104653 18.464759,-66.1036 18.464472,-66.103382 18.464378,-66.102742 18.464007,-66.101751 18.463484,-66.101542 18.46343,-66.10067 18.463264,-66.099067 18.462959,-66.098828 18.46293,-66.097805 18.462916,-66.095253 18.462893,-66.094976 18.462889,-66.094658 18.462854,-66.094095 18.46273,-66.092451 18.462366,-66.090935 18.462052,-66.089558 18.461765,-66.08902 18.461605,-66.088221 18.461324,-66.087909 18.461098,-66.087602 18.460661,-66.087423 18.460064,-66.087187 18.459344,-66.087049 18.458641,-66.087135 18.457644,-66.087255 18.457509,-66.087494 18.457399,-66.087831 18.457215,-66.088459 18.456562,-66.088508 18.456392,-66.088324 18.456112,-66.088104 18.455959,-66.087816 18.455782,-66.087655 18.455555,-66.087603 18.455285,-66.087579 18.454875,-66.087531 18.454406,-66.087397 18.454056,-66.087169 18.453869,-66.08631 18.453481,-66.084746 18.452782,-66.083812 18.452372,-66.083533 18.452248,-66.082472 18.451969,-66.081619 18.451761,-66.081045 18.451608,-66.080231 18.451242,-66.077683 18.450001,-66.077117 18.449657,-66.075422 18.448562,-66.073723 18.447435,-66.07177 18.445931,-66.069853 18.444409,-66.069392 18.444147,-66.067167 18.443121,-66.065098 18.44226,-66.064374 18.441879,-66.063187 18.440907,-66.062474 18.44014,-66.060628 18.437898,-66.060357 18.437505,-66.060279 18.437297,-66.060258 18.436803,-66.060388 18.436146,-66.06039 18.436066,-66.060321 18.436005,-66.059432 18.436002,-66.059309 18.436057,-66.059254 18.436175,-66.059313 18.436989,-66.059397 18.437742,-66.059347 18.437838,-66.058824 18.437892,-66.05792 18.43795,-66.057838 18.437951,-66.053962 18.437444,-66.050447 18.435784,-66.050045 18.43563,-66.045057 18.43485,-66.044079 18.431996,-66.044079 18.431777,-66.044158 18.431586,-66.044317 18.431466,-66.044777 18.43123,-66.045063 18.431147,-66.045189 18.43114,-66.045522 18.431103,-66.045816 18.431023,-66.046273 18.430786,-66.046566 18.430538,-66.046759 18.430273,-66.047451 18.429215,-66.047794 18.428697,-66.048218 18.42804,-66.048421 18.427742,-66.048774 18.427336,-66.048816 18.427154,-66.048807 18.426981,-66.048694 18.426761,-66.047923 18.425778,-66.047728 18.425612,-66.045947 18.424506,-66.044366 18.422495,-66.044274 18.422192,-66.043144 18.41582,-66.043024 18.415044,-66.042979 18.414519,-66.042992 18.414067,-66.043109 18.413252,-66.04374 18.410719,-66.043954 18.409908,-66.044002 18.409714,-66.04405 18.409338,-66.043983 18.406926,-66.043528 18.401976,-66.043537 18.400201,-66.043563 18.399455,-66.043571 18.398547,-66.043608 18.398454,-66.043724 18.398415,-66.043941 18.398418,-66.044905 18.398422,-66.045956 18.398444,-66.046328 18.398459,-66.047471 18.398449,-66.047548 18.398417,-66.047555 18.397757,-66.047564 18.397598,-66.047574 18.397319,-66.047583 18.397172,-66.047646 18.39698,-66.047581 18.396916,-66.0473 18.396916,-66.046982 18.396911,-66.046876 18.396911,-66.046863 18.397071,-66.047017 18.397283)'), 32161) geom) insert into ref.subroute(route, direction, geom) select 'L-62-26','CAPETILLO', ST_AddMeasure(line_tmp.geom, 0, ST_Length(line_tmp.geom)) from line_tmp;
