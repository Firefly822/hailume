/**
 * Created by firefly on 2014/10/9.
 */
jQuery(document).ready(function(){
    $.ajax({
        type: "POST",
        url: "/ajax/article/loadpage",
        data: {
            title: "firefly"
        },
        success: function (json) {
            if (json.code == 200) {
                $('#article_title').text(json.entity.title);
                $('#article_content').html(json.entity.content);
            }
        },
        error: function () {
            alert("数据错误");
        }
    });
});