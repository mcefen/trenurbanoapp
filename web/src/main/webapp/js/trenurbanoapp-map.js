/*requires jQuery, LeafletJS, Leaflet.TextPath */
var TU = TU || {};
TU.MAP = (function(my, $, Leaf) {
    "use strict";

    //Constants

    my.DEFAULTS = {
        CENTER: [18.430189, -66.060061],
        ZOOM: 13,
        BOUNDS: [[18.352687, -66.179752],[18.477284, -65.928097]]
    };

    //private fields
    var VehicleIcon = Leaf.Icon.extend({
        options: {
            iconSize: [21, 33],
            iconAnchor: [11, 33],
            popupAnchor: [1, -27],
            shadowSize: [41, 41],
            shadowAnchor: [12, 41]
        }
    });

    var VehicleSvgIcon = Leaf.DivIcon.extend({
        options: {
            iconSize: [21, 33],
            iconAnchor: [11, 33],
            popupAnchor: [1, -27],
            shadowSize: [41, 41],
            shadowAnchor: [12, 41]
        }
    });

    var StopMarker = Leaf.CircleMarker.extend({
        options: {
            radius: +4,
            fillColor: "#eeeeee",
            color: "#333333",
            fillOpacity: 1,
            clickable: true
        }
    });

    var SNAPSHOTS_AGE_MAX = 120000;
    var SESSION_TIMEOUT_IN_SECONDS = 300;
    var vehicleLayers = {};
    var routeMarkerIcons = {};
    var colors = {};
    var routeLayers = {};
    var decorationLayers = {};
    var activeRoutes = [];
    var stopMarkers = {};
    var ageInMillis = 0;
    var layerControl = Leaf.control.layers(null, {});
    var stopsLayer = Leaf.featureGroup();
    var decorationLayerGroup = Leaf.featureGroup();
    var routeLayerGroup = Leaf.featureGroup();
    var contextPath = '';
    var map = null;
    var sessionIdleTimeInSeconds = 0;
    var snapshotIntervalId;
    var gpsEnabled = false;
    var debug = false;
    var mapCenter = my.DEFAULTS.CENTER;
    var route = TU.UTIL.getParam('route');
    var locationMarker = Leaf.marker(my.DEFAULTS.CENTER, {
        icon: markerIcon('/images/dude')
    });
    var originMarker = Leaf.marker(my.DEFAULTS.CENTER, {
        icon: markerIcon('/images/A')
    });
    var destMarker = Leaf.marker(my.DEFAULTS.CENTER, {
        icon: markerIcon('/images/B')
    });

    var contextMenuLatLng;

    my.getContextMenuLatLng = function() {
        return contextMenuLatLng;
    };

    my.getLocationMarker = function() {
        return locationMarker;
    };

    my.getMap = function() {
        return map;
    };

    my.zoomToVehicle = function(assetId) {
        var latLngs = [];
        var map = TU.MAP.getMap();
        if(map.hasLayer(locationMarker)) {
            latLngs.push(locationMarker.getLatLng());
        }

        var vehicleMarker;
        if(vehicleLayers[assetId] && vehicleLayers[assetId].marker) {
            vehicleMarker = vehicleLayers[assetId].marker;
            latLngs.push(vehicleMarker.getLatLng());
        }

        if(latLngs.length === 1) {
            map.panTo(latLngs[0]);
            return;
        }

        map.fitBounds(Leaf.latLngBounds(latLngs));
        if(vehicleMarker) {
            vehicleMarker.openPopup();
        }
    };

    my.main = function(mapObj, options) {

        if(typeof mapObj === 'undefined') {
            throw 'Map is undefined';
        }
        map = mapObj;
        layerControl.addTo(map);
        decorationLayerGroup.addTo(map);
        routeLayerGroup.addTo(map);
        stopsLayer.addTo(map);

        contextPath = typeof options.contextPath !== 'undefined' && options.contextPath || contextPath;
        gpsEnabled = typeof options.gpsEnabled !== 'undefined' && options.gpsEnabled || gpsEnabled;
        debug = typeof options.debug !== 'undefined' && options.debug || debug;
        mapCenter = typeof options.mapCenter !== 'undefined' && options.mapCenter || mapCenter;


        if(gpsEnabled) {
            getVehicleSnapshots(map, contextPath);
            var intervalFunction = function () {
                if (sessionIdleTimeInSeconds >= SESSION_TIMEOUT_IN_SECONDS) {
                    clearInterval(snapshotIntervalId);
                    $('#timeoutModal').modal({show: true});
                }
                getVehicleSnapshots(map, contextPath);
                sessionIdleTimeInSeconds += 5;
            };
            $('#timeoutModal').on('hide.bs.modal', function () {
                sessionIdleTimeInSeconds = 0;
                getVehicleSnapshots(map, contextPath);
                snapshotIntervalId = setInterval(intervalFunction, 5000);
            });
            snapshotIntervalId = setInterval(intervalFunction, 5000);
        }

        getRouteDecorations();
        getAllRoutes();

        //load stops
        map.on('overlayadd', onOverlayAdd);
        map.on('overlayremove', onOverlayRemove);

        map.on('locationfound', function (e) {
            var radius = e.accuracy / 2;
            if (radius < 500) {
                locationMarker.setLatLng(e.latlng)
                    .bindPopup("Usted est&aacute; aqu&iacute;")
                    .addTo(map);
                Leaf.circle(e.latlng, radius, {
                    fill: false,
                    opacity: 0.5
                }).addTo(map);

                if(!gpsEnabled && !route) {
                    getNearbyRouteNames(e.latlng);
                }
            }
        });

        map.on('locationerror', function () {
            safeLog("location error");
            if(route) {
                return;
            }
            console.debug(JSON.stringify(mapCenter));
            map.setView(mapCenter, my.DEFAULTS.ZOOM);
        });

        map.on('zoomend', function() {
            sessionIdleTimeInSeconds = 0;
            if(map.getZoom() < 14) {
                map.removeLayer(decorationLayerGroup);
                map.removeLayer(stopsLayer);
            } else {
                if (!map.hasLayer(decorationLayerGroup)) {
                    map.addLayer(decorationLayerGroup);
                    decorationLayerGroup.bringToBack();
                }

                if (!map.hasLayer(stopsLayer)) {
                    map.addLayer(stopsLayer);
                }
            }
        });

        map.on('dragend', function() {
            sessionIdleTimeInSeconds = 0;
        });

        map.on('contextmenu', function(e) {
            var $contextMenu = $('#contextMenu');
            $contextMenu.find("#latlng").text(e.latlng.lat.toPrecision(6) + ',' + e.latlng.lng.toPrecision(6));
            $contextMenu.css({
                display: "block",
                left: e.originalEvent.pageX,
                top: e.originalEvent.pageY
            });
            contextMenuLatLng = e.latlng;
        });

        map.on('click', function() {
            $('#contextMenu').hide();
        });

        var screenHeight = document.documentElement.clientHeight;
        $('.leaflet-control-layers-overlays').css('max-height', '' + (screenHeight - 110) + 'px');

        var div = document.querySelector('.leaflet-control-layers');
        if (!Leaf.Browser.touch) {
            Leaf.DomEvent.disableClickPropagation(div);
            Leaf.DomEvent.on(div, 'mousewheel', Leaf.DomEvent.stopPropagation);
        } else {
            Leaf.DomEvent.on(div, 'click', Leaf.DomEvent.stopPropagation);
            Leaf.DomEvent.on(div, 'touchstart', Leaf.DomEvent.stopPropagation);
        }

    };

    my.copyLatLngToClipboard = function() {

        var textArea = document.createElement("textarea");

        //
        // *** This styling is an extra step which is likely not required. ***
        //
        // Why is it here? To ensure:
        // 1. the element is able to have focus and selection.
        // 2. if element was to flash render it has minimal visual impact.
        // 3. less flakyness with selection and copying which **might** occur if
        //    the textarea element is not visible.
        //
        // The likelihood is the element won't even render, not even a flash,
        // so some of these are just precautions. However in IE the element
        // is visible whilst the popup box asking the user for permission for
        // the web page to copy to the clipboard.
        //

        // Place in top-left corner of screen regardless of scroll position.
        textArea.style.position = 'fixed';
        textArea.style.top = 0;
        textArea.style.left = 0;

        // Ensure it has a small width and height. Setting to 1px / 1em
        // doesn't work as this gives a negative w/h on some browsers.
        textArea.style.width = '2em';
        textArea.style.height = '2em';

        // We don't need padding, reducing the size if it does flash render.
        textArea.style.padding = 0;

        // Clean up any borders.
        textArea.style.border = 'none';
        textArea.style.outline = 'none';
        textArea.style.boxShadow = 'none';

        // Avoid flash of white box if rendered for any reason.
        textArea.style.background = 'transparent';


        textArea.value = contextMenuLatLng.lat.toPrecision(8) + ',' + contextMenuLatLng.lng.toPrecision(8);
        document.body.appendChild(textArea);

        textArea.select();

        try {
            var successful = document.execCommand('copy');
            var msg = successful ? 'successful' : 'unsuccessful';
            console.log('Copying text command was ' + msg);
        } catch (err) {
            console.log('Oops, unable to copy');
        }
    };

    my.setOrigin = function() {
        if(!contextMenuLatLng) {
            return;
        }
        originMarker.setLatLng(contextMenuLatLng);
        if(!map.hasLayer(originMarker)) {
            originMarker.addTo(map);
        }
        if(map.hasLayer(destMarker)) {
            getOriginDestinationRouteNames(contextMenuLatLng, destMarker.getLatLng());
        } else {
            getNearbyRouteNames(contextMenuLatLng);
        }
        $('#contextMenu').hide();
    };

    my.setDestination = function() {
        if(!contextMenuLatLng) {
            return;
        }
        destMarker.setLatLng(contextMenuLatLng);
        if(!map.hasLayer(destMarker)) {
            destMarker.addTo(map);
        }
        if(map.hasLayer(originMarker)) {
            getOriginDestinationRouteNames(originMarker.getLatLng(), contextMenuLatLng);
        } else if (map.hasLayer(locationMarker)) {
            getOriginDestinationRouteNames(locationMarker.getLatLng(), contextMenuLatLng);
        }
        $('#contextMenu').hide();
    };

    my.clearOriginDestination = function() {
        if(map.hasLayer(originMarker)) {
            map.removeLayer(originMarker);
        }

        if(map.hasLayer(destMarker)) {
            map.removeLayer(destMarker);
        }
        $('#contextMenu').hide();
    };

    my.clearRoutes = function() {
        updateRoutes('');
        $('#contextMenu').hide();
    };

    function onOverlayAdd(event) {
        var routeName = $(event.name).data('routeId');
        addActiveRoute(routeName);
    }

    function addActiveRoute(routeId) {
        activeRoutes.push(routeId);
        updateDecorations();
        updateStops();
    }

    function onOverlayRemove(event) {
        var routeId = $(event.name).data('routeId');
        removeActiveRoute(routeId);

    }

    function removeActiveRoute(routeId) {
        var index = activeRoutes.indexOf(routeId);
        if (index > -1) {
            activeRoutes.splice(index, 1);
        }
        updateDecorations();
        updateStops();
    }

    function markerIcon(path) {
        return new VehicleIcon({
            iconUrl: contextPath + path + ".png",
            iconRetinaUrl: contextPath + path + "@2x.png",
            shadowUrl: contextPath + "/images/marker-shadow.png"
        });
    }

    function getPaddedBounds() {
        return map.getBounds().pad((map.getZoom() - 10) * 5 / 100);
    }

    function safeLog(message) {
        if (typeof console !== "undefined" && typeof console.log !== "undefined") {
            console.log(message);
        }
    }

    function getAllRoutes() {
        $.ajax(contextPath + '/app/routes', {
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            success: function (geojsonRoutes) {
                for (var i = 0; i < geojsonRoutes.features.length; i++) {
                    var data = geojsonRoutes.features[i];
                    colors[data.id] = data.properties.color;
                    var geoJsonLayer = Leaf.geoJson(data, {
                        style: routeStyle,
                        onEachFeature: routeBindPopup
                    });
                    routeLayers[data.id] = geoJsonLayer;
                    var darkColor = TU.UTIL.shadeColor(data.properties.color, -25);
                    var routeLabel = '<span class="routeLabel" data-route-id="'+ data.id + '" style="' +
                        'background-color: ' + data.properties.color +
                        '; text-shadow: -1px 0 ' + darkColor + ', 0 1px ' + darkColor + ', 1px 0 ' + darkColor + ', 0 -1px ' + darkColor +
                        '; border-color: ' + darkColor + '">' + data.properties.code + ' ' + data.properties.fullName + '</span>';
                    routeMarkerIcons[data.id] = markerIcon('/app/icon/' + data.id);
                    /*routeMarkerIcons[data.id] = getSvgIcon({
                        route: data.id,
                        darkColor: darkColor,
                        lightColor: data.properties.color
                    });*/
                    
                    layerControl.addOverlay(geoJsonLayer, routeLabel);
                    if(route === data.id) {
                        activeRoutes.push(route);
                        routeLayerGroup.addLayer(geoJsonLayer);
                        map.fitBounds(geoJsonLayer.getBounds());
                    }
                }
                routeMarkerIcons.unknown = markerIcon('/images/unknown');
                map.locate({setView: (!route || false), maxZoom: 14, enableHighAccuracy: true});
            }
        });
    }

    function getRouteDecorations() {
        $.ajax(contextPath + '/app/routeDecorations', {
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            success: function (geojsonDecorations) {
                var styleFunc = function() {
                    return {
                        stroke: false,
                        clickable: false
                    };
                };
                for (var i = 0; i < geojsonDecorations.features.length; i++) {
                    var data = geojsonDecorations.features[i];
                    var geoJsonLayer = Leaf.geoJson(data, {
                        style: styleFunc
                        //onEachFeature: routeBindPopup
                    });
                    geoJsonLayer.setText('      \u27a4',  {
                        repeat: true,
                        offset: '0',
                        attributes: {
                            fill: TU.UTIL.shadeColor(data.properties.color, -10),
                            dy: '4px',
                        }
                    });
                    decorationLayers[data.id] = geoJsonLayer;
                }
            }
        });
    }

    function routeStyle(feature) {
        return {
            weight: 6,
            opacity: 0.5,
            color: feature.properties.color
        };
    }

    function routeBindPopup(feature, layer) {
        var popupHtml = 'Ruta ' + feature.properties.code +
            ' ' + feature.properties.fullName;
        layer.bindPopup(popupHtml);
        layer.on("click", function() {
            layer.bringToFront();
            if(map.hasLayer(stopsLayer)) {
                stopsLayer.bringToFront();
            }
        });
    }

    function getVehicleSnapshots() {
        $.ajax(contextPath + '/app/mapper', {
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            timeout: 5000,
            success: function (vehicleSnapshots) {
                var currentTimestamp = new Date().getTime();
                ageInMillis = currentTimestamp - vehicleSnapshots.timeStamp;
                map.attributionControl.setPrefix(getAttributionPrefixText(ageInMillis));
                if (ageInMillis > SNAPSHOTS_AGE_MAX) {
                    removeVehicleLayers(map, vehicleLayers);
                    return;
                }
                for (var i = 0; i < vehicleSnapshots.d.length; i++) {
                    var vehicleSnapshot = vehicleSnapshots.d[i];
                    if(vehicleSnapshot.assetId == 1029) {
                        console.log('');
                    }
                    if (vehicleSnapshot.trail.length < 1) {
                        continue;
                    }

                    var markerLatLng = new Leaf.LatLng(vehicleSnapshot.trail[0].lat, vehicleSnapshot.trail[0].lng);
                    var vehicleLayer = vehicleLayers[vehicleSnapshot.assetId];
                    var vehicleWithinBounds = getPaddedBounds(map).contains(markerLatLng);
                    if(!vehicleLayer && (!vehicleWithinBounds || !isVehicleValidForDisplay(vehicleSnapshot))) {
                        continue;
                    }

                    // estela del vehiculo
                    var trailLatLngs = new Array(vehicleSnapshot.trail.length);
                    for (var j = 0; j < vehicleSnapshot.trail.length; j++) {
                        var trailNode = vehicleSnapshot.trail[j];
                        trailLatLngs[j] = new Leaf.LatLng(trailNode.lat, trailNode.lng);
                    }

                    // informacion del vehiculo a desplegarse
                    var popupContent = createPopupContent(vehicleSnapshot, currentTimestamp);

                    if (vehicleLayer) {

                        // actualizar layer existente para el vehiculo
                        var trailHasChanged = false;
                        if(trailLatLngs.length !== vehicleLayer.trail.length) {
                            trailHasChanged = true;
                        } else {
                            for (var k = 0; k < trailLatLngs.length; k++) {
                                if(!trailLatLngs[k].equals(vehicleLayer.trail[k])) {
                                    trailHasChanged = true;
                                    break;
                                }
                            }
                        }

                        if(trailHasChanged && vehicleWithinBounds) {
                            vehicleLayer.marker.setLatLng(markerLatLng);
                            vehicleLayer.trail.setLatLngs(trailLatLngs);
                        }

                        var newRoute = vehicleSnapshot.inRoute ? vehicleSnapshot.route : null;
                        if (newRoute !== vehicleLayer.route) {
                            vehicleLayer.route = newRoute;
                            updateVehicleRoutePopup(map, vehicleLayer);
                        }

                        if (isVehicleValidForDisplay(vehicleSnapshot, currentTimestamp)) {
                            if (!map.hasLayer(vehicleLayer.marker)) {
                                map.addLayer(vehicleLayer.marker);
                            }

                            if (!map.hasLayer(vehicleLayer.trail)) {
                                map.addLayer(vehicleLayer.trail);
                            }
                        } else {
                            map.removeLayer(vehicleLayer.marker);
                            map.removeLayer(vehicleLayer.trail);
                        }

                    } else {
                        // crear nuevo layer para este vehiculo
                        vehicleLayer = {};
                        vehicleLayer.marker = Leaf.marker(markerLatLng);
                        vehicleLayer.trail = Leaf.polyline(trailLatLngs, { color: 'black', weight: 4, opacity: 0.7 });
                        vehicleLayer.route = vehicleSnapshot.inRoute ? vehicleSnapshot.route : null; //keep the latest route in mem
                        updateVehicleRoutePopup(map, vehicleLayer);

                        if (isVehicleValidForDisplay(vehicleSnapshot)) {
                            // vehiculo esta en servicio, desplegar en el mapa
                            vehicleLayer.marker.addTo(map);
                            vehicleLayer.trail.addTo(map);
                        }

                        vehicleLayers[vehicleSnapshot.assetId] = vehicleLayer;
                    }

                    vehicleLayer.marker.bindPopup(popupContent);
                    var routeMarkerKey = (vehicleSnapshot.inRoute || (vehicleSnapshot.props && vehicleSnapshot.props.withinOrigin === 'true')) ? vehicleSnapshot.route : "unknown";
                    if (routeMarkerKey && routeMarkerIcons[routeMarkerKey]) {
                        //se conoce la ruta, colocar icono
                        vehicleLayer.marker.setIcon(routeMarkerIcons[routeMarkerKey]);
                    }
                }
            },
            error: function (jqXHR, textStatus) {
                safeLog(textStatus);
                ageInMillis += 5000;
                map.attributionControl.setPrefix(getAttributionPrefixText(ageInMillis));
                if(ageInMillis > SNAPSHOTS_AGE_MAX) {
                    removeVehicleLayers(map, vehicleLayers);
                }
            }
        });
    }

    function getNearbyRouteNames(latLng) {
        $.ajax(contextPath + '/app/nearbyRouteNames', {
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            method: 'POST',
            data: JSON.stringify(latLng),
            success: function (nearbyRouteNames) {
                updateRoutes(nearbyRouteNames);
            }
        });
    }

    function getOriginDestinationRouteNames(originLatLng, destLatLng) {
        $.ajax(contextPath + '/app/originDestinationRouteNames', {
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            method: 'POST',
            data: JSON.stringify([originLatLng, destLatLng]),
            success: function (nearbyRouteNames) {
                updateRoutes(nearbyRouteNames);
            }
        });
    }

    function updateRoutes(nearbyRouteNames) {
        map.off('overlayremove');
        var i, routeLayer;
        var removeFromActive = [];
        for (i = 0; i < activeRoutes.length; i++) {
            var activeRoute = activeRoutes[i];
            if(nearbyRouteNames.indexOf(activeRoute) === -1) {
                removeFromActive.push(activeRoute);
                routeLayer = routeLayers[activeRoute];
                if(routeLayer) {
                    routeLayerGroup.removeLayer(routeLayer);
                }
            }
        }
        for (i = 0; i < removeFromActive.length; i++) {
            activeRoutes.splice(activeRoutes.indexOf(removeFromActive[i], 1));
        }
        map.on('overlayremove', onOverlayRemove);

        map.off('overlayadd');
        for (i = 0; i < nearbyRouteNames.length; i++) {
            var nearbyRouteName = nearbyRouteNames[i];
            if(activeRoutes.indexOf(nearbyRouteName) === -1) {
                activeRoutes.push(nearbyRouteName);
                routeLayer = routeLayers[nearbyRouteName];
                if (routeLayer) {
                    routeLayer.addTo(routeLayerGroup);
                }
            }
        }
        //load stops
        updateDecorations();
        updateStops();
        map.on('overlayadd', onOverlayAdd);
    }

    function updateDecorations() {
        decorationLayerGroup.clearLayers();
        if(activeRoutes.length === 0) {
            return;
        }

        for (var i = 0; i < activeRoutes.length; i++) {
            var activeRouteId = activeRoutes[i];
            if(decorationLayers[activeRouteId]) {
                decorationLayerGroup.addLayer(decorationLayers[activeRouteId]);
            }
        }
    }

    function updateStops() {
        if(activeRoutes.length === 0) {
            stopsLayer.clearLayers();
            return;
        }
        var bounds = getPaddedBounds();
        $.ajax(contextPath + '/app/stopsByRouteNames', {
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            method: 'POST',
            data: JSON.stringify({
                routeNames: activeRoutes,
                bounds: {
                    southwest: bounds.getSouthWest(),
                    northeast: bounds.getNorthEast()
                }
            }),
            success: function (stopsGeoJson) {
                stopsLayer.clearLayers();
                for (var i = 0; i < stopsGeoJson.features.length; i++) {
                    var feature = stopsGeoJson.features[i];
                    var routesByStop = feature.properties.routes;

                    var markerColors = {
                        fillColor: '#eeeeee',
                        color: '#333333'
                    };
                    if(routesByStop.length === 1) {
                        markerColors.fillColor = colors[routesByStop];
                        markerColors.color = TU.UTIL.shadeColor(colors[routesByStop], -35);
                    }

                    var circleMarker;
                    if (stopMarkers[feature.id]) {
                        circleMarker = stopMarkers[feature.id];
                        circleMarker.setStyle(markerColors);
                    } else {
                        var coords = feature.geometry.coordinates;
                        circleMarker = new StopMarker([coords[1], coords[0]], markerColors);
                        var popupText = 'Parada ' + (feature.properties.amaId && TU.UTIL.leftPadUpToFour(feature.properties.amaId, 4) || '') +
                            '<br/>Rutas: ' + (feature.properties.allRoutes || []).join(',');
                        if (debug) {
                            popupText += '<br/>ID: ' + feature.id + '<br/>';
                        }
                        circleMarker.bindPopup(popupText);
                        stopMarkers[feature.id] = circleMarker;
                    }
                    stopsLayer.addLayer(circleMarker);
                }
            }
        });
    }

    function getAttributionPrefixText() {
        var ageInDecimalSeconds = (ageInMillis / 1000).toFixed(1);
        return "Última lectura " + ageInDecimalSeconds + "s";
    }

    function updateVehicleRoutePopup(map, vehicleLayer) {
        var route = vehicleLayer.route;
        if (!route) {
            vehicleLayer.marker.off("popupopen");
            vehicleLayer.marker.off("popupclose");
            return;
        }
        vehicleLayer.marker.on("popupopen", function () {
            if(!routeLayers[route]) {
                return;
            }
            routeLayers[route].addTo(map);
        });
        vehicleLayer.marker.on("popupclose", function () {
            if(!routeLayers[route]) {
                return;
            }
            map.removeLayer(routeLayers[route]);
        });
    }

    function removeVehicleLayers(map) {
        for (var key in vehicleLayers) {
            if (!vehicleLayers.hasOwnProperty(key)) {
                //The current property is not a direct property of p
                continue;
            }
            //Do your logic with the property here
            var layer = vehicleLayers[key];
            map.removeLayer(layer.marker);
            map.removeLayer(layer.trail);
        }
    }

    function isVehicleValidForDisplay(vehicleSnapshot, currentTimestamp) {

        if (vehicleSnapshot.status === 'NOT_REPORTING') {
            return false;
        }

        //not valid if still for more than 1 hour
        var timeSinceChangeInMinutes = TU.UTIL.intervalInMinutes(currentTimestamp, vehicleSnapshot.positionChange);
        if(timeSinceChangeInMinutes > 60) {
            return false;
        }

        return vehicleSnapshot.withinServiceArea;
    }

    function createPopupContent(vehicleSnapshot, currentTimestamp) {

        var routeLabel = $('*[data-route-id="'+vehicleSnapshot.route+'"]').text();


        var popupContent = 'Veh&iacute;culo: ' + (vehicleSnapshot.vehicle || '') +
            '<br/>' + (!vehicleSnapshot.inRoute && '&Uacute;ltima ' || '') + 'Ruta: ' +
            (routeLabel || vehicleSnapshot.route || 'Desconocida');

        if (vehicleSnapshot.inRoute && vehicleSnapshot.direction) {
            popupContent += "<br/>Hacia: " + vehicleSnapshot.direction;
        }

        if (vehicleSnapshot.positionChange) {
            var positionChangeMin = TU.UTIL.intervalInMinutes(currentTimestamp, vehicleSnapshot.positionChange);
            if(positionChangeMin > 1) {
                popupContent += "<br/>Sin moverse hace " + positionChangeMin + " min";
            }
        }

        if (debug || vehicleSnapshot.withinServiceArea && !vehicleSnapshot.inRoute && vehicleSnapshot.possibleRoutes) {
            popupContent += "<br/>Rutas Posibles: " + vehicleSnapshot.possibleRoutes;
        }

        if (vehicleSnapshot.status === 'STOPPED') {
            popupContent += "<br/>" + vehicleSnapshot.status === 'STOPPED' && 'Veh&iacute;culo Apagado' || '';
        }

        if(debug) {
            popupContent += '<br/>Asset ID: ' + vehicleSnapshot.assetId;
            popupContent += '<br/>Velocidad: ' + Math.round(vehicleSnapshot.props.avgSpeed * 1000) / 1000 + ' m/s';
            popupContent += '<br/>En origen: ' + vehicleSnapshot.props.withinOrigin;
            popupContent += '<br/>En ruta: ' + vehicleSnapshot.inRoute;
            popupContent += '<br/>En servicio: ' + vehicleSnapshot.withinServiceArea;
        }
        return popupContent;
    }

    function getSvgIcon(opts) {
        var svgRoot = document.querySelector('#vehicle-icon-svg').cloneNode(true);
        svgRoot.id = 'vehicle-icon-svg-' + opts.route;
        svgRoot.querySelector('.borderGradient stop[offset="0"]').style.stopColor = opts.darkColor;
        svgRoot.querySelector('.borderGradient stop[offset="1"]').style.stopColor = opts.lightColor;
        svgRoot.querySelector('.fillGradient stop[offset="0"]').style.stopColor = opts.darkColor;
        svgRoot.querySelector('.fillGradient stop[offset="1"]').style.stopColor = opts.lightColor;

        var routeTextElem = svgRoot.querySelector('.svgRouteText');
        routeTextElem.stroke = opts.darkColor;
        routeTextElem.innerHTML = opts.route;

        return new VehicleSvgIcon({
            html: svgRoot.outerHTML
        });

    }

    return my;

}(TU.MAP || {}, jQuery, L));