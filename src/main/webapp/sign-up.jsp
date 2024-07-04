<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 29.06.2024
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<body>
<div class="container">
    <div class="text">
        Sign Up
    </div>
    <form action="${pageContext.request.contextPath}/sign-up" method="post">
        <div class="form-row">
            <div class="input-data">
                <input type="text" name="name" required>
                <div class="underline"></div>
                <label for="">Name</label>
            </div>
            <div class="input-data">
                <input type="text" name="username" required>
                <div class="underline"></div>
                <label for="">Username</label>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
                <input type="password" name="password" required>
                <div class="underline"></div>
                <label for="">Password</label>
            </div>

        </div>
        <div class="form-row submit-btn">
            <div class="input-data">
                <div class="inner"></div>
                <input type="submit" value="submit">
            </div>
        </div>
    </form>
</div>
</body>
</html>
