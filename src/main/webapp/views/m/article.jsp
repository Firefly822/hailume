<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="utf-8">
  <link rel="shortcut icon" href="/static/img/favicon.png">

  <title>${article.title} —— 还撸么，宅乐园</title>

  <!-- Bootstrap core CSS -->
  <link href="/static/css/bootstrap.css" rel="stylesheet">

  <link href="/static/css/style.css" rel="stylesheet">
  <link href="/static/app/css/article.css" rel="stylesheet">
</head>
<body>

<!-- begin:content -->
<section id="content" style="padding: 20px 0;">
  <div class="container">
    <div class="row">
      <!-- begin:article -->
      <div class="col-md-8 col-sm-8">
        <div class="row">
          <div class="col-md-12 post-single">
            <div class="heading-title">
              <h2><a href="javascript:;">${article.title}</a></h2>
            </div>
            <div class="post-meta">
              <span><em><a href="javascript:;">${article.authorName}</a> 发表</em></span>
              <span><em>编辑于 <s:formatDate value="${article.addTime}" type="date" /></em></span>
            </div>
            <div style="text-align: center;">
              ${article.content}
            </div>
          </div>
        </div>

        <hr>

      </div>
      <!-- end:article -->

    </div>
  </div>
</section>
<!-- end:content -->

</body>
</html>