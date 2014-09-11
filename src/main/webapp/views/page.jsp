<%--
  Created by IntelliJ IDEA.
  User: firefly
  Date: 2014/9/11
  Time: 19:57
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

    <title>还撸么</title>

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

<!-- begin:content -->
<section id="content">
    <div class="container">
        <div class="row">
            <!-- begin:article -->
            <div class="col-md-8 col-sm-8">
                <div class="row">
                    <div class="col-md-12 post-single">
                        <div class="heading-title">
                            <h2><a href="single.html">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</a></h2>
                        </div>
                        <div class="post-meta">
                            <span><em>By <a href="#">tarjono</a></em></span>
                            <span><em>On May 04, 2014</em></span>
                            <span><em>In <a href="#">Love life</a></em></span>
                        </div>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                    </div>
                </div>

                <hr>

                <!-- begin:comments -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="comment">
                            <h3>Discussion</h3>
                            <ul class="comments list-unstyled">
                                <li class="clearfix">
                                    <img src="img/avatar.png" class="avatar" alt="danish personal blog and magazine template">
                                    <div class="post-comments">
                                        <p class="meta">Dec 18, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                            Etiam a sapien odio, sit amet
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end:comments -->

                <hr>
                <!-- begin:post-comment -->
                <div class="row">
                    <div class="col-md-12">
                        <h3>Post Comment</h3>
                        <form class="comment-form">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">

                                    <input type="text" class="form-control" placeholder="Enter Your Name : ">
                                    <input type="email" class="form-control" placeholder="Enter Your Email : ">
                                    <input type="text" class="form-control" placeholder="Enter Your URL : ">
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <textarea class="form-control" rows="4" placeholder="Type Your Comment : "></textarea>
                                    <input type="submit" class="btn btn-info btn-lg btn-block">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- end:post-comment -->
            </div>
            <!-- end:article -->

            <!-- begin:sidebar -->
            <div class="col-md-4 col-sm-4 sidebar">
                <div class="widget-sidebar">
                    <h3>Search</h3>
                    <form id="search" class="navbar-form search" role="search">
                        <input type="search" class="form-control input-lg" placeholder="Type your keyword">
                        <button type="submit" class="btn btn-info btn-search"><i class="fa fa-arrow-right"></i></button>
                    </form>
                </div>

                <div class="widget-sidebar default_widget">
                    <h3>Link</h3>
                    <ul>
                        <li><a href="#">Lorem ipsum dolor sit</a></li>
                        <li><a href="#">Lorem ipsum sit</a></li>
                        <li><a href="#">Lorem ipsum</a></li>
                        <li><a href="#">Lorem ipsum dolor</a></li>
                        <li><a href="#">Lorem ipsum dolor sit</a></li>
                    </ul>
                </div>

                <div class="widget-sidebar default_widget">
                    <h3>Text Widget</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in.</p>
                </div>

            </div>
            <!-- end:sidebar -->

        </div>
    </div>
</section>
<!-- end:content -->

<!-- begin:partner -->
<section id="partner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="list-unstyled brand-img">
                    <li>
                        <a href="#"><img src="img/partner01.png"></a>
                    </li>
                    <li>
                        <a href="#"><img src="img/partner02.png"></a>
                    </li>
                    <li>
                        <a href="#"><img src="img/partner01.png"></a>
                    </li>
                    <li>
                        <a href="#"><img src="img/partner02.png"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- end:partner -->
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
