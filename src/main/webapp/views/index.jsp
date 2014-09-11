<%--
  Created by IntelliJ IDEA.
  User: liming_liu
  Date: 14-9-1
  Time: 下午3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/static/img/favicon.png">

    <title>Danish./</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/static/js/html5shiv.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!-- begin:navbar -->
<nav class="navbar navbar-default navbar-transparent navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-top">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><i class="fa fa-recycle"></i> <span>还撸</span>么.</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-top">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/">首页</a></li>
                <li><a href="#">关于我们</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- end:navbar -->

<!-- begin:header -->
<section id="header" style="background: url(/static/img/img03.jpg) center center;">
    <div class="overlay"></div>
</section>
<!-- end:header -->

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
                                    <a class="active item" data-slide-number="0" href="#" target="_blank">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/2014072510102999502.jpg">
                                    </a>

                                    <a class="item" data-slide-number="1" href="#" target="_blank">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/2014072510103176146.jpg">
                                    </a>

                                    <a class="item" data-slide-number="2" href="#" target="_blank">
                                        <img src="http://image.uuu9.com/pcgame/lol//UploadFiles//201407/2014072510103307379.jpg">
                                    </a>

                                    <a class="item" data-slide-number="3" href="#" target="_blank">
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
        <div class="row container-post">
            <!-- begin:article -->
            <div class="col-md-4 col-sm-6">
                <div class="post-container">
                    <div class="post-content">
                        <div class="heading-title heading-small">
                            <h2><a href="#">This is sample post text</a></h2>
                        </div>
                        <div class="post-meta">
                            <span>By <a href="#" title="Posts by admin" rel="author">Admin</a></span>
                            <span>On September 11, 2014</span>
                            <span>In <a href="#">Story</a></span>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat...</p>
                        <div class="post-link">
                            <a href="#"><span>Read more</span></a>
                        </div>
                    </div>
                    <div class="post-atribut">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-heart"></i> 2000</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-comments"></i> 400</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-eye"></i> 2500</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- break -->
            <div class="col-md-4 col-sm-6">
                <div class="post-container">
                    <div class="post-content no-padding">
                        <img src="/static/img/img01.jpg" alt="danish personal blog template">
                    </div>
                    <div class="post-content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
                    </div>
                    <div class="post-atribut">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-heart"></i> 2000</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-comments"></i> 400</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-eye"></i> 2500</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- break -->
            <div class="col-md-4 col-sm-6">
                <div class="post-container">
                    <div class="post-content">
                        <img src="/static/img/img02.jpg" alt="danish personal blog template">
                        <div class="heading-title heading-small">
                            <h2><a href="#">This is sample post text with featured image</a></h2>
                        </div>
                        <div class="post-meta">
                            <span>By <a href="#" title="Posts by admin" rel="author">Admin</a></span>
                            <span>On September 11, 2014</span>
                            <span>In <a href="#">Story</a></span>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, </p>
                        <div class="post-link">
                            <a href="#"><span>Read more</span></a>
                        </div>
                    </div>
                    <div class="post-atribut">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-heart"></i> 2000</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-comments"></i> 400</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-eye"></i> 2500</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- break -->
            <div class="col-md-4 col-sm-6">
                <div class="post-container">
                    <div class="post-content">
                        <blockquote>
                            <p>Dikehidupan manusia itu memang banyak usaha yang tidak membuahkan hasil. Usaha mendapatkan cintamu misalnya.. </p>
                            <small>Bardiman</small>
                        </blockquote>
                    </div>
                    <div class="post-atribut">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-heart"></i> 2000</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-comments"></i> 400</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-eye"></i> 2500</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- break -->
            <div class="col-md-4 col-sm-6">
                <div class="post-container">
                    <div class="post-content">
                        <img src="/static/img/img04.jpg" alt="danish personal blog template">
                        <p>This is sample post image caption</p>
                        <div class="post-link">
                            <a href="#"><span>Read more</span></a>
                        </div>
                    </div>
                    <div class="post-atribut">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-heart"></i> 2000</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-comments"></i> 400</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-eye"></i> 2500</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- break -->
            <div class="col-md-4 col-sm-6">
                <div class="post-container">
                    <div class="post-content">
                        <div class="post-meta">
                            <span>By <a href="#" title="Posts by admin" rel="author">Admin</a></span>
                            <span>On September 11, 2014</span>
                            <span>In <a href="#">Story</a></span>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat...</p>
                        <div class="post-link">
                            <a href="#"><span>Read more</span></a>
                        </div>
                    </div>
                    <div class="post-atribut">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-heart"></i> 2000</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-comments"></i> 400</span></a>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <a href="#"><span><i class="fa fa-eye"></i> 2500</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- break -->
        </div>
        <!-- end:article -->

    </div>
