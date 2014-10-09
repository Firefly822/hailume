<%--
  Created by IntelliJ IDEA.
  User: firefly
  Date: 2014/9/28
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发表文章页面</title>
    <style type="text/css">
        div#content {height:800px ;width: 60%;margin: 30px; float:left;}
        div.input-group {width: 300px;margin: 30px;}

        h1 {margin-bottom:0;}
        h2 {margin-bottom:0; font-size:14px;}
        ul {margin:0;}
        li {list-style:none;}
    </style>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/app/css/publish.css" rel="stylesheet">

</head>
<body>
    <div class="blog-masthead">
        <div class="container">
            <nav class="blog-nav">
                <a class="blog-nav-item active" href="#">Home</a>
                <a class="blog-nav-item" href="#">New features</a>
                <a class="blog-nav-item" href="#">Press</a>
                <a class="blog-nav-item" href="#">New hires</a>
                <a class="blog-nav-item" href="#">About</a>
            </nav>
        </div>
    </div>
    <div id="content">

        <div class="input-group">
            <span class="input-group-addon">题目</span>
            <input id="et_title" type="text" class="form-control" placeholder="请输入一个题目">
        </div>

        <!-- 百度编辑器 -->
        <script id="container" name="content" type="text/plain" style="width:100%;height:50%;">
        </script>
        <div class="btn-group">
            <button id="btn_confirm" type="button" class="btn btn-default">发表</button>
            <button id="btn_cancel" type="button" class="btn btn-default">取消</button>
        </div>
    </div>

    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/bootstrap.js"></script>

    <script src="/static/app/js/publish_page.js"></script>
    <!-- 样式文件 -->
    <link rel="stylesheet" href="/static/umeditor/themes/default/css/umeditor.css">
    <!-- 引用jquery -->
    <script src="/static/umeditor/third-party/jquery.min.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="/static/umeditor/umeditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/static/umeditor/umeditor.js"></script>
    <!-- 语言包文件 -->
    <script type="text/javascript" src="/static/umeditor/lang/zh-cn/zh-cn.js"></script>
    <!-- 实例化编辑器代码 -->
    <script type="text/javascript">
        $(function(){
            var ue = UM.getEditor('container', {
                /* 传入配置参数,可配参数列表看umeditor.config.js */
                toolbars: [
                    ['fullscreen', 'source', 'undo', 'redo'],
                    ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc']
                ]
            });
        });
    </script>
</body>
</html>
