<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 29.06.2024
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/search-book" method="get">
<input type="text" name="title" placeholder="title">
<input type="text" name="genre" placeholder="genre">
<input type="text" name="author" placeholder="author">
<button> Search </button>
</form>

</body>
</html>
