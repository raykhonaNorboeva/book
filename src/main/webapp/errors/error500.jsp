<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 29.06.2024
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${pageContext.request.getAttribute("jakarta.servlet.error.exception").message}</h1>
<a href="${pageContext.request.getAttribute("jakarta.servlet.error.request_uri")}">Back To Page</a>
</body>
</html>
