$(document).ready(function(){
    var element = $('.flashes');
    if (element.length) {

        var offsets = element.offset();
        var top = offsets.top;
        var left = offsets.left;

        window.scrollTo(left, top);
    }



    $('#buy-button').on('click', function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $('#buy').offset().top
        }, 1000);
    });


    $('#rent-button').on('click', function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $('#rent').offset().top
        }, 1000);
    });


    $('#showcase-button').on('click', function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $('#showcase').offset().top
        }, 1000);
    });

    $('#gallery-button').on('click', function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $('#catalogue').offset().top
        }, 1000);
    });

    $('.catalogue-button').on('click', function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $('#catalogue').offset().top
        }, 1000);
    });
})
