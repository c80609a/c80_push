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
        for (var i = 0; i < offices['all'].length; i++) {
            c.add(new ymaps.Placemark(offices['all'][i]));
        }
        dealers_map.geoObjects.add(c);
        dealers_map.setBounds(c.getBounds());
    });

});