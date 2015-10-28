<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>medium editor | demo</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css">
    <link href="http://cdn.bootcss.com/material-design-lite/1.0.5/material.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/material-design-lite/1.0.5/material.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="/static/bower_components/medium-editor/dist/css/medium-editor.min.css">
    <link rel="stylesheet" href="/static/bower_components/medium-editor/dist/css/themes/default.css" id="medium-editor-theme">
    <!-- Font Awesome for awesome icons. You can redefine icons used in a plugin configuration -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <link href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


    <!-- CSS -->
    <link rel="stylesheet" href="/static/bower_components/medium-editor-insert-plugin/dist/css/medium-editor-insert-plugin.min.css">
    <link rel="stylesheet" href="/static/app/css/editor.css">

</head>
<body>


<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">文章编辑页面</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Name</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <form action="#" onsubmit="return false">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="main_title"/>
                    <label class="mdl-textfield__label" for="main_title">标题</label>
                </div>
            </form>
            <form action="#" onsubmit="return false">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="main_desc"/>
                    <label class="mdl-textfield__label" for="main_desc">描述</label>
                </div>
            </form>
            <%--<input id="fileupload" type="file" name="files[]" data-url="/ajax/upload/files" multiple>--%>
            <div class="row fileupload-buttonbar" style="padding-left:15px;">
                <div class="thumbnail">
                    <img id="weixin_show" style="height:180px;margin-top:10px;margin-bottom:8px;"
                         src="/static/img/default_bg.png" data-holder-rendered="true">

                    <div class="progress progress-striped active" role="progressbar" aria-valuemin="10"
                         aria-valuemax="100" aria-valuenow="0">
                        <div id="weixin_progress" class="progress-bar progress-bar-success" style="width:0%;"></div>
                    </div>
                    <div class="caption" align="center">
                        <input id="fileupload" type="file" name="files[]" data-url="/ajax/upload/files" multiple>
                    </div>
                </div>
            </div>
            <!-- Raised button with ripple -->
            <button id="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
                发表
            </button>
            <!-- Raised button with ripple -->
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
                预览
            </button>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header" id="article_title">Title</h1>
            <div class="editable">
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/static/bower_components/medium-editor/dist/js/medium-editor.js"></script>
<script src="/static/bower_components/handlebars/handlebars.runtime.min.js"></script>
<script src="/static/bower_components/jquery-sortable/source/js/jquery-sortable-min.js"></script>
<!-- Unfortunately, jQuery File Upload Plugin has a few more dependencies itself -->
<script src="/static/bower_components/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="/static/bower_components/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="/static/bower_components/blueimp-file-upload/js/jquery.fileupload.js"></script>

<!-- JS -->
<script src="/static/bower_components/medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin.min.js"></script>

<script src="/static/app/js/editor.js"></script>

<script>
    var editor = new MediumEditor('.editable');

    $('.editable').mediumInsert({
        editor: editor, // (MediumEditor) Instance of MediumEditor
        enabled: true, // (boolean) If the plugin is enabled
        addons: { // (object) Addons configuration
            images: { // (object) Image addon configuration
                label: '<span class="fa fa-camera"></span>', // (string) A label for an image addon
                uploadScript: null, // DEPRECATED: Use fileUploadOptions instead
                deleteScript: 'delete.php', // (string) A relative path to a delete script
                deleteMethod: 'POST',
                preview: true, // (boolean) Show an image before it is uploaded (only in browsers that support this feature)
                captions: true, // (boolean) Enable captions
                captionPlaceholder: 'Type caption for image (optional)', // (string) Caption placeholder
                autoGrid: 3, // (integer) Min number of images that automatically form a grid
                formData: {}, // DEPRECATED: Use fileUploadOptions instead
                fileUploadOptions: { // (object) File upload configuration. See https://github.com/blueimp/jQuery-File-Upload/wiki/Options
                    url: '/ajax/upload/files', // (string) A relative path to an upload script
                    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i // (regexp) Regexp of accepted file types
                },
                styles: { // (object) Available image styles configuration
                    wide: { // (object) Image style configuration. Key is used as a class name added to an image, when the style is selected (.medium-insert-images-wide)
                        label: '<span class="fa fa-align-justify"></span>', // (string) A label for a style
                        added: function ($el) {
                        }, // (function) Callback function called after the style was selected. A parameter $el is a current active paragraph (.medium-insert-active)
                        removed: function ($el) {
                        } // (function) Callback function called after a different style was selected and this one was removed. A parameter $el is a current active paragraph (.medium-insert-active)
                    },
                    left: {
                        label: '<span class="fa fa-align-left"></span>'
                    },
                    right: {
                        label: '<span class="fa fa-align-right"></span>'
                    },
                    grid: {
                        label: '<span class="fa fa-th"></span>'
                    }
                },
                actions: { // (object) Actions for an optional second toolbar
                    remove: { // (object) Remove action configuration
                        label: '<span class="fa fa-times"></span>', // (string) Label for an action
                        clicked: function ($el) { // (function) Callback function called when an action is selected
                            var $event = $.Event('keydown');

                            $event.which = 8;
                            $(document).trigger($event);
                        }
                    }
                },
                messages: {
                    acceptFileTypesError: 'This file is not in a supported format: ',
                    maxFileSizeError: 'This file is too big: '
                },
                uploadCompleted: function ($el, data) {
                } // (function) Callback function called when upload is completed
            },
            embeds: { // (object) Embeds addon configuration
                label: '<span class="fa fa-youtube-play"></span>', // (string) A label for an embeds addon
                placeholder: 'Paste a YouTube, Vimeo, Facebook, Twitter or Instagram link and press Enter', // (string) Placeholder displayed when entering URL to embed
                captions: true, // (boolean) Enable captions
                captionPlaceholder: 'Type caption (optional)', // (string) Caption placeholder
                oembedProxy: 'http://medium.iframe.ly/api/oembed?iframe=1', // (string/null) URL to oEmbed proxy endpoint, such as Iframely, Embedly or your own. You are welcome to use "http://medium.iframe.ly/api/oembed?iframe=1" for your dev and testing needs, courtesy of Iframely. *Null* will make the plugin use pre-defined set of embed rules without making server calls.
                styles: { // (object) Available embeds styles configuration
                    wide: { // (object) Embed style configuration. Key is used as a class name added to an embed, when the style is selected (.medium-insert-embeds-wide)
                        label: '<span class="fa fa-align-justify"></span>', // (string) A label for a style
                        added: function ($el) {
                        }, // (function) Callback function called after the style was selected. A parameter $el is a current active paragraph (.medium-insert-active)
                        removed: function ($el) {
                        } // (function) Callback function called after a different style was selected and this one was removed. A parameter $el is a current active paragraph (.medium-insert-active)
                    },
                    left: {
                        label: '<span class="fa fa-align-left"></span>'
                    },
                    right: {
                        label: '<span class="fa fa-align-right"></span>'
                    }
                },
                actions: { // (object) Actions for an optional second toolbar
                    remove: { // (object) Remove action configuration
                        label: '<span class="fa fa-times"></span>', // (string) Label for an action
                        clicked: function ($el) { // (function) Callback function called when an action is selected
                            var $event = $.Event('keydown');

                            $event.which = 8;
                            $(document).trigger($event);
                        }
                    }
                }
            }
        }
    });
</script>

</body>
</html>
