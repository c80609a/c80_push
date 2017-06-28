// нарисовать на карте объекты из указанного
// хэша offices[region_id]

function map_set_objects(region_id) {

    var arr = offices[region_id];
    // console.log(arr);
    var n = arr['count'];

    // соберём коллекцию точек
    var c = new ymaps.GeoObjectCollection();
    var icoords, iprops; // loop vars
    for (var i = 0; i < n; i++) {
        icoords = arr['coords'][i];
        iprops = arr['props'][i];
        c.add(new ymaps.Placemark(icoords, iprops));
    }

    // сначала уберём все точки
    dealers_map.geoObjects.each(function(o) {
        dealers_map.geoObjects.remove(o)
    });

    dealers_map.geoObjects.add(c);
    dealers_map.setBounds(c.getBounds());
}