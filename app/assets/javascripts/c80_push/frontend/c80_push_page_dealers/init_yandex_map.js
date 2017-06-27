$(document).ready(function() {

    var dealers_map;

    ymaps.ready(function() {
        dealers_map = new ymaps.Map('dealers_map_container', {
            center: [55, 37],
            zoom: 10
        });
    });

});