function map_set_objects(region_id) {

    var c = new ymaps.GeoObjectCollection();
    var arr = offices[region_id];
    var n = arr['count'];
    var icoords, iprops; // loop vars
    for (var i = 0; i < n; i++) {
        icoords = arr['coords'][i];
        iprops = arr['props'][i];
        c.add(new ymaps.Placemark(icoords, iprops));
    }
    dealers_map.geoObjects.add(c);
    dealers_map.setBounds(c.getBounds());
}