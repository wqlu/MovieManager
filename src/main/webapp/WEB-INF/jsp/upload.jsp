<%--
  Created by IntelliJ IDEA.
  User: lu
  Date: 18-3-7
  Time: 下午8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="./file/fileupload.do" method="post" enctype="multipart/form-data">
        <label>文件上传</label>
        <input type="file" name="file">
        <input type="submit" value="提交">
    </form>

</body>
</html>
