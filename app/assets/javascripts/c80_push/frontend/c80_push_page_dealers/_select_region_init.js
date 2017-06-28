var $select_region;

var _select_region_on_change = function() {
    var region_id = $(this).val();
    // console.log('<_select_region_on_change> region_id = ' + region_id);
    map_set_objects(region_id);
};

var select_region_init = function() {
    //noinspection JSUnresolvedFunction
    $select_region = $('#select_region').selectpicker();
    $select_region.change(_select_region_on_change);
};
$(document).ready(select_region_init);