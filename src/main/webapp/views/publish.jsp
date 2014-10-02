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
        div#header {background: #1e1eff;}
        div#menu {background: #f8fdff;width: 600px; height: 500px ; float: left;}
        div#content {background-color:#EEEEEE; height:800px ; width:600px; float:left;}
        div#footer {background-color:#99bbbb; clear:both; text-align:center;}
        h1 {margin-bottom:0;}
        h2 {margin-bottom:0; font-size:14px;}
        ul {margin:0;}
        li {list-style:none;}
    </style>


</head>
<body>
    <div id="header">发表文章页面</div>
    <div id="menu">
        <h1>菜单</h1>
        <ul>
            <li>编辑文章</li>
            <li>已发表文章</li>
        </ul>
    </div>
    <div id="content">
        <form>
            题目:
            <input type="text" name="题目" />
            <br />
            列别:
            <input type="text" name="类别" />
        </form>
        <h3>编辑文章</h3>
        <!-- 百度编辑器 -->
        <script id="container" name="content" type="text/plain" style="width:600px;height:200px;">
            编辑文章
        </script>
        <button id="publish">发表</button>
        <h4>预览</h4>
        <p id="pre">empty</p>
        <div id="detaildiv"></div>
    </div>
    <div id="footer">end</div>

    <script src="/static/js/jquery.js"></script>
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
