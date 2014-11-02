/**
 * Created by firefly on 2014/10/9.
 */
jQuery(document).ready(function(){
    $.ajax({
        type: "POST",
        url: "/ajax/article/loadpage",
        data: {
            title: "firefly1"
        },
        success: function (json) {
            if (json.code == 200) {
                $('#post_title').text(json.entity.title);
                $('#post_content').html(json.entity.content);
            } else {
                alert(json.info);
            }
        },
        error: function () {
            alert("数据错误");
        }
    });
});