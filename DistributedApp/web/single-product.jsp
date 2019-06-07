<%-- 
    Document   : single-product
    Created on : Mar 27, 2019, 8:52:23 AM
    Author     : Nano Foxy Dev - 01
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int prod = 0;
  
    if (request.getParameter("product") != null) {
        prod = Integer.parseInt(request.getParameter("product"));
    }



%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Product Details</title>
        <link rel="icon" href="img/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

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
        <section class="blog-banner-area" id="blog">
            <div class="container h-100">
                <div class="blog-banner">
                    <div class="text-center">
                        <h1>Shop Single</h1>
                        <nav aria-label="breadcrumb" class="banner-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Shop Single</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ end banner area ================= -->

        <%            HttpSession hs = request.getSession();
            String name = "";
            Double price = 0.0;
            String category = "";
            if (hs.getAttribute("jsonObj") != null) {

                JSONObject jsonObj = new JSONObject(hs.getAttribute("jsonObj").toString());
                System.out.println("jsonObj : +" + jsonObj);
                boolean result = jsonObj.getBoolean("result");

                if (result == Boolean.TRUE) {
                    name = jsonObj.getString("name");
                    price = jsonObj.getDouble("price");
                    category = jsonObj.getString("category");
                }

            }
        %>

        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row s_product_inner">
                    <div class="col-lg-6">
                        <div class="owl-carousel owl-theme s_Product_carousel">
                            <div class="single-prd-item">
                                <img class="img-fluid" src="img/category/s-p1.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="s_product_text">
                            <h3><%=name%></h3>
                            <h2><%=price%></h2>
                            <ul class="list">
                                <li><a class="active" href="#"><span>Category</span> : <%=category%></a></li>
                            </ul>
                            <p>Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for
                                something that can make your interior look awesome, and at the same time give you the pleasant warm feeling
                                during the winter.</p>
                            <div class="product_count">
                                <label for="qty">Quantity:</label>
                                <button onclick="var result = document.getElementById('sst');
                                        var sst = result.value;
                                        if (!isNaN(sst))
                                            result.value++;
                                        return false;"
                                        class="increase items-count" type="button"></button>
                                <input type="text" name="qty" id="Pqty" size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                                <button onclick="var result = document.getElementById('sst'); var sst = result.value; if (!isNaN(sst) & amp; & amp; sst > 0) result.value--; return false;"
                                        class="reduced items-count" type="button"></button>
                                <a onclick="addToCart(<%=prod%>)" class="button primary-btn" href="#">Add to Cart</a>                              
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->




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

            function addToCart(ID) {
                createXMLHTTPRequest();

                xmlHTTP.onreadystatechange = function () {
                    if (xmlHTTP.readyState == 4 & xmlHTTP.status == 200) {

                        var status = xmlHTTP.responseText;
                        swal("You Add to Cart", "Product Name", "success", {
                        });
                    }

                };

                var QTY = Number(document.getElementById('Pqty').value);

                var nowqty2 = Number($('#cou2').html());
                var totz2 = QTY + nowqty2;
                $('#cou2').html(totz2);

                xmlHTTP.open("post", "AddCart", true);
                xmlHTTP.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xmlHTTP.send("id=" + ID + "&qty=" + QTY);
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
