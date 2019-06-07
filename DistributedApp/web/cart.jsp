<%-- 
    Document   : cart
    Created on : Mar 27, 2019, 8:52:43 AM
    Author     : Nano Foxy Dev - 01
--%>

<%@page import="com.controller.javasrc.CartItem"%>
<%@page import="com.controller.javasrc.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Cart</title>
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
                        <h1>Shopping Cart</h1>
                        <nav aria-label="breadcrumb" class="banner-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ end banner area ================= -->



        <!--================Cart Area =================-->
        <section class="cart_area">
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Remove</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                                   
                                    HttpSession hs = request.getSession();
                                    double tot = 0;
                                    int qty = 0;
                                    if (hs.getAttribute("mycart") != null) {
                                        Cart cart = (Cart) hs.getAttribute("mycart");
                                        List<CartItem> cartItems = cart.getMyCart();

                                        for (CartItem ci : cartItems) {
                                            Double pr = ci.getPrice();
                                %>

                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="img/cart/cart1.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <p><%=ci.getPname()%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>Rs.<%=ci.getPrice()%>0</h5>
                                    </td>
                                    <td>

                                        <div class="input-group number-spinner">
                                            <div class="input-group number-spinner">
                                                <span class="input-group-btn">
                                                    <button id="btnm1" onclick="goqtydown(<%=ci.getPid()%>, 'qty<%=ci.getPid()%>')" class="btn btn-default" data-dir="dwn"><span class="ti-minus"></span></button>
                                                </span>
                                                <input name="quantity" max="10" min="1" id="qty<%=ci.getPid()%>" type="number" class="text-center" value="<%=ci.getQty()%>" disabled>
                                                <span class="input-group-btn">
                                                    <button id="btnp" onclick="goqtyup(<%=ci.getPid()%>, 'qty<%=ci.getPid()%>',<%=12%>)" class="btn btn-default" data-dir="up"><span class="ti-plus"></span></button>
                                                </span>

                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <%
                                            double p = ci.getPrice();
                                            int q = ci.getQty();
                                            double tott = p * q;
                                        %>
                                        <h5>Rs.<%=tott%>0</h5>
                                    </td>
                                    <td>
                                        <button onclick="deleteCartItem(<%= ci.getPid()%>,<%=ci.getQty()%>)">
                                            <span class="ti-trash"> </span>
                                        </button>
                                    </td>
                                </tr>
                            <script>
                                var xmlHTTP;
                                function createXMLHTTPRequest() {
                                    if (window.XMLHttpRequest) {
                                        xmlHTTP = new XMLHttpRequest();
                                    } else {
                                        xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
                                    }

                                }
                                function deleteCartItem(ID, QTY) {
                                    createXMLHTTPRequest();
                                    xmlHTTP.onreadystatechange = function () {
                                        if (xmlHTTP.readyState == 4 & xmlHTTP.status == 200) {

                                            var sta = xmlHTTP.responseText;

                                        }

                                    };

                                    var nowqty2 = Number($('#cou2').html());
                                    var totz2 = nowqty2 - QTY;
                                    $('#cou2').html(totz2);
                                    location.reload();

                                    xmlHTTP.open("POST", "DeleteCartItems", true);
                                    xmlHTTP.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                    xmlHTTP.send("pid=" + ID + "&qty=" + QTY);
                                }
                            </script>
                            <%
                                        tot += ci.getQty() * ci.getPrice();
                                        qty += ci.getQty();
                                    }
                                }
                            %>

                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>Rs.<%=tot%>0</h5>

                                </td>
                                <td>

                                </td>
                            </tr>

                            <tr class="out_button_area">
                                <td class="d-none-l">

                                </td>
                                <td class="">

                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="category.jsp">Continue Shopping</a>
                                        <a class="primary-btn ml-2" href="#">Proceed to checkout</a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Cart Area =================-->



        <!--================ Start footer Area  =================-->	
        <%@include file="include/footer.jsp"%>

        <!--================ End footer Area  =================-->


        <script>
            function goqtyup(proid, qtyinput, maxqty) {
                var qty = Number($('#' + qtyinput).val());
                if (qty < maxqty) {
                    var nowqty2 = Number($('#cou2').html());
                    var totz2 = nowqty2 + 1;
                    $('#cou2').html(totz2);
                    var sta = "0";

                    qty++;
                    updateQty(proid, qty, sta);
                }
                $('#' + qtyinput).val(qty);


            }

            function goqtydown(proid, qtyinput) {
                var qty = Number($('#' + qtyinput).val());
                if (qty > 1) {
                    var nowqty2 = Number($('#cou2').html());
                    var totz2 = nowqty2 - 1;
                    $('#cou2').html(totz2);
                    var sta = "1";

                    qty--;
                    updateQty(proid, qty, sta);
                }
                $('#' + qtyinput).val(qty);



            }

            function updateQty(proid, qty, sta) {
                $.ajax({type: "POST", url: "sessionUpdateQtys", data: "proid=" + proid + "&qty=" + qty + "&sta=" + sta, success: function (result) {
                        window.location.href = "cart.jsp";

                    }});
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
