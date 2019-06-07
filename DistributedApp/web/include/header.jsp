<!--================ Start Header Menu Area =================-->
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo_h" href="index.jsp"><img src="img/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="LoadCategory">Shop Category</a></li>
                                <li class="nav-item"><a class="nav-link" href="cart.jsp">Shopping Cart</a></li>
                            </ul>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Account</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    </ul>
                   
                    <%
                        if (request.getSession().getAttribute("userID") != null) {
                             int totnow = 10;

                    %>  
                    <ul class="nav-shop">
                        <li class="nav-item"><a  href="DBcart"><button><i class="ti-shopping-cart"></i><span id="cou2" class="nav-shop__circle"><%=totnow%></span></button></a> </li>
                        <li class="nav-item"><a class="button button-header" href="DBcart">Pay Now</a></li>
                    </ul>

                    <ul class="nav-shop">
                        <li class="nav-item"><a href="logout"><span  style="color: #000;" class="ti-power-off"></span></a></li>                       
                    </ul>
                    <%                        } else {
                        int totnow = 0;
                        if (request.getSession().getAttribute("cartitemcount") != null) {
                            totnow = Integer.parseInt(request.getSession().getAttribute("cartitemcount").toString());
                        }
                    %>
                    <ul class="nav-shop">
                        <li class="nav-item"><a  href="cart.jsp"><button><i class="ti-shopping-cart"></i><span id="cou2" class="nav-shop__circle"><%=totnow%></span></button></a> </li>
                        <li class="nav-item"><a class="button button-header" href="cart.jsp">Pay Now</a></li>
                    </ul>
                    <%
                        }
                    %>
                </div>
            </div>
        </nav>
    </div>
</header>
<!--================ End Header Menu Area =================-->