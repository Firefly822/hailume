jQuery(document).ready(function($) {

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
                    createCookie('lumer', json.entity.cookie, 1);
                    window.location.reload();
                } else {
                    alert(json.info);
                }
            },
            error: function() {
                alert("啊哦。出了点小问题");
            }
        })
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
                    createCookie('lumer', json.entity.cookie, 1);
                    window.location.reload();
                } else {
                    alert(json.info);
                }
            },
            error: function() {
                alert("啊哦。出了点小问题");
            }
        })
    })

    $('#btnLogout').click(function(){
        eraseCookie('lumer');
        window.location.reload();
    })

    function createCookie(name,value,days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime()+(days*24*60*60*1000));
            var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/";
    }

    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    }

    function eraseCookie(name) {
        createCookie(name,"",-1);
    }
})