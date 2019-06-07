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
        <section class="blog-banner-area" id="category">
            <div class="container h-100">
                <div class="blog-banner">
                    <div class="text-center">
                        <h1>Login / Register</h1>
                        <nav aria-label="breadcrumb" class="banner-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Login/Register</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ end banner area ================= -->

        <!--================Login Box Area =================-->
        <section class="login_box_area section-margin">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <div class="hover">
                                <h4>Forgot your password?</h4>
                                <p>Email address you use to log in to your account 
                                    We'll send you an email with instructions to choose a new password.</p>
                                <a class="button button-account" href="login.jsp">Login Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6" >
                        <div class="login_form_inner">
                            <h3>Forgot your password?</h3>
                            <form class="row login_form" action="forgetpassword" method="post" id="contactForm" >
                                <div class="col-md-12 form-group">
                                    <input type="email" required="" class="form-control" id="resetemail" name="resetemail" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
                                </div>


                                <div class="col-md-12 form-group">
                                    <button onclick="forgetPassword()" class="button button-login w-100">Continue</button>
                                </div>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>

        </section>

        <!--================End Login Box Area =================-->




        <!--================ Start footer Area  =================-->	
        <%@include file="include/footer.jsp"%>

        <!--================ End footer Area  =================-->

        <script>
            var xmlHTTP;
            var checkemail;

            function createXMLHTTPRequest() {
                if (window.XMLHttpRequest) {
                    xmlHTTP = new XMLHttpRequest();
                } else {
                    xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
                }

            }
            function forgetPassword() {
                createXMLHTTPRequest();
                xmlHTTP.onreadystatechange = function () {
                    if (xmlHTTP.readyState == 4 & xmlHTTP.status == 200) {

                        var status1 = xmlHTTP.responseText;

                        if (status1 == "0") {
                            swal("This email is incorrect..");
                            return true;
                        } else if (status1 == "1") {
                            return false;
                        }


                    }
                };
                checkemail = document.getElementById('resetemail').value;
                xmlHTTP.open("POST", "forgetpassword", true);
                xmlHTTP.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xmlHTTP.send("resetemail=" + checkemail);
            }
        </script>



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
