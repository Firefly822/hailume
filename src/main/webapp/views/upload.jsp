<%--
  Created by IntelliJ IDEA.
  User: liming_liu
  Date: 14-10-11
  Time: 上午11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload File Request Page</title>
</head>
<body>

<form method="POST" action="/ajax/upload/file" enctype="multipart/form-data">
    File to upload: <input type="file" name="file"><br />
    Name: <input type="text" name="name"><br /> <br />
    <input type="submit" value="Upload"> Press here to upload the file!
</form>

<%--<form method="POST" action="uploadMultipleFile" enctype="multipart/form-data">--%>
    <%--File1 to upload: <input type="file" name="file"><br />--%>
    <%--Name1: <input type="text" name="name"><br /> <br />--%>
    <%--File2 to upload: <input type="file" name="file"><br />--%>
    <%--Name2: <input type="text" name="name"><br /> <br />--%>
    <%--<input type="submit" value="Upload"> Press here to upload the file!--%>
<%--</form>--%>

</body>
</html>