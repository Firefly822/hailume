/**
 * Created by firefly on 2014/10/2.
 */
jQuery(document).ready(function(){
    $('#btn_confirm').click(function(){
        var editor = UM.getEditor("container");
        $.ajax({
            type: "POST",
            url: "/ajax/article/publish",
            data: {
                title: $('#et_title').val(),
                content: editor.getContent()
            },
            success: function (json) {
                if (json.code == 200) {
                    window.location = "/newpage"
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
});