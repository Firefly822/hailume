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

    $('#btnLogin').click(function(){
        $.ajax({
            type: "POST",
            url: "/ajax/user/login",
            data: {
                username:$('#username').val(),
                password:$('#password').val()
            },
            success: function(json) {
                if (json.code == 200) {
                    $('#userIcon').removeClass('dropdown').html('<a href="javascript:;">'+json.entity.nickname+'</a>');
                    document.cookie="lumer="+json.entity.cookie;
                } else {
                    alert(json.info);
                }
            },
            error: function() {
                alert("啊哦。出了点小问题");
            }
        })

        $('.dropdown').removeClass('open');
    })

    $('#btnRegister').click(function(){
        if (!$('#inputNickname').val()) {
            alert('你需要一个响亮的大名');
        }
        if ($('#inputpassword').val() != $('#inputVerify').val()) {
            alert('两次输入的密码不一致');
        }
        $.ajax({
            type: "POST",
            url: "/ajax/user/register",
            data: {
                username:$('#inputUsername').val(),
                password:$('#inputpassword').val(),
                nickname:$('#inputNickname').val()
            },
            success: function(json) {
                if (json.code == 200) {
                    $('#navLogin').html($('#inputNickname').val());
                    document.cookie="lumer="+json.entity.cookie;
                } else {
                    alert(json.info);
                }
            },
            error: function() {
                alert("啊哦。出了点小问题");
            }
        })
        $('.dropdown').removeClass('open');
    })
});
