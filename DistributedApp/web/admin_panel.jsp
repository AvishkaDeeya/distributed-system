<%-- 
    Document   : login
    Created on : Mar 27, 2019, 8:52:33 AM
    Author     : Nano Foxy Dev - 01
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Login</title>
        <link rel="icon" href="img/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

        <link rel="stylesheet" href="css/style.css">

        <!--alert import file-->
        <script src="dist/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
        <!--alert import file-->

    </head>
    <body>
        <!--================ Start Header Menu Area =================-->
        <%@include file="include/header.jsp"%>

        <!--================ End Header Menu Area =================-->

        <!-- ================ start banner area ================= -->	


        <!-- ================ end banner area ================= -->

        <!--================Blog Categorie Area =================-->
        <section class="blog_categorie_area">
            <div class="container">
                <div class="text-center">
                    <h1>Admin Panel</h1>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
                        <div class="categories_post">
                            <img class="card-img rounded-0" src="img/blog/cat-post/cat-post-3.jpg" alt="post">
                            <div class="categories_details">
                                <div class="categories_text">
                                    <a href="single-blog.html">
                                        <h5>Our Products</h5>
                                    </a>
                                    <div class="border_line"></div>
                                    <p>Enjoy your social life together</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
                        <div class="categories_post">
                            <img class="card-img rounded-0" src="img/blog/cat-post/cat-post-2.jpg" alt="post">
                            <div class="categories_details">
                                <div class="categories_text">
                                    <a href="single-blog.html">
                                        <h5>Our Customers</h5>
                                    </a>
                                    <div class="border_line"></div>
                                    <p>Be a part of politics</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
                        <div class="categories_post">
                            <img class="card-img rounded-0" src="img/blog/cat-post/cat-post-1.jpg" alt="post">
                            <div class="categories_details">
                                <div class="categories_text">
                                    <a href="single-blog.html">
                                        <h5>Our Supplier</h5>
                                    </a>
                                    <div class="border_line"></div>
                                    <p>Let the food be finished</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
        <!--================Blog Categorie Area =================-->

       
        <!--================ Start footer Area  =================-->	
        <%@include file="include/footer.jsp"%>

        <!--================ End footer Area  =================-->





        <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="vendors/skrollr.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="vendors/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/mail-script.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
