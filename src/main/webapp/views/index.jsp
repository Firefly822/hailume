<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/static/img/favicon.png">

    <title>还撸么——宅乐园</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/responsive.css" rel="stylesheet">

    <link href="/static/app/css/header.css" rel="stylesheet">
    <link href="/static/app/css/index.css" rel="stylesheet">
    <%--<link type="text/css" rel="stylesheet" href="http://static.qiyi.com/css/common/v3-index-iqiyi/index-iqiyi-v1.css" />--%>

</head>

<body>
<c:import url="header.jsp"></c:import>

<%--<!-- begin:featured -->--%>
<%--<div id="featured">--%>
    <%--<div class="container">--%>
        <%--<div id="main_area" style="margin-bottom: 10px;">--%>
            <%--<!-- Slider -->--%>
            <%--<div class="row">--%>
                <%--<div class="col-xs-12" id="slider">--%>
                    <%--<!-- Top part of the slider -->--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-sm-8" id="carousel-bounding-box">--%>
                            <%--<div class="carousel slide" id="myCarousel">--%>
                                <%--<!-- Carousel items -->--%>
                                <%--<div class="carousel-inner">--%>
                                    <%--<c:forEach items="${indexs}" var="carousel" varStatus="status">--%>
                                        <%--<a <c:choose>--%>
                                            <%--<c:when test="${status.index==0}">class="active item"</c:when>--%>
                                            <%--<c:otherwise>class="item"</c:otherwise>--%>
                                        <%--</c:choose> data-slide-number="${status.index}" href="${carousel.link}" target="_blank">--%>
                                            <%--<img src="${carousel.image}">--%>
                                        <%--</a>--%>
                                    <%--</c:forEach>--%>
                                <%--</div><!-- Carousel nav -->--%>
                                <%--<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">--%>
                                    <%--<span class="glyphicon glyphicon-chevron-left"></span>--%>
                                <%--</a>--%>
                                <%--<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">--%>
                                    <%--<span class="glyphicon glyphicon-chevron-right"></span>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="col-sm-4" id="carousel-text"></div>--%>

                        <%--<div id="slide-content" style="display: none;">--%>
                            <%--<c:forEach items="${indexs}" var="carousel" varStatus="status">--%>
                                <%--<div id='slide-content-${status.index}'>--%>
                                    <%--<h2>${carousel.title}</h2>--%>
                                    <%--<p>${carousel.brief}</p>--%>
                                <%--</div>--%>
                            <%--</c:forEach>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div><!--/Slider-->--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- end:featured -->--%>

<div id="featured">
    <div class="container">
        <div id="main_area" style="margin-bottom: 10px;">
<div class="page-wrap" style="margin: 0;padding: 0;vertical-align: baseline;">
<div id="block-B" data-block-name="焦点图">



<div class="mod_focus-index">
<div class="focus-index_inner" style="display: block;" id="indexfocus">
<!-- 焦点图-图片列表 -->
<div class="focus-index_listwrap">
    <ul class="mod_focus-index_list">
    <c:forEach items="${indexs}" var="carousel" varStatus="status">
        <li style="display: block; opacity: 1; background-image: url(${carousel.image});">
            <a class="mod_focus-index_item" href="${carousel.link}" alt="${carousel.brief}" target="_blank"></a>
        </li>
    </c:forEach>
    </ul>
</div>
<!-- 焦点图-文字列表 -->
<div class="focus-index_thumbnailWrap">
    <div class="focus-index_thumbnailBg" style="background: url(/static/img/site-focuslist_bg.png);"></div>
    <div class="focus-index_thumbnail">
        <div class="index_thumbnail_inner">
            <ul class="thumbnail_list" style="list-style: none outside none;">
                <c:forEach items="${indexs}" var="carousel" varStatus="status">
                    <c:choose>
                        <c:when test="${status.index==0}">
                            <li data-indexfocus-index="0" class="selected">
                                <a href="${carousel.link}" class="thumbnail_item " alt="${carousel.brief}" target="_blank">${carousel.title}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li data-indexfocus-index="${status.index}">
                                <a href="${carousel.link}" class="thumbnail_item " alt="${carousel.brief}" target="_blank">${carousel.title}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</div>
</div>
</div>

</div>
            </div>
        </div>
    </div>

<!-- begin:content -->
<section id="content">
    <div class="container">
        <!-- begin:article -->
        <div class="row container-post">
            <c:forEach items="${articles}" var="article">
                <div class="col-md-4 col-sm-6">
                    <div class="post-container">
                        <div class="post-content">
                            <c:if test="${article.image != null && fn:length(article.image.url) > 0}">
                                <a href="/a/${article.id}" target="_blank">
                                    <img src="${article.image.url}" alt="${article.image.description}">
                                </a>
                            </c:if>
                            <div class="heading-title heading-small">
                                <h2><a href="/a/${article.id}" target="_blank">${article.title}</a></h2>
                            </div>
                            <div class="post-meta">
                                <span><a href="javascript:;"rel="author">${article.authorName}</a> 发表</span>
                                <span>编辑于 <s:formatDate value="${article.addTime}" type="date" /></span>
                            </div>
                            <p>${article.brief}</p>
                            <div class="post-link">
                                <a href="/a/${article.id}" target="_blank"><span>阅读全文</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- break -->
            </c:forEach>
        </div>
        <!-- end:article -->

    </div>
</section>
<!-- end:content -->

<section id="portfolio">
    <ul class="list-unstyled container-portfolio">
        <c:forEach items="${prologues}" var="prologue">
            <li>
                <div class="portfolio-item">
                    <div class="portfolio-img" style="background: url(${prologue.image.url});"></div>
                    <a href="/a/${prologue.id}" class="portfolio-caption">
                        <div class="portfolio-text">
                            <h3>${prologue.title}</h3>
                            <p>${prologue.brief}</p>
                        </div>
                    </a>
                </div>
            </li>
        </c:forEach>
    </ul>
</section>

<section id="copyright">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <p style="text-align: center;"> © 2014 <strong>hailu.me</strong>. All Right Reserved.<a href="http://www.miitbeian.gov.cn/" target="_blank">黑ICP备14005069号</a> </p>
            </div>
        </div>
    </div>
</section>

<!-- end:partner -->



<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="/static/js/html5shiv.js"></script>
<script src="/static/js/respond.min.js"></script>
<![endif]-->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/static/js/jquery.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/js/masonry.pkgd.min.js"></script>
<script src="/static/js/imagesloaded.pkgd.min.js"></script>
<script src="/static/js/gmap3.min.js"></script>
<script src="/static/js/jquery.isotope.min.js"></script>
<script src="/static/js/jquery.easing.js"></script>
<script src="/static/js/script.js"></script>
<script src="/static/app/js/header.js"></script>
<script src="/static/app/js/index.js"></script>
</body>
</html>
