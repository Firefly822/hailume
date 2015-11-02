jQuery(document).ready(function($) {

    $('#myCarousel').carousel({
        interval: 5000
    });

    $('#carousel-text').html($('#slide-content-0').html());

    //Handles the carousel thumbnails
    $('[id^=carousel-selector-]').click( function(){
        var id_selector = $(this).attr("id");
        var id = id_selector.substr(id_selector.length -1);
        var id = parseInt(id);
        $('#myCarousel').carousel(id);
    });


    // When the carousel slides, auto update the text
    $('#myCarousel').on('slid.bs.carousel', function (e) {
        var id = $('.item.active').data('slide-number');
        $('#carousel-text').html($('#slide-content-'+id).html());
    });

    $('.mod_focus-index_list li').fadeOut(0).eq(0).fadeIn(0);
    var i = 0;
    if ($(".mod_focus-index_list li").length > 1) {
        setInterval(function(){if ($(".mod_focus-index_list li").length > (i+1)){
                $(".mod_focus-index_list li").eq(i).fadeOut(0).next("li").fadeIn(1000);
                i++;
            }
            else{
                $(".mod_focus-index_list li").eq(i).fadeOut(0).siblings("li").eq(0).fadeIn(1000);
                i = 0;
            }
        },5000);
    }

});
