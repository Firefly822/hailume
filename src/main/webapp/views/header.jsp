<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- begin:navbar -->
<nav class="navbar navbar-default navbar-transparent navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/">
                <i class="fa fa-recycle"></i> <span>还撸</span>么.
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-top">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/">首页</a></li>
                <c:if test="${index}">
                    <li><a href="#portfolio">关于我们</a></li>
                </c:if>

                <c:if test="${userNickName != null && fn:length(userNickName) > 0}">
                    <li class="dropdown" id="userIcon">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;" id="navLogout">${userNickName}</a>
                        <div class="dropdown-menu" style="padding:17px;">
                            <form>
                                <button type="button" style="margin-bottom: 5px;" id="btnLogout" class="btn">退出登录</button>
                            </form>
                        </div>
                    </li>
                </c:if>
                <c:if test="${userNickName == null || fn:length(userNickName) == 0}">
                    <li class="dropdown" id="userIcon">
                        <a class="dropdown-toggle" href="javascript:;" data-toggle="dropdown" id="navLogin">登录/注册</a>
                        <div class="dropdown-menu" style="padding:17px;">
                            <form id="formLogin" class="form">
                                <label>登录</label>
                                <input name="username" style="margin-bottom: 5px;" id="username" type="text" placeholder="用户名" pattern="^[a-z,A-Z,0-9,_]{6,15}$" data-valid-min="6" title="Enter your username" required="">
                                <input name="password" style="margin-bottom: 5px;" id="password" type="password" placeholder="密码" title="Enter your password" required=""><br>
                                <button type="button" style="margin-bottom: 5px;" id="btnLogin" class="btn">登录</button>
                            </form>
                            <form><a href="javascript:;" title="新用户注册" id="btnNewUser" data-toggle="collapse" data-target="#formRegister" class="">点此注册</a></form>
                            <form id="formRegister" class="form collapse" style="height: auto;">
                                <input name="username" style="margin-bottom: 5px;" id="inputUsername" type="text" placeholder="登录名" pattern="^[a-z,A-Z,0-9,_]{6,15}$" data-valid-min="6" title="Choose a username" required=""><br>
                                <input name="password" style="margin-bottom: 5px;" id="inputpassword" type="password" placeholder="密码" required="">
                                <input name="verify" style="margin-bottom: 5px;" id="inputVerify" type="password" placeholder="再输一遍密码" required=""><br>
                                <input name="nickname" style="margin-bottom: 5px;" id="inputNickname" type="text" placeholder="你的大名（昵称）" required="">
                                <button type="button" style="margin-bottom: 5px;" id="btnRegister" class="btn">注册</button>
                            </form>
                        </div>
                    </li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- end:navbar -->

<!-- begin:header -->
<section id="header" style="background: url(http://7oxg65.com1.z0.glb.clouddn.com/static/img/header.jpg) center center;">
    <div class="overlay"></div>
</section>
<!-- end:header -->
