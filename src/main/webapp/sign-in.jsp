<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<body>
<div class="container">
    <div class="text">
        Sign In
    </div>
    <form action="${pageContext.request.contextPath}/sign-in" method="get">
        <div class="form-row">
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
