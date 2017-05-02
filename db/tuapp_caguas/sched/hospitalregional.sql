
-- Terminal de Caguas a Hospital Regional Lunes a Viernes
with trip as ( 
  SELECT 
   'HR' route,
   'TERM_CAGUAS' stop_area, 
   'HOSPITAL' direction,
   'WORKDAY' schedule_type 
), stop_times as ( 
 select '05:00:00' stop_time
 union select '06:00:00'
 union select '07:00:00'
 union select '08:00:00'
 union select '09:00:00'
 union select '10:00:00'
 union select '11:00:00'
 union select '12:00:00'
 union select '13:00:00'
 union select '14:00:00'
 union select '15:00:00'
 union select '16:00:00'
 union select '17:00:00'
 union select '17:10:00'
 union select '18:00:00'
 union select '18:10:00'

) INSERT INTO schedule (route, stop_area, direction, schedule_type, stop_time)
  select trip.route, trip.stop_area, trip.direction, trip.schedule_type, stop_times.stop_time
  from trip, stop_times order by stop_times.stop_time; 


-- Terminal de Caguas a Hospital Regional Fin de Semana
with trip as ( 
  SELECT 
   'HR' route,
   'TERM_CAGUAS' stop_area, 
   'HOSPITAL' direction,
   'RESTDAY' schedule_type 
), stop_times as ( 
 select '07:00:00' stop_time
 union select '08:00:00'
 union select '09:00:00'
 union select '10:00:00'
 union select '11:00:00'
 union select '12:00:00'
 union select '13:00:00'
 union select '14:00:00'
 union select '15:00:00'
 union select '16:00:00'

) INSERT INTO schedule (route, stop_area, direction, schedule_type, stop_time)
  select trip.route, trip.stop_area, trip.direction, trip.schedule_type, stop_times.stop_time
  from trip, stop_times order by stop_times.stop_time; 
