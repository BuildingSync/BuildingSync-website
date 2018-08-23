/**
 * Created by nmerket on 2/18/16.
 */
var headerHeight = 101;
$('#navbrand').addClass('hidden');

$(window).bind('scroll', function () {
    var nav = $('#floatingnav');
    var navbrand = $('#navbrand');
    if ($(window).scrollTop() > headerHeight) {
        nav.removeClass('navbar-static-top');
        nav.addClass('navbar-fixed-top');
        navbrand.removeClass('hidden');
        $('body').addClass('navbarbodypadding');
    } else {
        nav.removeClass('navbar-fixed-top');
        nav.addClass('navbar-static-top');
        navbrand.addClass('hidden');
        $('body').removeClass('navbarbodypadding');
    }
});