</section>
<!-- end:content -->

<!-- begin:portfolio -->
<section id="portfolio">
    <ul class="list-unstyled container-portfolio">
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img01.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img02.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img03.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img04.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img05.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img04.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img01.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="portfolio-item">
                <div class="portfolio-img" style="background: url(/static/img/img02.jpg);"></div>
                <div class="portfolio-caption">
                    <div class="portfolio-text">
                        <h3>Portfolio Title /</h3>
                        <p>Short Description About Portfolio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.</p>
                        <a href="#" class="btn btn-info">View &raquo;</a>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</section>
<!-- end:portfolio -->

<!-- begin:partner -->
<section id="partner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="list-unstyled brand-img">
                    <li>
                        <a href="#"><img src="/static/img/partner01.png"></a>
                    </li>
                    <li>
                        <a href="#"><img src="/static/img/partner02.png"></a>
                    </li>
                    <li>
                        <a href="#"><img src="/static/img/partner01.png"></a>
                    </li>
                    <li>
                        <a href="#"><img src="/static/img/partner02.png"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- end:partner -->

<!-- begin:footer -->
<section id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3">
                <div class="widget">
                    <h3>Recent Post</h3>
                    <ul class="list-unstyled">
                        <li><a href="#">Lorem ipsum</a></li>
                        <li><a href="#">Lorem</a></li>
                        <li><a href="#">Lorem ipsum dolor</a></li>
                        <li><a href="#">Lorem sit</a></li>
                        <li><a href="#">Lorem dolor sit</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-3">
                <div class="widget">
                    <h3>Useful Links</h3>
                    <ul class="list-unstyled">
                        <li><a href="#">Lorem sit</a></li>
                        <li><a href="#">Lorem dolor sit</a></li>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6 col-sm-5">
                <div class="footer-logo">
                    <h2><i class="fa fa-recycle"></i> Danish.</h2>
                    <p>1024 Main Street, Jejeran Plrt Btl<br>+62 (123) 456-7890</p>
                    <br>
                    <p class="muted">漏 2014 Brand Inc.</p>
                    <a href="#">Terms of Service</a>
                    <a href="#">Privacy</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end:footer -->

<!-- begin:copyright -->
<section id="copyright">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 copy-left">
                <p>Copyright &copy; 2014 <strong>avriqqlabs</strong>. All Right Reserved.</p>
            </div>

            <div class="col-md-6 col-sm-6 copy-right">
                <ul class="list-inline social-icon">
                    <li><a href="#" class="icon-twitter" rel="tooltip" title="" data-placement="top" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" class="icon-facebook" rel="tooltip" title="" data-placement="top" data-original-title="Facebook"><i class="fa fa-facebook-square"></i></a></li>
                    <li><a href="#" class="icon-youtube" rel="tooltip" title="" data-placement="top" data-original-title="Youtube"><i class="fa fa-youtube"></i></a></li>
                    <li><a href="#" class="icon-instagram" rel="tooltip" title="" data-placement="top" data-original-title="Instagram"><i class="fa fa-instagram"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- end:copyrigt -->


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
<script src="/static/app/js/index.js"></script>
</body>
</html>
