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

        <%            String un = "";
            String pw = "";
            String check = "";
            if (request.getCookies() != null) {
                Cookie c_list[] = request.getCookies();

                for (Cookie c : c_list) {

                    if (c.getName().equals("login")) {
                        un = c.getValue().split(",")[0];
                        pw = c.getValue().split(",")[1];
                        check = c.getValue().split(",")[2];
                    }

                }
            }
        %>

        <!--================Login Box Area =================-->
        <section class="login_box_area section-margin">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <div class="hover">
                                <h4>New to our website?</h4>
                                <p>There are advances being made in science and technology everyday, and a good example of this is the</p>
                                <a class="button button-account" href="register.jsp">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6" >
                        <div class="login_form_inner">
                            <h3>Log in to enter</h3>
                            <%                                if (request.getParameter("error") != null) {
                            %>
                            <div class="alert alert-danger alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Warning!</strong> <%=request.getParameter("error")%>
                            </div>
                            <%
                                   
                                }
                            %>
                            <form class="row login_form" action="UserLogin" method="post" id="contactForm" >
                                <div class="col-md-12 form-group">
                                    <input type="text" required="true" class="form-control" id="name" name="email" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'" value="<%=un%>">
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" required="true" class="form-control" id="name" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" value="<%=pw%>">
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account">
                                        <input name="check" type="checkbox" value="remember-me"<%=("remember-me".equals(check) ? "checked" : "")%>> Remember me
                                    </div>
                                </div>
                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" class="button button-login w-100">Log In</button>
                                    <a class="pull-right text-muted" href="forgetpassword.jsp" id="olvidado">Forgot your password?</a>
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

