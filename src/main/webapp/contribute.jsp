<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 01.07.2024
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main-menu</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0; /* Optional: Set a background color */
        }

        .button {
            position: relative;
            width: 120px;
            height: 40px;
            background-color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            border: none;
            padding: 12px;
            gap: 12px;
            border-radius: 8px;
            cursor: pointer;
            margin: 10px;
            text-decoration: none;
        }

        .button a {
            text-decoration: none;
            color: white;
            display: block;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .button::before {
            content: '';
            position: absolute;
            inset: 0;
            left: -4px;
            top: -1px;
            margin: auto;
            width: 128px;
            height: 48px;
            border-radius: 10px;
            background: linear-gradient(-45deg, #3b75dd 0%, #cd4b09 100%);
            z-index: -10;
            pointer-events: none;
            transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .button::after {
            content: "";
            z-index: -1;
            position: absolute;
            inset: 0;
            background: linear-gradient(-45deg, #3b75dd 0%, #cd4b09 100%);
            transform: translate3d(0, 0, 0) scale(0.95);
            filter: blur(20px);
        }

        .button:hover::after {
            filter: blur(30px);
        }

        .button:hover::before {
            transform: rotate(-180deg);
        }

        .button:active::before {
            scale: 0.7;
        }
    </style>
</head>
<body>
<div style="display: flex">
    <button class="button">
        <a href="${pageContext.request.contextPath}/add-book.jsp">Add book</a>
    </button>

    <button class="button">
        <a href="/user-books">My books</a>
    </button>
</div>
</body>
</html>
