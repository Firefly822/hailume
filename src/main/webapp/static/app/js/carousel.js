/**
 * Created by wangyapeng on 15/4/16.
 */
jQuery(document).ready(function(){
    var index = 0;
    var image;
    var carousels = new Array();
    var defaultImage = "/static/img/img01.jpg";
    var carouselId;
    var currentLi;

    $("#btn_add").click(function(){
        addNewCarousel();
        carouselId = "-1";
        index = -1;
    });

    showEditImage();

    function addNewCarousel(){
        $("#editSlide").modal("show");

        $('#input-id').fileinput('clear');

        $('#edit_title').val("");
        $('#edit_link').val("");
        $('#edit_brief').val("");
    }

    $(this).on("click","a.btn-info",function(){
        currentLi = $(this).parents("li");
        index = currentLi.index();
        carouselId = currentLi.attr("title");

        $('#edit_title').val(currentLi.find("h3").text());
        $('#edit_link').val(currentLi.find("a").eq(0).attr("href"));
        $('#edit_brief').val(currentLi.find("a").eq(0).text());

        image = currentLi.find(".portfolio-img").css("background-image").replace('url(','').replace(')','');
        showEditImage();
    });

    function check() {
        if ($('#edit_title').val() == "") {
            alert("标题不能为空");
            return false;
        } else if ($("#edit_link").val() == "") {
            alert("链接不能为空");
            return false;
        } else if ($(".file-preview-image").attr("src")==""||$('.J-cover').attr('cover-url') == "") {
            alert("图片不能为空");
            return false;
        }
        return true;
    }

    function getCarouselJson(){
        return {
            "id"  : Number(carouselId),
            "index": index,
            "title": $('#edit_title').val(),
            "brief": $('#edit_brief').val(),
            "image": $('.J-cover').attr('cover-url'),
            "link":  $('#edit_link').val()
        }
    }

    $("#save_carousels").click(function(){
        $.ajax({
            type: "POST",
            url: "/ajax/carousel/insert",
            contentType: "application/json",
            data: JSON.stringify(carousels),
            dataType: "json",
            traditional: true,
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

    function resetView(){
        var current;
        if(index==-1){
            current = addLiView();
        }else{
            current = $("#list li:eq("+index+")");
        }
        current.find("h3").html($('#edit_title').val());
        current.find("a").eq(0).html($("#edit_brief").val()).attr("href",$('#edit_link').val());
        current.find(".portfolio-img").css("background-image","url("+$('.J-cover').attr('cover-url')+")");
    }

    function addLiView(){
        var $node = $($('#theTemplate').val())
        $("#list").append($node);
        return $node;
    }

    $("#btn_commit").click(function(){
        if (!check()) {
            return;
        }
        carousels.push(getCarouselJson());
        $("#editSlide").modal("hide");
        resetView();
    });

    $("#btn_delete").click(function(){
        if(index==-1)return;

        if(carouselId=="-1"){
            currentLi.remove();
        }else{
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/ajax/carousel/delete",
                data: JSON.stringify({
                    "id": Number(carouselId)
                }),
                dataType: "json",
                success: function (json) {
                    if (json.code == 200) {
                        alert(json.info);
                        currentLi.remove();
                    } else {
                        alert(json.info)
                    }
                },
                error: function () {
                    alert("数据错误");
                }
            })
        }
    });

    function showEditImage(){
        if (image&&image.indexOf(defaultImage)==-1) {
            $("#input-id").fileinput('refresh', {
                uploadClass: 'btn btn-default J-upload-face',
                showRemove: false,
                initialPreview: [
                    "<img src='"+image+"' class='file-preview-image'"
                ]
            });
            $('.J-cover').attr('cover-url', image);
        } else {
            $("#input-id").fileinput('refresh', {
                uploadClass: 'btn btn-default J-upload-face',
                showRemove: false
            });
        }
    }

    $(this).on("click",".J-upload-face",function(){
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
    });

});