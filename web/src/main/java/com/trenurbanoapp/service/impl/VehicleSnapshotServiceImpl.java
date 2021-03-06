package com.trenurbanoapp.service.impl;

import com.trenurbanoapp.dao.VehicleDao;
import com.trenurbanoapp.dao.VehicleStateDao;
import com.trenurbanoapp.model.VehicleState;
import com.trenurbanoapp.service.VehicleSnapshotService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Map;

/**
 * Created by victor on 3/20/14.
 */
@Service
public class VehicleSnapshotServiceImpl implements VehicleSnapshotService {

    private static final Logger log = LogManager.getLogger(VehicleSnapshotServiceImpl.class);

    @Inject
    private VehicleStateDao vehicleStateDao;

    private Cache miscCache;

    @Inject
    public void setCacheManager(CacheManager cacheManager) {
        miscCache = cacheManager.getCache("miscCache");
    }

    @Override
    public Map<Integer, VehicleState> getVehicleStatesMap() {
        return vehicleStateDao.getAllAsMap();
    }

    @Override
    public void saveVehicleSnapshots(String vehicleSnapshots) {
        miscCache.put(CacheKeys.VEHICLE_SNAPSHOTS, vehicleSnapshots);
    }

}
