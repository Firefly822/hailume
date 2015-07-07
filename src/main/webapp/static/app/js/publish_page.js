/**
 * Created by firefly on 2014/10/2.
 */
jQuery(document).ready(function(){
    $('#submit').click(function(){
        if ($('#edit-title').val() == "") {
            alert("标题不能为空");
            return;
        }
        var editor = UM.getEditor("container");
        var content = editor.getContent();
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/ajax/article/publish",
            data: JSON.stringify({
                id: articleId,
                title: $('#edit-title').val(),
                brief: $('#edit-brief').val(),
                image: {
                    url: $('.J-cover').attr('cover-url'),
                    description: $('#edit-title').val()
                },
                tags: $('#tokenfield').tokenfield('getTokensList').split(', '),
                content: content,
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

    $('#preview').click(function(){
        if ($('#edit-title').val() == "") {
            alert("标题不能为空");
            return;
        }
        var editor = UM.getEditor("container");
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/ajax/article/preview",
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
            success: function (html) {
                previewWin = open("", "预览页","status=no,menubar=yes,toolbar=no");
                previewWin.document.open();
                previewWin.document.write(html);
                previewWin.document.close();
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

    if (image) {
        $("#input-id").fileinput('refresh', {
            uploadClass: 'btn btn-default J-upload-face',
            showRemove: false,
            initialPreview: [
                "<img src='"+image+"' class='file-preview-image'"
            ]
        });
    } else {
        $("#input-id").fileinput('refresh', {
            uploadClass: 'btn btn-default J-upload-face',
            showRemove: false
        });
    }

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

});