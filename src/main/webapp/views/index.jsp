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

</head>

<body>
<c:import url="header.jsp"></c:import>

<!-- begin:featured -->
<div id="featured">
    <div class="container">
        <div id="main_area" style="margin-bottom: 10px;">
            <!-- Slider -->
            <div class="row">
                <div class="col-xs-12" id="slider">
                    <!-- Top part of the slider -->
                    <div class="row">
                        <div class="col-sm-8" id="carousel-bounding-box">
                            <div class="carousel slide" id="myCarousel">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <a class="active item" data-slide-number="0" href="/a/4" target="_blank">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/2014072510102999502.jpg">
                                    </a>

                                    <a class="item" data-slide-number="1" href="/a/3" target="_blank">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/2014072510103176146.jpg">
                                    </a>

                                    <a class="item" data-slide-number="2" href="javascript:;">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/2014072510103307379.jpg">
                                    </a>

                                    <a class="item" data-slide-number="3" href="javascript:;">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/201407251010348231113.jpg">
                                    </a>


                                </div><!-- Carousel nav -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>

                        <div class="col-sm-4" id="carousel-text"></div>

                        <div id="slide-content" style="display: none;">
                            <div id="slide-content-0">
                                <h2>${headerText1}</h2>
                                <p>${content1}</p>
                            </div>

                            <div id="slide-content-1">
                                <h2>${headerText2}</h2>
                                <p>${content2}</p>
                            </div>

                            <div id="slide-content-2">
                                <h2>${headerText3}</h2>
                                <p>${content3}</p>
                            </div>

                            <div id="slide-content-3">
                                <h2>${headerText4}</h2>
                                <p>${content4}</p>
                            </div>

                        </div>
                    </div>
                </div>
            </div><!--/Slider-->
        </div>
    </div>
</div>
<!-- end:featured -->

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
                    <div class="portfolio-caption">
                        <div class="portfolio-text">
                            <h3>${prologue.title}</h3>
                            <p>${prologue.brief}</p>
                            <a href="/a/${prologue.id}" class="btn btn-info">阅读全文</a>
                        </div>
                    </div>
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
