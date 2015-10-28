/**
 * Created by wangyapeng on 15/10/27.
 */
jQuery(document).ready(function($) {

    $('#fileupload').fileupload({
        dataType: 'json',
        maxNumberOfFiles : 1,
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $("#weixin_progress").css(
                'width',
                progress + '%'
            );
        },
        done: function (e, data) {
            $("#weixin_show").attr("src",data.result.files[0].url);
            $("#weixin_cancle").css({display:""});
        }
    });

    $('#main_title').change(function(){
        $('#article_title').text($(this).val())
    });

    $('#submit').click(function(){
        var allContents = editor.serialize();
        var elContent = allContents["element-0"].value;
        var main_title = $('#main_title').val();
        var main_desc = $('#main_desc').val();
        var image_url = $("#weixin_show").attr("src");

        if(main_title==""){
            alert("标题为空");
            return;
        }else if(main_desc==""){
            alert("描述为空");
            return;
        }else if(!image_url.startsWith("http")){
            alert("图片为空");
            return;
        }else if(elContent==""){
            alert("内容为空");
            return;
        }
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/ajax/article/publish",
            data: JSON.stringify({
                title: main_title,
                brief: main_desc,
                image: {
                    url: image_url,
                    description: ""
                },
                content: elContent
            }),
            success: function (json) {
                if (json.code == 200) {
                    alert(json.info);
                    window.location.href = "/"
                } else {
                    alert(json.info)
                }
            },
            error: function () {
                alert("数据错误");
            }
        })
    });

})