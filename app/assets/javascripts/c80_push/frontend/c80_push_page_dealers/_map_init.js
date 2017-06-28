"use strict";

var dealers_map;

$(document).ready(function() {

    if ($('#dealers_map_container').length) {
        //noinspection JSUnresolvedVariable
        ymaps.ready(function() {

            //noinspection JSUnresolvedVariable,JSUnresolvedFunction
            dealers_map = new ymaps.Map('dealers_map_container', {
                center: [55, 37],
                zoom: 10,
                controls: ['zoomControl']
            });

            map_set_objects('all');

        });
    }

});