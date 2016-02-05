function adjust_body_offset() {
    $('body').css('padding-top', $('.navbar-default').outerHeight(true) + 'px' );
}

$(window).resize(adjust_body_offset);

$(document).ready(adjust_body_offset);

$(window).load(adjust_body_offset);

var shiftWindow = function() { scrollBy(0, -50) };
if (location.hash) shiftWindow();
window.addEventListener("hashchange", shiftWindow);