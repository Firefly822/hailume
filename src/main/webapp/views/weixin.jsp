<%--
  Created by IntelliJ IDEA.
  User: liming_liu
  Date: 16/6/23
  Time: 下午10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Weixin Page</title>
  <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>
    <p>appId: "${appId}"</p>
    <p>timestamp: ${timestamp}</p>
    <p>nonceStr: "${nonceStr}"</p>
    <p>signature: "${signature}"</p>
</body>
<script>
  wx.config({
    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: "${appId}", // 必填，公众号的唯一标识
    timestamp: ${timestamp}, // 必填，生成签名的时间戳
    nonceStr: "${nonceStr}", // 必填，生成签名的随机串
    signature: "${signature}",// 必填，签名，见附录1
    jsApiList: [] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
  });
</script>
</html>
