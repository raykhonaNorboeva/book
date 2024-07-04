<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add book</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<body>
<style>
    .cssbuttons-io-button {
        display: flex;
        align-items: center;
        font-family: inherit;
        font-weight: 500;
        font-size: 17px;
        padding: 0.8em 1.5em 0.8em 1.2em;
        color: white;
        background: #ad5389;
        background: linear-gradient(0deg, rgb(120, 47, 255) 0%, rgb(185, 132, 255) 100%);
        border: none;
        box-shadow: 0 0.7em 1.5em -0.5em rgb(184, 146, 255);
        letter-spacing: 0.05em;
        border-radius: 20em;
    }

    .cssbuttons-io-button svg {
        margin-right: 8px;
    }

    .cssbuttons-io-button:hover {
        box-shadow: 0 0.5em 1.5em -0.5em rgb(149, 91, 255);
    }

    .cssbuttons-io-button:active {
        box-shadow: 0 0.3em 1em -0.5em rgb(160, 109, 255);
    }
</style>

<!--<c:if test="${not empty requestScope.message}">-->
<!--    <h1>${requestScope.message}</h1>-->
<!--</c:if>-->


<div class="container">
    <div class="text">Add new book</div>
    <form action="${pageContext.request.contextPath}/add-book" method="post" enctype="multipart/form-data">
        <div class="form-row">
            <div class="input-data">
                <input type="text" id="title" name="title" required>
                <div class="underline"></div>
                <label for="title">Title:</label><br>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
                <input type="text" id="description" name="description" required>
                <div class="underline"></div>
                <label for="description">Description:</label><br>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
                <input type="text" id="author" name="author" required>
                <div class="underline"></div>
                <label for="author">Author:</label><br>
            </div>
        </div>

        <div class="form-row">
            <div class="input-data">
                <label for="genre">Genre:</label><br>
                <select id="genre" name="genre" required>
                    <option value="ФАНТАСТИКА">ФАНТАСТИКА</option>
                    <option value="МИСТИКА">МИСТИКА</option>
                    <option value="ПРИКЛЮЧЕНЧЕСКИЙ">ПРИКЛЮЧЕНЧЕСКИЙ</option>
                    <option value="ДЕТЕКТИВ">ДЕТЕКТИВ</option>
                    <option value="ЭКШН">ЭКШН</option>
                    <option value="РОМАН">РОМАН</option>
                    <option value="ДОКУМЕНТАЛЬНЫЙ">ДОКУМЕНТАЛЬНЫЙ</option>
                    <option value="ЛИРИКА">ЛИРИКА</option>
                    <option value="УЖАСТИК">УЖАСТИК</option>
                    <option value="КЛАССИКА">КЛАССИКА</option>
                    <option value="ДРАМА">КЛАССИКА</option>
                </select>
            </div>
        </div>

       <%-- <div style="padding: 20px;">
            <label for="picPath">Picture:</label><br>
            <input type="file" id="picPath" name="image" class="orange-button" required>
        </div>

        <div style="padding: 20px;">
            <label for="file">File:</label><br>
            <input type="file" id="file" name="file" class="orange-button" required><br><br>
        </div>--%>
        <div style="padding: 20px;">
            <label for="picPath">Picture:</label><br>
            <input type="file" id="picPath" name="image" required style="display:none;">
            <button type="button" class="orange-button" onclick="document.getElementById('picPath').click();">Upload Picture</button>
        </div>

        <div style="padding: 20px;">
            <label for="file">File:</label><br>
            <input type="file" id="file" name="file" required style="display:none;">
            <button type="button" class="orange-button" onclick="document.getElementById('file').click();">Upload File</button>
        </div>

        <div style="padding: 20px;  display: flex;  align-items: center;  justify-content: space-evenly;">
            <button class="cssbuttons-io-button">
                <svg viewBox="0 0 640 512" fill="white" height="1em" xmlns="http://www.w3.org/2000/svg">
                    <path d="M144 480C64.5 480 0 415.5 0 336c0-62.8 40.2-116.2 96.2-135.9c-.1-2.7-.2-5.4-.2-8.1c0-88.4 71.6-160 160-160c59.3 0 111 32.2 138.7 80.2C409.9 102 428.3 96 448 96c53 0 96 43 96 96c0 12.2-2.3 23.8-6.4 34.6C596 238.4 640 290.1 640 352c0 70.7-57.3 128-128 128H144zm79-217c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l39-39V392c0 13.3 10.7 24 24 24s24-10.7 24-24V257.9l39 39c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-80-80c-9.4-9.4-24.6-9.4-33.9 0l-80 80z"></path>
                </svg>
                <span>Upload</span>
            </button>


            <a href="/contribute.jsp">
                <span>Back</span>
            </a>

        </div>
    </form>
</div>

</body>
</html>

