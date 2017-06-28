/**
 * Сфокусироваться на точке на карте.
 * Если надо - открыть balloon.
 * @param id : id офиса.
 */
function _item_toggle(id) {
    //console.log('<_item_toggle> id: ' + id);

    var it = dealers_map.geoObjects.getIterator(),
        group;

    while(group = it.getNext()) {
        //console.log(group.properties);
        if (group.properties !== undefined) {
            for (var i = 0, len = group.getLength(); i < len; i++) {
                var placemark = group.get(i);
                //console.log(placemark.properties.get('id'));
                if (placemark.properties.get('id') === id) {
                    //console.log('+ ' + placemark.balloon.isOpen());
                    if (placemark.balloon.isOpen()) {
                        placemark.balloon.close();
                    }
                    else {
                        dealers_map.panTo(placemark.geometry.getCoordinates(), {
                            delay: 0
                        }).then(function () {
                            placemark.balloon.open();
                        });
                    }
                    return;
                }
            }
            break;
        }
    }
}

/**
 * Начинаем слушать клики по .li_office.
 * При клике - вызовется _item_toggle.
 */
function _dealers_left_list_clicks() {
    $('.li_office').on("click", function (e) {
        e.preventDefault();
        var office_id = $(this).data('id');
        _item_toggle(office_id);
    });
}

$(document).ready(_dealers_left_list_clicks);