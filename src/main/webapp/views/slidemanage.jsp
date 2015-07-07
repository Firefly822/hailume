<%--
  Created by IntelliJ IDEA.
  User: wangyapeng
  Date: 15/4/16
  Time: 下午9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Danish.</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <!--<link href='http://fonts.googleapis.com/css?family=Raleway:400,800' rel='stylesheet' type='text/css'>-->
    <!--<link href='http://fonts.googleapis.com/css?family=Noto+Serif:700,400italic' rel='stylesheet' type='text/css'>-->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/responsive.css" rel="stylesheet">
    <link href="/static/css/fileinput.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/static/js/html5shiv.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!-- begin:header -->
<section id="header" style="background: url(/static/img/header.jpg) center center;">
    <div class="overlay"></div>
</section>
<!-- end:header -->
<textarea id="theTemplate" style="display: none">
    <li class="bag dress" title="-1">
        <div class="portfolio-item">
            <div class="portfolio-img" style="background: url(/static/img/img01.jpg);"></div>
            <div class="portfolio-caption">
                <div class="portfolio-text">
                    <h3>小编教你排位上铂金</h3>
                    <p><a href="#">#####</a></p>
                    <a href='#editSlide' data-toggle='modal' class="btn btn-info">View &raquo;</a>
                </div>
            </div>
        </div>
    </li>
</textarea>
<!-- begin:portfolio -->
<section id="portfolio" class="portfolio-page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <ul id="list" class="list-unstyled container-portfolio">
                    <c:forEach items="${carousels}" varStatus="status" var="carousel">
                        <li class="bag dress" title="${carousel.id}">
                            <div class="portfolio-item">
                                <div class="portfolio-img" style="background: url(${carousel.image});"></div>
                                <div class="portfolio-caption">
                                    <div class="portfolio-text">
                                        <h3>${carousel.title}</h3>
                                        <p><a href="${carousel.link}">${carousel.brief}</a></p>
                                        <a href='#editSlide' data-toggle='modal' class="btn btn-info">View &raquo;</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>
</section>
<!-- end:portfolio -->

<section id="save" style="text-align:center">
    <a href='javascript:;' id="btn_add" class='btn btn-success'>添加</a>
    <a href='javascript:;' data-toggle='modal' id="save_carousels" class='btn btn-primary btn-large'>保存轮播图</a>
</section>

<div class='container'>
    <div id='editSlide' class='modal fade' style='display:none;width: 1000px;margin: auto'>
        <div class="modal-content">
            <div class='modal-header'>
                <a class='close' data-dismiss='modal'>X</a>
                <h3>编辑轮播图</h3>
            </div>
            <div class='modal-body'>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">轮播图：</label>
                        <div class="col-sm-8">
                            <form id="face-pic" method="POST" action="/ajax/upload/file" enctype="multipart/form-data" target="frameFile">
                                <input id="input-id" name="file" type="file" class="file J-cover" data-preview-file-type="text" cover-url="">
                                <%--<input id="submit-face" value="upload" type="button">--%>
                            </form>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">标题：</label>
                        <div class="col-sm-8">
                            <input id="edit_title" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">描述：</label>
                        <div class="col-sm-8">
                            <input id="edit_brief" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">链接：</label>
                        <div class="col-sm-8">
                            <input id="edit_link" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div class='modal-footer'>
                <a href='#' id="btn_commit" class='btn btn-success'>修改</a>
                <a href='#' id="btn_delete" class='btn btn-danger' data-dismiss='modal'>删除</a>
            </div>
        </div>
    </div>

    <iframe id='frameFile' name='frameFile' style='display: none;'></iframe>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
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


<script src="/static/app/js/carousel.js"></script>
</body>
</html>