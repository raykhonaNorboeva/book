<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Books</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>


    .search-inputs {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 30px;
    }

    .input-container {
        position: relative;
        margin: 50px auto;
        width: 200px;
    }

    .input-container input[type="text"] {
        font-size: 20px;
        width: 100%;
        border: none;
        border-bottom: 2px solid #ccc;
        padding: 5px 0;
        background-color: transparent;
        outline: none;
    }

    .input-container .label {
        position: absolute;
        top: 0;
        left: 0;
        color: #ccc;
        transition: all 0.3s ease;
        pointer-events: none;
    }

    .input-container input[type="text"]:focus ~ .label,
    .input-container input[type="text"]:valid ~ .label {
        top: -20px;
        font-size: 16px;
        color: #333;
    }

    .input-container .underline {
        position: absolute;
        bottom: 0;
        left: 0;
        height: 2px;
        width: 100%;
        background-color: #333;
        transform: scaleX(0);
        transition: all 0.3s ease;
    }

    .input-container input[type="text"]:focus ~ .underline,
    .input-container input[type="text"]:valid ~ .underline {
        transform: scaleX(1);
    }

    .cssbuttons-io {
        position: relative;
        font-family: inherit;
        font-weight: 600;
        font-size: 17px;
        border-radius: 0.8em;
        cursor: pointer;
        border: none;
        background: linear-gradient(to right, #00bf63, #5ce1e6);
        color: ghostwhite;
        overflow: hidden;
    }

    .cssbuttons-io svg {
        width: 1.2em;
        height: 1.2em;
        margin-left: 0.7em;
        stroke-width: 2px;
    }

    .cssbuttons-io span {
        position: relative;
        z-index: 10;
        transition: color 0.4s;
        display: inline-flex;
        align-items: center;
        padding: 0.8em 0.9em 0.8em 1.02em;
    }

    .cssbuttons-io::before,
    .cssbuttons-io::after {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0;
    }

    .cssbuttons-io::before {
        content: "";
        background: #000;
        width: 120%;
        left: -10%;
        transform: skew(30deg);
        transition: transform 0.4s cubic-bezier(0.3, 1, 0.8, 1);
    }

    .cssbuttons-io:hover::before {
        transform: translate3d(100%, 0, 0);
    }

    .cssbuttons-io:active {
        transform: scale(0.95);
    }

    /* Demo Code: */
    body {
        font-family: 'Open Sans', arial, sans-serif;
        color: #333;
        font-size: 14px;
    }

    /*.projcard-container {*/
    /*    margin: 50px 0;*/
    /*}*/

    /* Actual Code: */
    .projcard-container,
    .projcard-container * {
        box-sizing: border-box;
    }

    .projcard-container {
        margin-left: auto;
        margin-right: auto;
        width: 1000px;
    }

    .projcard {
        position: relative;
        width: 100%;
        height: 400px;
        margin-bottom: 40px;
        border-radius: 10px;
        background-color: #fff;
        border: 2px solid #ddd;
        font-size: 18px;
        overflow: hidden;
        cursor: pointer;
        box-shadow: 0 4px 21px -12px rgba(0, 0, 0, .66);
        transition: box-shadow 0.2s ease, transform 0.2s ease;
    }

    .projcard:hover {
        box-shadow: 0 34px 32px -33px rgba(0, 0, 0, .18);
        transform: translate(0px, -3px);
    }

    .projcard::before {
        content: "";
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-image: linear-gradient(-70deg, #424242, transparent 50%);
        opacity: 0.07;
    }

    .projcard:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #424242, transparent 50%);
    }

    .projcard-innerbox {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
    }

    .projcard-img {
        position: absolute;
        object-fit: contain;
        height: 400px;
        width: 400px;
        top: 0;
        left: 0;
        transition: transform 0.2s ease;
    }

    .projcard:nth-child(2n) .projcard-img {
        left: initial;
        right: 0;
    }

    .projcard:hover .projcard-img {
        transform: scale(1.05) rotate(1deg);
    }

    .projcard:hover .projcard-bar {
        width: 70px;
    }

    .projcard-textbox {
        position: absolute;
        top: 4%;
        bottom: 7%;
        left: 430px;
        width: calc(100% - 470px);
        font-size: 17px;
    }

    .projcard:nth-child(2n) .projcard-textbox {
        left: initial;
        right: 430px;
    }

    .projcard-textbox::before,
    .projcard-textbox::after {
        content: "";
        position: absolute;
        display: block;
        background: #ff0000bb;
        background: #fff;
        top: -20%;
        left: -55px;
        height: 140%;
        width: 60px;
        transform: rotate(8deg);
    }

    .projcard:nth-child(2n) .projcard-textbox::before {
        display: none;
    }

    .projcard-textbox::after {
        display: none;
        left: initial;
        right: -55px;
    }

    .projcard:nth-child(2n) .projcard-textbox::after {
        display: block;
    }

    .projcard-textbox * {
        position: relative;
    }

    .projcard-title {
        font-family: 'Voces', 'Open Sans', arial, sans-serif;
        font-size: 24px;
    }

    .projcard-subtitle {
        font-family: 'Voces', 'Open Sans', arial, sans-serif;
        color: #888;
        margin: 10px 0px;
    }

    .projcard-bar {
        left: -2px;
        width: 50px;
        height: 5px;
        margin: 10px 0;
        border-radius: 5px;
        background-color: #424242;
        transition: width 0.2s ease;
    }

    .projcard-blue .projcard-bar {
        background-color: #0088FF;
    }

    .projcard-blue::before {
        background-image: linear-gradient(-70deg, #0088FF, transparent 50%);
    }

    .projcard-blue:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #0088FF, transparent 50%);
    }

    .projcard-red .projcard-bar {
        background-color: #D62F1F;
    }

    .projcard-red::before {
        background-image: linear-gradient(-70deg, #D62F1F, transparent 50%);
    }

    .projcard-red:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #D62F1F, transparent 50%);
    }

    .projcard-green .projcard-bar {
        background-color: #40BD00;
    }

    .projcard-green::before {
        background-image: linear-gradient(-70deg, #40BD00, transparent 50%);
    }

    .projcard-green:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #40BD00, transparent 50%);
    }

    .projcard-yellow .projcard-bar {
        background-color: #F5AF41;
    }

    .projcard-yellow::before {
        background-image: linear-gradient(-70deg, #F5AF41, transparent 50%);
    }

    .projcard-yellow:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #F5AF41, transparent 50%);
    }

    .projcard-orange .projcard-bar {
        background-color: #FF5722;
    }

    .projcard-orange::before {
        background-image: linear-gradient(-70deg, #FF5722, transparent 50%);
    }

    .projcard-orange:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #FF5722, transparent 50%);
    }

    .projcard-brown .projcard-bar {
        background-color: #C49863;
    }

    .projcard-brown::before {
        background-image: linear-gradient(-70deg, #C49863, transparent 50%);
    }

    .projcard-brown:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #C49863, transparent 50%);
    }

    .projcard-grey .projcard-bar {
        background-color: #424242;
    }

    .projcard-grey::before {
        background-image: linear-gradient(-70deg, #424242, transparent 50%);
    }

    .projcard-grey:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, #424242, transparent 50%);
    }

    .projcard-customcolor .projcard-bar {
        background-color: var(--projcard-color);
    }

    .projcard-customcolor::before {
        background-image: linear-gradient(-70deg, var(--projcard-color), transparent 50%);
    }

    .projcard-customcolor:nth-child(2n)::before {
        background-image: linear-gradient(-250deg, var(--projcard-color), transparent 50%);
    }

    .projcard-description {
        z-index: 10;
        font-size: 15px;
        color: #424242;
        height: 125px;
        overflow: hidden;
        text-overflow: ellipsis;
        margin: 40px 0px 50px 0;
    }

    .projcard-tagbox {
        position: absolute;
        bottom: 3%;
        font-size: 14px;
        cursor: default;
        user-select: none;
        pointer-events: none;
    }

    .projcard-tag {
        display: inline-block;
        background: #E0E0E0;
        color: #777;
        border-radius: 3px 0 0 3px;
        line-height: 26px;
        padding: 0 10px 0 23px;
        position: relative;
        margin-right: 20px;
        cursor: default;
        user-select: none;
        transition: color 0.2s;
    }

    .projcard-tag::before {
        content: '';
        position: absolute;
        background: #fff;
        border-radius: 10px;
        box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
        height: 6px;
        left: 10px;
        width: 6px;
        top: 10px;
    }

    .projcard-tag::after {
        content: '';
        position: absolute;
        border-bottom: 13px solid transparent;
        border-left: 10px solid #E0E0E0;
        border-top: 13px solid transparent;
        right: -10px;
        top: 0;
    }

    @import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");
    * {
        margin: 0;
        padding: 0;
        outline: none;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
    }


    .container {
        background: #dde1e7;
        padding: 25px;
        border-radius: 3px;
        box-shadow: -3px -3px 7px #ffffff73, 3px 3px 5px rgba(94, 104, 121, 0.288);
    }

    .pagination {
        display: flex;
        list-style: none;
    }

    .pagination li {
        flex: 1;
        margin: 0px 5px;
        background: #dde1e7;
        border-radius: 3px;
        box-shadow: -3px -3px 7px #ffffff73, 3px 3px 5px rgba(94, 104, 121, 0.288);
    }

    .pagination li a {
        font-size: 18px;
        text-decoration: none;
        color: #4d3252;
        height: 45px;
        width: 55px;
        display: block;
        line-height: 45px;
    }

    .pagination li:first-child a {
        width: 120px;
    }

    .pagination li:last-child a {
        width: 100px;
    }

    .pagination li.active {
        box-shadow: inset -3px -3px 7px #ffffff73,
        inset 3px 3px 5px rgba(94, 104, 121, 0.288);
    }

    .pagination li.active a {
        font-size: 17px;
        color: #6f6cde;
    }

    .pagination li:first-child {
        margin: 0 15px 0 0;
    }

    .pagination li:last-child {
        margin: 0 0 0 15px;
    }

    .Download-button {
        display: flex;
        align-items: center;
        font-family: inherit;
        font-weight: 500;
        font-size: 17px;
        padding: 12px 20px;
        color: white;
        background: rgb(103, 92, 156);
        border: none;
        box-shadow: 0 0.7em 1.5em -0.5em rgba(59, 48, 78, 0.527);
        letter-spacing: 0.05em;
        border-radius: 8px;
        cursor: pointer;
        position: relative;
    }

    .Download-button svg {
        margin-right: 8px;
        width: 25px;
    }

    .Download-button:hover {
        box-shadow: 0 0.5em 1.5em -0.5em rgba(88, 71, 116, 0.627);
    }

    .Download-button:active {
        box-shadow: 0 0.3em 1em -0.5em rgba(88, 71, 116, 0.627);
    }

    .Download-button::before {
        content: "";
        width: 4px;
        height: 40%;
        background-color: white;
        position: absolute;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        left: 0;
        transition: all 0.2s;
    }

    .Download-button::after {
        content: "";
        width: 4px;
        height: 40%;
        background-color: white;
        position: absolute;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        right: 0;
        transition: all 0.2s;
    }

    .Download-button:hover::before,
    .Download-button:hover::after {
        height: 60%;
    }


</style>

<body>
<form action="${pageContext.request.contextPath}/search-book" method="get">
    <div class="search-inputs">
        <div class="input-container">
            <input type="text" id="title" name="title">
            <label for="title" class="label">Title</label>
            <div class="underline"></div>
        </div>
        <div class="input-container">
            <input type="text" id="genre" name="genre">
            <label for="genre" class="label">Genre</label>
            <div class="underline"></div>
        </div>
        <div class="input-container">
            <input type="text" id="author" name="author">
            <label for="author" class="label">Author</label>
            <div class="underline"></div>
        </div>
        <button class="cssbuttons-io">
  <span>
    Start Finding
    <svg
            viewBox="0 0 19.9 19.7"
            xmlns="http://www.w3.org/2000/svg"
            role="img"
            aria-labelledby="title desc"
            class="svg-icon search-icon"
    >
      <title>Search Icon</title>
      <desc id="desc">A magnifying glass icon.</desc>
      <g stroke="white" fill="none" class="search-path">
        <path d="M18.5 18.3l-5.4-5.4" stroke-linecap="square"></path>
        <circle r="7" cy="8" cx="8"></circle>
      </g>
    </svg>
  </span>
        </button>
    </div>

</form>
<br/>
<h1 style="text-align: center">List of Books</h1>
<div class="book-container">
    <h1>${pageContext.request.contextPath}</h1>
    <c:forEach var="book" items="${books}">
        <div class="projcard-container">
            <div class="projcard projcard-customcolor" style="--projcard-color: #F5AF41;">
                <div class="projcard-innerbox">
                    <img class="projcard-img" src="/pics/${book.picturePath}" alt="${book.title}"/>
                    <div class="projcard-textbox">
                        <div class="projcard-title">${book.title}</div>
                        <div class="projcard-subtitle">Author: ${book.author}</div>
                        <div class="projcard-subtitle">Genre: ${book.genre}</div>
                        <div class="projcard-bar"></div>
                        <div class="projcard-description">${book.description}.
                        </div>
                        <form action="${pageContext.request.contextPath}/download">
                            <input type="hidden" name="bookPath" value="${book.bookPath}">
                            <button class="Download-button">
                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        height="16"
                                        width="20"
                                        viewBox="0 0 640 512"
                                >
                                    <path
                                            d="M144 480C64.5 480 0 415.5 0 336c0-62.8 40.2-116.2 96.2-135.9c-.1-2.7-.2-5.4-.2-8.1c0-88.4 71.6-160 160-160c59.3 0 111 32.2 138.7 80.2C409.9 102 428.3 96 448 96c53 0 96 43 96 96c0 12.2-2.3 23.8-6.4 34.6C596 238.4 640 290.1 640 352c0 70.7-57.3 128-128 128H144zm79-167l80 80c9.4 9.4 24.6 9.4 33.9 0l80-80c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-39 39V184c0-13.3-10.7-24-24-24s-24 10.7-24 24V318.1l-39-39c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9z"
                                            fill="white"
                                    ></path>
                                </svg>
                                <span>Download</span>
                            </button>
                            <%--<a href="${pageContext.request.contextPath}/download?bookPath=${book.bookPath}" target="_blank">Download</a>--%>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<div style=" display: grid; place-items: center;text-align: center;padding: 30px">
    <div class="container">
        <ul class="pagination">
            <c:if test="${currentPage > 1}">
                <li>
                    <a href="search-book?title=${param.title}&genre=${param.genre}&author=${param.author}&page=${currentPage - 1}">Previous</a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                <c:choose>
                    <c:when test="${currentPage == loop.index}">
                        <li>
                            <a href="search-book?title=${param.title}&genre=${param.genre}&author=${param.author}&page=${loop.index}"
                               class="active">${loop.index}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="search-book?title=${param.title}&genre=${param.genre}&author=${param.author}&page=${loop.index}">${loop.index}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li>
                    <a href="search-book?title=${param.title}&genre=${param.genre}&author=${param.author}&page=${currentPage + 1}">Next</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
</body>
</html>
<script>
    // This adds some nice ellipsis to the description:
    document.querySelectorAll(".projcard-description").forEach(function (box) {
        $clamp(box, {clamp: 6});
    });

    $("li").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    });


</script>



