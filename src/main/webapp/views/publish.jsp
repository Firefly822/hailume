<%--
  Created by IntelliJ IDEA.
  User: firefly
  Date: 2014/9/28
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>发表文章 —— 还撸么</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/responsive.css" rel="stylesheet">

    <link href="/static/css/jquery-ui.css" rel="stylesheet">
    <link href="/static/css/bootstrap-tokenfield.min.css" rel="stylesheet">
    <link href="/static/css/fileinput.min.css" rel="stylesheet">

    <link href="/static/app/css/header.css" rel="stylesheet">
    <link href="/static/app/css/publish.css" rel="stylesheet">
    <!-- 样式文件 -->
    <link rel="stylesheet" href="/static/umeditor/themes/default/css/umeditor.css">
</head>
<body>
    <c:import url="header.jsp"></c:import>

    <div id="featured">
        <div class="container">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr>
                        <th>标题：</th>
                        <td><input id="edit-title" type="text" style="width: 500px"></td>
                    </tr>
                    <tr>
                        <th>标签：</th>
                        <td><input type="text" class="form-control" id="tokenfield" placeholder="输入标签并按回车"/></td>
                    </tr>
                    <tr>
                        <th>摘要：</th>
                        <td><textarea id="edit-brief" type="text" rows="3" style="width: 100%;"></textarea></td>
                    </tr>
                    <tr>
                        <th>封面：</th>
                        <td>
                            <form id="face-pic" method="POST" action="/ajax/upload/file" enctype="multipart/form-data" target='frameFile'>
                                <input id="input-id" name="file" type="file" class="file J-cover" data-preview-file-type="text" >
                                <%--<input id="submit-face" value="upload" type="button">--%>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <th>内容：</th>
                        <td>
                            <!-- 百度编辑器 -->
                            <script id="container" name="content" type="text/plain" style="width:100%;height:50%;">
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <button id="submit" type="button">发表</button>
                            <button id="preview" type="button">预览</button>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <iframe id='frameFile' name='frameFile' style='display: none;'></iframe>

    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/jquery-ui.js"></script>
    <script src="/static/js/bootstrap.js"></script>
    <script src="/static/js/masonry.pkgd.min.js"></script>
    <script src="/static/js/imagesloaded.pkgd.min.js"></script>
    <script src="/static/js/gmap3.min.js"></script>
    <script src="/static/js/jquery.isotope.min.js"></script>
    <script src="/static/js/jquery.easing.js"></script>
    <script src="/static/js/jquery.form.js"></script>
    <script src="/static/js/script.js"></script>
    <script src="/static/js/bootstrap-tokenfield.js"></script>
    <script src="/static/js/fileinput.min.js"></script>

    <script src="/static/app/js/publish_page.js"></script>
    <script src="/static/app/js/header.js"></script>
    <!-- 引用jquery -->
    <%--<script src="/static/umeditor/third-party/jquery.min.js"></script>--%>
    <!-- 配置文件 -->
    <script type="text/javascript" src="/static/umeditor/umeditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/static/umeditor/umeditor.js"></script>
    <!-- 语言包文件 -->
    <script type="text/javascript" src="/static/umeditor/lang/zh-cn/zh-cn.js"></script>
</body>
</html>
