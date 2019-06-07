<%-- 
    Document   : category
    Created on : Mar 27, 2019, 8:52:11 AM
    Author     : Nano Foxy Dev - 01
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.controller.action.LoadCategory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Category</title>
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

        <style>
            .wrapper{
                margin: 60px auto;
                text-align: center;
            }
            h1{
                margin-bottom: 1.25em;
            }
            #pagination-demo{
                display: inline-block;
                margin-bottom: 1.75em;
            }
            #pagination-demo li{
                display: inline-block;
            }

            .page-content{
                background: #eee;
                display: inline-block;
                padding: 10px;
                width: 100%;
                max-width: 660px;
            }
        </style>

    </head>

    <body onload="SelectCategoryAll">

        <!--================ Start Header Menu Area =================-->
        <%@include file="include/header.jsp"%>

        <!--================ End Header Menu Area =================-->

        <!-- ================ start banner area ================= -->	
        <section class="blog-banner-area" id="category">
            <div class="container h-100">
                <div class="blog-banner">
                    <div class="text-center">
                        <h1>Shop Category</h1>
                        <nav aria-label="breadcrumb" class="banner-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ end banner area ================= -->


        <!-- ================ category section start ================= -->	

        <section class="section-margin--small mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-4 col-md-5">
                        <div class="sidebar-categories" id="loadcategoey">
                            <div class="head">Browse Categories</div>
                            <ul class="main-categories">
                                <li class="common-filter">
                                    <form action="">
                                        <ul>
                                            <li class="filter-list"><a href="LoadCategory"><label for="men">All</label></a></li>

                                            <%                                                HttpSession hs = request.getSession();
                                                JSONArray jsonArray = new JSONArray(hs.getAttribute("jsonArray").toString());

                                                for (int i = 0; i < jsonArray.length(); i++) {
                                                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                                                    if (i == 0) {
                                                        boolean result = jsonObject.getBoolean("result");
                                                    } else {
                                            %>
                                            <li class="filter-list"><a href="SelectCategory?id=<%=jsonObject.getInt("id")%>"><label for="men"><%=jsonObject.getString("name")%></label></a></li>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                        </ul>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8 col-md-7">

                        <!-- Start Best Seller -->
                        <section class="lattest-product-area pb-40 category-list">
                            <div class="row content_update">
                                <%
                                    try {
                                        JSONArray jsonArrays = null;
                                        if (hs.getAttribute("jsonArraySelectProduct") != null) {
                                            jsonArrays = new JSONArray(hs.getAttribute("jsonArraySelectProduct").toString());
                                        } else {
                                            jsonArrays = new JSONArray(hs.getAttribute("jsonArrayProduct").toString());
                                        }
                                        System.out.println("Size : " + jsonArrays.length());
                                        for (int i = 0; i < jsonArrays.length(); i++) {
                                            JSONObject jsonObject = jsonArrays.getJSONObject(i);
                                            if (i == 0) {
                                                boolean result = jsonObject.getBoolean("result");
                                            } else {
                                                System.out.println("p_price : - " + jsonObject.getDouble("price"));
                                %>
                                <div class="col-md-6 col-lg-4" id="<%=jsonObject.getInt("id")%>">
                                    <div class="card text-center card-product">
                                        <div class="card-product__img">
                                            <img class="card-img" src="img/product/product1.png" alt="">
                                            <ul class="card-product__imgOverlay">
                                                <a href="SingleProductView?product=<%=jsonObject.getInt("id")%>"><button class="btn btn-info"> Buy Now</button></a>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <p>Accessories</p>
                                            <h4 class="card-product__title"><a href="#"><%=jsonObject.getString("name")%></a></h4>
                                            <p class="card-product__price"><%=jsonObject.getDouble("price")%></p>
                                        </div>
                                    </div>
                                </div>
                                <%
                                                System.out.println("p_name01 : - " + jsonObject.getString("name"));
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                            </div>
                        </section>
                        <!-- End Best Seller -->



                    </div>
                </div>
            </div>
        </section>
        <!-- ================ category section end ================= -->		  





        <!--================ Start footer Area  =================-->	
        <%@include file="include/footer.jsp"%>

        <!--================ End footer Area  =================-->


        <script>
            var xmlHTTP;
            function createXMLHTTPRequest() {
                if (window.XMLHttpRequest) {
                    xmlHTTP = new XMLHttpRequest();
                } else {
                    xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
                }

            }
            function SelectCategory(ID) {
                createXMLHTTPRequest();
                xmlHTTP.onreadystatechange = function () {
                    if (xmlHTTP.readyState == 4 & xmlHTTP.status == 200) {

                        var sta = xmlHTTP.responseText;
                       
                   }

                };

                xmlHTTP.open("POST", "SelectCategory", true);
                xmlHTTP.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xmlHTTP.send("id=" + ID);
            }

            function SelectCategoryAll() {
                createXMLHTTPRequest();
                xmlHTTP.onreadystatechange = function () {
                    if (xmlHTTP.readyState == 4 & xmlHTTP.status == 200) {

                        var sta = xmlHTTP.responseText;
                    }

                };

                xmlHTTP.open("POST", "LoadCategory", true);
                xmlHTTP.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xmlHTTP.send();
            }
        </script>

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="vendors/skrollr.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="vendors/nouislider/nouislider.min.js"></script>
        <script src="vendors/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/mail-script.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
