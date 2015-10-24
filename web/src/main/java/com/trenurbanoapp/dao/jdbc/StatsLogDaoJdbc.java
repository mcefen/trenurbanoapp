package com.trenurbanoapp.dao.jdbc;

import com.trenurbanoapp.dao.StatsLogDao;
import com.trenurbanoapp.model.LatLngBounds;
import com.trenurbanoapp.model.VehicleState;
import com.trenurbanoapp.scraper.model.LatLng;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.joda.time.DateTime;
import org.postgis.PGgeometry;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.scheduling.annotation.Async;

import javax.sql.DataSource;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: victor
 * Date: 2/19/14
 * Time: 2:21 AM
 */
public class StatsLogDaoJdbc implements StatsLogDao {

    private static final Logger log = LogManager.getLogger(StatsLogDaoJdbc.class);

    private JdbcOperations jdbcTemplate;
    private SimpleJdbcInsert tripLogInsert;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.tripLogInsert = new SimpleJdbcInsert(dataSource)
                .withSchemaName("logs")
                .withTableName("trip_log");
    }

    @Override
    @Async
    public void insertClientLog(double lat, double lng, Float accuracy) {
        jdbcTemplate.update("INSERT INTO logs.client_location_log (stamp, location, accuracy) " +
                        " values (current_timestamp, ST_SetSRID(st_point(?, ?), 4326), ?)",
                lat, lng, accuracy);
    }

    @Override
    public List<String> getLogEntriesAsGeoJson(LatLngBounds bounds) {
        String sql = "select ST_AsGeoJSON(location) geojson " +
                " from logs.client_location_log " +
                " where logs.client_location_log.location && st_makeenvelope(?, ?, ?, ?) " +
                " order by stamp desc limit 5000 ";
        return jdbcTemplate.query(sql, new SingleColumnRowMapper<>(String.class),
                bounds.getSouthwest().getLng(),
                bounds.getSouthwest().getLat(),
                bounds.getNortheast().getLng(),
                bounds.getNortheast().getLat()
        );
    }

    @Override
    public void insertTripLog(VehicleState v, Integer stopId, List<LatLng> trail) {
        Map<String, Object> params = new HashMap<>();
        params.put("trip_id", v.getTripId());
        params.put("subroute_gid", v.getLastKnownSubrouteId());
        params.put("asset_id", v.getAssetId());
        params.put("stop_gid", stopId);
        params.put("stamp", new Timestamp(DateTime.now().getMillis()));
        params.put("trail", safeLineString(trail));
        log.debug("inserting into trip log {}", params);
        tripLogInsert.execute(params);
    }

    @Override
    public long nextTripId() {
        return jdbcTemplate.queryForObject("select nextval('logs.trip_id_seq')", Long.class);
    }

    private PGgeometry safeLineString(List<LatLng> trail) {
        if(trail != null) {
            if(trail.size() > 1) {
                return Mappers.toPGGeometry(trail);
            }
            List<LatLng> newTrail = new ArrayList<>(trail);
            if(newTrail.size() == 1) {
                newTrail.add(newTrail.get(0));
            }
            return Mappers.toPGGeometry(newTrail);
        }
        return null;
    }
}
