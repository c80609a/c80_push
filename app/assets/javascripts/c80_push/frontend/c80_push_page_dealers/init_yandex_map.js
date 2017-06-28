"use strict";

var dealers_map;

$(document).ready(function() {

    //noinspection JSUnresolvedVariable
    ymaps.ready(function() {

        //noinspection JSUnresolvedVariable,JSUnresolvedFunction
        dealers_map = new ymaps.Map('dealers_map_container', {
            center: [55, 37],
            zoom: 10,
            controls: ['zoomControl']
        });

        /*
        // Создаем коллекцию геообъектов.
        var myCollection = new ymaps.GeoObjectCollection();

        // Добавляем метки в коллекцию.
        myCollection.add(new ymaps.Placemark([37.61, 55.75]));
        myCollection.add(new ymaps.Placemark([13.38, 52.51]));
        myCollection.add(new ymaps.Placemark([30.30, 50.27]));

        // Добавляем коллекцию на карту.
        dealers_map.geoObjects.add(myCollection);

        // Устанавливаем карте центр и масштаб так, чтобы охватить коллекцию целиком.
        dealers_map.setBounds(myCollection.getBounds());
        */

        var c = new ymaps.GeoObjectCollection();
        var arr = offices['all'];
        var n = arr['count'];
        var icoords, iprops; // loop vars
        for (var i = 0; i < n; i++) {
            icoords = arr['coords'][i];
            iprops = arr['props'][i];
            c.add(new ymaps.Placemark(icoords, iprops));
        }
        dealers_map.geoObjects.add(c);
        dealers_map.setBounds(c.getBounds());
    });

});