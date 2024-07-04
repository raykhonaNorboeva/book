<!DOCTYPE html>
<html lang="en">
<head>
    <title>Library Project - Raykhona</title>

    <!-- Meta -->
    <meta charset="utf-8">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:700|Roboto:400,400i,700&display=swap"
          rel="stylesheet">

    <!-- FontAwesome JS-->
    <script defer src="js/all.min.js"></script>

    <!-- Theme CSS -->
    <link id="theme-style" rel="stylesheet" href="css/style.css">

</head>

<body>
<header class="header">
    <div class="branding">
        <div class="container-fluid position-relative py-3">
            <div class="logo-wrapper">
                <div class="site-logo" style="display: flex;list-style-type: none;justify-content: space-between;padding:10px 35px 0 35px">
                    <a class="navbar-brand" href="/">
                        <span class="logo-text">Library</span>
                    </a>
                  <%--  <div class="text-center" style="">
                        <a style="padding: 15px" class="theme-link scrollto" href="/home.jsp">Home</a>
                        <a style="padding: 15px" class="theme-link scrollto" href="/books.jsp">Books</a>
                        <a style="padding: 15px" class="theme-link scrollto" href="/about.jsp">About</a>
                        <a style="padding: 15px" class="theme-link scrollto" href="/contact.jsp">Contact</a>
                    </div>--%>
                </div>
            </div><!--//docs-logo-wrapper-->

        </div><!--//container-->
    </div><!--//branding-->
</header><!--//header-->

<section class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-7 pt-5 mb-5 align-self-center">
                <div class="promo pe-md-3 pe-lg-5">
                    <h1 class="headline mb-3">
                        Welcome to Our Library
                    </h1><!--//headline-->
                    <div class="subheadline mb-4">
                        Download now and start selling your book right away!

                    </div><!--//subheading-->

                    <div class="cta-holder row gx-md-3 gy-3 gy-md-0">
                        <div class="col-12 col-md-auto">
                            <a class="btn btn-primary w-100"
                               href="/sign-up.jsp">Sign up</a>
                        </div>
                        <div class="col-12 col-md-auto">
                            <a class="btn btn-secondary scrollto w-100" href="/sign-in.jsp">Sign in</a>
                        </div>
                    </div><!--//cta-holder-->


                </div><!--//promo-->
            </div><!--col-->
            <div class="col-12 col-md-5 mb-5 align-self-center">
                <div class="book-cover-holder">
                    <img class="img-fluid book-cover" src="img/img.png" alt="book cover">

                </div><!--//book-cover-holder-->

</section><!--//hero-section-->


<footer class="footer">

    <div class="footer-bottom text-center py-5">

        <small class="copyright">Contact us at <a class="theme-link" href="mailto:raykhonanorboeva@gmail.com"
                                                target="_blank">Raykhona<span class="sr-only">love</span><i
                class="fas fa-heart"
                style="color: #fb866a;"></i></a></small>

    </div>

</footer>

<!-- Javascript -->
<script src="assets/plugins/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/smoothscroll.min.js"></script>

<script src="assets/js/main.js"></script>

</body>
</html>
