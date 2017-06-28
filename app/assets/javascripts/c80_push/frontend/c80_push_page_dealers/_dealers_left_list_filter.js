/**
 * В списке дилеров слева от карты оставить только тех,
 * кто принадлежит указанному региону.
 *
 * @param region_id
 */
function dealers_left_list_filter(region_id) {
    if (region_id === 'all') {
        $('.li_region').css('display', 'block');
    } else {
        $('.li_region').css('display', 'none');
        $('.li_region#region_' + region_id).css('display','block');
    }
}