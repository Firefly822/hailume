/**
 * Created by firefly on 2014/10/2.
 */
jQuery(document).ready(function(){
    $('#submit').click(function(){
        var editor = UM.getEditor("container");
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/ajax/article/publish",
            data: JSON.stringify({
                title: $('#edit-title').val(),
                brief: $('#edit-brief').val(),
                image: {
                    url: $('.J-cover').attr('cover-url'),
                    description: $('#edit-title').val()
                },
                tags: $('#tokenfield').tokenfield('getTokensList').split(', '),
                content: editor.getContent()
            }),
            success: function (json) {
                if (json.code == 200) {
                    alert(json.info);
                    window.location.href = "/"
                }
            },
            error: function () {
                alert("数据错误");
            }
        })
    });

    <!-- 实例化编辑器代码 -->
    $(function(){
        var ue = UM.getEditor('container', {
            /* 传入配置参数,可配参数列表看umeditor.config.js */
            toolbars: [
                ['fullscreen', 'source', 'undo', 'redo'],
                ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc']
            ]
        });
    });

    $('#tokenfield').tokenfield({
        autocomplete: {
            source: [],
            delay: 100
        },
        showAutocompleteOnFocus: true
    })

    $("#input-id").fileinput('refresh', {
        uploadClass: 'btn btn-default J-upload-face',
        showRemove: false
    });
//
    $(".J-upload-face").click(function(){
        if ($("#input-id").val() == "") {
            alert('nothing to upload');
            return;
        }
        $("#face-pic").ajaxSubmit({
            dataType: 'json',
            success:function(json) {
                if (json.code == 200) {
                    $('.J-cover').attr('cover-url', json.entity);
                    alert('上传成功');
                } else {
                    alert(json.info);
                }
            }
        })
    })

//    $("#submit-face").click(function() {
//        $("#face-pic").ajaxSubmit({
//            dataType: 'json',
//            success:function(json) {
//                if (json.code == 200) {
//                    alert(json.entity);
//                } else {
//                    alert(json.info);
//                }
//            }
//        })
//    })

});