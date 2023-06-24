<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shoping Cart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/page.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
          integrity="sha384-rHoG5h2gUFe90z93Hc3K6OaV3WZDv9Kx7qLhGjSfuY3fPTTF6G/y32InWtzS2C7n" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.6/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">

    <style>
        #cart {
            width: 100%;
            border-collapse: collapse;
        }

        .table_head th {
            text-align: center;
        }

        .row-table td {
            text-align: center;
            vertical-align: middle;
        }

        .row-table:hover {
            background-color: #f2f2f2;
        }
    </style>
    <!--===============================================================================================-->
</head>
<body class="animsition">

<!-- Header -->
<header class="header-v4">
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    Free shipping for standard order over $100
                </div>

                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        Help & FAQs
                    </a>

                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        My Account
                    </a>

                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        EN
                    </a>

                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        USD
                    </a>
                </div>
            </div>
        </div>

        <div class="wrap-menu-desktop how-shadow1">
            <nav class="limiter-menu-desktop container">

                <!-- Logo desktop -->
                <a href="#" class="logo">
                    <img src="/images/lazadaalaskapng-removebg-preview.png" alt="IMG-LOGO">
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li>
                            <a href="/products">Home</a>
<%--                            <ul class="sub-menu">--%>
<%--                                <li><a href="index.html">Homepage 1</a></li>--%>
<%--                                <li><a href="home-02.html">Homepage 2</a></li>--%>
<%--                                <li><a href="home-03.html">Homepage 3</a></li>--%>
<%--                            </ul>--%>
                        </li>

                        <li>
                            <c:if test="${sessionScope.username != null}">
                                <a class="mr-2" href="">Hello <%=session.getAttribute("username")%></a>
                                <script>
                                    var username = '<%=session.getAttribute("username")%>';
                                    sessionStorage.setItem('username', username);
                                </script>
                                <a href="/products?action=logout" onclick="logout()">log out</a>
                            </c:if>
                            <c:if test="${sessionScope.username == null}">
                                <a href="/login?action=login">Log in</a>

                            </c:if>
                        </li>
                    </ul>
                </div>

                <!-- Icon header -->
                <%--                <div class="wrap-icon-header flex-w flex-r-m">--%>
                <%--                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">--%>
                <%--                        <i class="zmdi zmdi-search"></i>--%>
                <%--                    </div>--%>

                <%--                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"--%>
                <%--                         data-notify="2">--%>
                <%--                        <i class="zmdi zmdi-shopping-cart"></i>--%>
                <%--                    </div>--%>

                <%--                    <a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"--%>
                <%--                       data-notify="0">--%>
                <%--                        <i class="zmdi zmdi-favorite-outline"></i>--%>
                <%--                    </a>--%>
                <%--                </div>--%>
            </nav>
        </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
            <a href="index.html"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
            </div>

            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
                 data-notify="2">
                <i class="zmdi zmdi-shopping-cart"></i>
            </div>

            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
               data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>
            </a>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>
    </div>


    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li>
                <div class="left-top-bar">
                    Free shipping for standard order over $100
                </div>
            </li>

            <li>
                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        Help & FAQs
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        My Account
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        EN
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        USD
                    </a>
                </div>
            </li>
        </ul>

        <ul class="main-menu-m">
            <li>
                <a href="/products">Home</a>
            </li>
<%--                <ul class="sub-menu-m">--%>
<%--                    <li><a href="index.html">Homepage 1</a></li>--%>
<%--                    <li><a href="home-02.html">Homepage 2</a></li>--%>
<%--                    <li><a href="home-03.html">Homepage 3</a></li>--%>
<%--                </ul>--%>
<%--                <span class="arrow-main-menu-m">--%>
<%--						<i class="fa fa-angle-right" aria-hidden="true"></i>--%>
<%--					</span>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a href="product.html">Shop</a>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a href="blog.html">Blog</a>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a href="about.html">About</a>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a href="contact.html">Contact</a>--%>
<%--            </li>--%>
            <li>
                <c:if test="${sessionScope.username != null}">
                    <a class="mr-2" href="">Hello <%=session.getAttribute("username")%></a>
                    <a href="/products?action=logout">log out</a>
                </c:if>
                <c:if test="${sessionScope.username == null}">
                    <a href="/login?action=login">Log in</a>
                </c:if>
            </li>
        </ul>
    </div>

    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                <img src="images/icons/icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15">
                <button class="flex-c-m trans-04">
                    <i class="zmdi zmdi-search"></i>
                </button>
                <input class="plh3" type="text" name="search" placeholder="Search...">
            </form>
        </div>
    </div>
</header>

<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>

    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-cart-content flex-w js-pscroll">
            <ul class="header-cart-wrapitem w-full">
                <li class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img">
                        <img src="images/item-cart-01.jpg" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            White Shirt Pleat
                        </a>

                        <span class="header-cart-item-info">
								1 x $19.00
							</span>
                    </div>
                </li>

                <li class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img">
                        <img src="images/item-cart-02.jpg" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            Converse All Star
                        </a>

                        <span class="header-cart-item-info">
								1 x $39.00
							</span>
                    </div>
                </li>

                <li class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img">
                        <img src="images/item-cart-03.jpg" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            Nixon Porter Leather
                        </a>

                        <span class="header-cart-item-info">
								1 x $17.00
							</span>
                    </div>
                </li>
            </ul>

            <div class="w-full">
                <div class="header-cart-total w-full p-tb-40">
                    Total: $75.00
                </div>

                <div class="header-cart-buttons flex-w w-full">
                    <a href="shoping-cart.html"
                       class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        View Cart
                    </a>

                    <a href="shoping-cart.html"
                       class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                        Check Out
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
				Shoping Cart
			</span>
    </div>
</div>


<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85" action="/products?action=checkout" method="post" onsubmit="handleSubmit()">
    <input name="quantity" id="quantity" type="hidden"/>
    <input name="productId" id="productId" type="hidden"/>
    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                <div class="m-l-25 m-r--38 m-lr-0-xl">
                    <div class="wrap-table-shopping-cart">
                        <table id="cart" class="table-shopping-cart" style="text-align: center">
                            <thead>
                            <tr class="table_head">
                                <th class="column-1">Product</th>
                                <th class="column-2"></th>
                                <th class="column-3">Price</th>
                                <th style="text-align: center" class="column-4">Quantity</th>
                                <th style="text-align: center" class="column-5">Total</th>
                            </tr>
                            </thead>
                            <tbody id="tBodyProduct">

                            </tbody>


                        </table>
                    </div>

                    <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm" id="cartaftercheckout">
                        <div class="flex-w flex-m m-r-20 m-tb-5">
                            <input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text"
                                   name="coupon" placeholder="Coupon Code">

                            <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
                                Apply coupon
                            </div>
                        </div>

                        <div onclick="test()" class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                            Update Cart
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                    <h4 class="mtext-109 cl2 p-b-30">
                        Cart Totals
                    </h4>

                    <div class="flex-w flex-t bor12 p-b-13">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Subtotal:
								</span>
                        </div>

                        <div class="size-209">
								<span class="mtext-110 cl2" id="subtotal">

								</span>
                        </div>
                    </div>

                    <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                        <div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Shipping:
								</span>
                        </div>

                        <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                            <p class="stext-111 cl6 p-t-2">
                                Free ship anywhere, anytime ♥
                            </p>

                            <div class="p-t-15">
<%--									<span class="stext-112 cl8">--%>
<%--										Calculate Shipping--%>
<%--									</span>--%>

<%--                                <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">--%>
<%--                                    <select class="js-select2" name="time">--%>
<%--                                        <option>Select a country...</option>--%>
<%--                                        <option>${sessionScope.user.username}</option>--%>
<%--                                        <option>UK</option>--%>
<%--                                    </select>--%>
<%--                                    <div class="dropDownSelect2"></div>--%>
<%--                                </div>--%>

                                <span class="stext-112 cl8">
										Username
									</span>
                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state"
                                           placeholder="${sessionScope.user.username}">
                                </div>

                                <span class="stext-112 cl8">
										Email
									</span>
                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                                           placeholder="${sessionScope.user.email}">
                                </div>

                                <span class="stext-112 cl8">
										Phone
									</span>
                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                                           placeholder="${sessionScope.user.phone}">
                                </div>

                                <span class="stext-112 cl8">
                                    Address
									</span>
                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode"
                                           placeholder="${sessionScope.user.address}">
                                </div>

                                <%--                                <div class="flex-w">--%>
                                <%--                                    <div class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">--%>
                                <%--                                        Update Totals--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>

                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-27 p-b-33">
                        <div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
                        </div>

                        <div class="size-209 p-t-1">
								<span class="mtext-110 cl2" id="total">

								</span>
                        </div>
                    </div>

                    <button type="button" onclick="checkout(${sessionScope.user.id})"
                            class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                        Proceed to Checkout
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>


<!-- Footer -->
<footer class="bg3 p-t-75 p-b-32">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Categories
                </h4>

                <ul>
                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Women
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Men
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Shoes
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Watches
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Help
                </h4>

                <ul>
                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Track Order
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Returns
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Shipping
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            FAQs
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    GET IN TOUCH
                </h4>

                <p class="stext-107 cl7 size-201">
                    Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on
                    (+1) 96 716 6879
                </p>

                <div class="p-t-27">
                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-facebook"></i>
                    </a>

                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-instagram"></i>
                    </a>

                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-pinterest-p"></i>
                    </a>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Newsletter
                </h4>

                <form>
                    <div class="wrap-input1 w-full p-b-4">
                        <input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email"
                               placeholder="email@example.com">
                        <div class="focus-input1 trans-04"></div>
                    </div>

                    <div class="p-t-18">
                        <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                            Subscribe
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="p-t-40">
            <div class="flex-c-m flex-w p-b-18">
                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
                </a>
            </div>

            <p class="stext-107 cl6 txt-center">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a
                    href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a
                    href="https://themewagon.com" target="_blank">ThemeWagon</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

            </p>
        </div>
    </div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="headandfoot/new.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.6/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });


    var cartItems = JSON.parse(localStorage.getItem("cart")) || [];

    let tien = 0;
    for (const cart of cartItems) {
        tien += convertFormattedPriceToNumber(cart.price);
    }
    $('#subtotal').text(formatPrice(tien));
    $('#total').text(formatPrice(tien));

    if (cartItems && Array.isArray(cartItems)) {
        cartItems.forEach(function (item) {
            var productName = item.name;
            var productPrice = item.price;
            var productQuantity = item.quantity;
            var img = item.img;
            var cost = item.cost

            const total = +parseInt(productPrice.replace(/[^\d]/g, ""));
            const costP = +parseInt(productPrice.replace(/[^\d]/g, "") / productQuantity);
            const costString = costP.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
            const totalString = total.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
            var cartItemElement = showCartHtml2(item.id, img, productName, totalString, productQuantity, cost);

            $('#tBodyProduct').append(cartItemElement);
        });
    }

    // function handleSubmit() {
    //     var cartItems = JSON.parse(localStorage.getItem("cart")) || [];
    //     var id = "";
    //     var quantity = "";
    //     cartItems.forEach(e => {
    //         id += e.id + ",";
    //         quantity += e.quantity + ',';
    //     })
    //     $('#productId').val(id);
    //     $('#quantity').val(quantity);
    // }


    function convertFormattedPriceToNumber(formattedPrice) {
        const numericString = formattedPrice.replace(/[^\d]/g, '');
        const numericValue = parseInt(numericString, 10);
        return numericValue;
    }

    function formatPrice(price) {
        return price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }

    function downQuan(id) {
        var quan = (document.querySelector('#product-' + id).value);
        quan--;
        updateCartLocal(quan, id)
    }

    function upQuan(id) {
        var quan = (document.querySelector('#product-' + id).value);
        console.log(quan)
        let checkQuantity = false;
        let maxQuantity = 0;
        cartItems.forEach((cart) => {
            if(cart.id == id ) {
                if(quan >= cart.maxQuantity) {
                    checkQuantity = true;
                    maxQuantity = cart.maxQuantity;
                }
            }
        })
        if(checkQuantity) {
            // alert("Quá số lượng cho phép")
            swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Exceeding the allowed amount!',
            })
            console.log(maxQuantity)
            console.log("Trước", document.querySelector('#product-' + id).value)
            document.querySelector('#product-' + id).value = +maxQuantity - 1
            console.log("Sau", document.querySelector('#product-' + id).value)
            return;
        } else {
            console.log("Chạy xuống đây")
            quan++;
            updateCartLocal(quan, id)
        }

    }

    function updateCartLocal(quan, id) {
        var cartItems = JSON.parse(localStorage.getItem("cart")) || [];
        var price;
        var updateItem = cartItems.map(function (item) {
            if (item.id == id) {
                item.quantity = quan;
                price = formatPrice(quan * convertFormattedPriceToNumber(item.cost))
                item.price = price
            }
            return item;
        })
        localStorage.setItem("cart", JSON.stringify(updateItem));
        var totalElement = document.querySelector('#total-' + id);

        if (totalElement) {
            console.log(updateItem)
            totalElement.innerHTML = price;
        }

        let tien = 0;
        for (const cart of cartItems) {
            tien += convertFormattedPriceToNumber(cart.price);
        }
        $('#subtotal').text(formatPrice(tien));
        $('#total').text(formatPrice(tien));
    }


    function checkout(id) {
        var cartItems = JSON.parse(localStorage.getItem("cart"))
        var data = {
            quantitys: cartItems.map(e => e.quantity).join(),
            productIds: cartItems.map(e => e.id).join(),
            id: id
        }
        swal.fire({
            title: 'Xác nhận',
            text: 'Bạn có muốn submit không?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Submit',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                console.log(cartItems);
                console.log(id);
                $.ajax('/products?action=checkout', {
                    type: 'POST',
                    dataType: 'json',
                    data: data,
                    success: function (data, status, xhr) {
                        // cartItems.forEach((cart) => {
                        //     if(cart.id == id ) {
                        //
                        //     }
                        // })
                        console.log(data);
                        // Xoá dữ liệu trong local storage
                        localStorage.removeItem("cart");
                        swal.fire('Thành công', 'Checkout thành công!', 'success');
                    },
                    error: function (jqXhr, textStatus, errorMessage) {
                        console.log(errorMessage);
                        swal.fire('Lỗi', 'Có lỗi xảy ra!', 'error');
                    }
                });
            }
        });
    }

    // function checkout(id) {
    //     var cartItems = JSON.parse(localStorage.getItem("cart"))
    //     var data = {
    //         quantitys: cartItems.map(e => e.quantity).join(),
    //         productIds: cartItems.map(e => e.id).join(),
    //         id: id
    //     }
    //     swal.fire({
    //         title: 'Check out',
    //         text: 'Do you want to check out?',
    //         icon: 'question',
    //         showCancelButton: true,
    //         confirmButtonText: 'Submit',
    //         cancelButtonText: 'Cancel'
    //     }).then(async function (result) {
    //         if (result.value) {
    //             try {
    //                 await $.ajax('/products?action=checkout', {
    //                     type: 'POST',
    //                     dataType: 'json',
    //                     data: data
    //                 });
    //                 // Xoá dữ liệu trong local storage
    //                 localStorage.removeItem("cart");
    //                 swal.fire('Thành công', 'Checkout thành công!', 'success');
    //             } catch (error) {
    //                 console.log(error);
    //                 swal.fire('Lỗi', 'Có lỗi xảy ra!', 'error');
    //             }
    //         } else {
    //             swal.fire('Thông báo', 'Checkout đã bị hủy!', 'warning');
    //         }
    //     });
    // }

    // function checkLoginStatus() {
    //     $.ajax({
    //         url: '/api/check-login',
    //         method: 'GET',
    //         dataType: 'json',
    //         success: function(response) {
    //             if (response.hasOwnProperty('isLoggedIn') && response.isLoggedIn) {
    //                 var cartItems = JSON.parse(localStorage.getItem("cart"))
    //                 var data = {
    //                     quantitys: cartItems.map(e => e.quantity).join(),
    //                     productIds: cartItems.map(e => e.id).join(),
    //                     id: id
    //                 }
    //                 swal.fire({
    //                     title: 'Check out',
    //                     text: 'Do you want to check out?',
    //                     icon: 'question',
    //                     showCancelButton: true,
    //                     confirmButtonText: 'Submit',
    //                     cancelButtonText: 'Cancel'
    //                 }).then((result) => {
    //                     if (result.value) {
    //                         $.ajax('/products?action=checkout', {
    //                             type: 'POST',
    //                             dataType: 'json',
    //                             data: data
    //                         });
    //                         // Xoá dữ liệu trong local storage
    //                         localStorage.removeItem("cart");
    //                         swal.fire('Thành công', 'Checkout thành công!', 'success');
    //                         var cartAfterCheckout = document.getElementById("cartaftercheckout");
    //                         // console.log(document.getElementsByClassName('row-table'))
    //                         $('#tBodyProduct').empty();
    //                         $('#subtotal').text(0);
    //                         $('#total').text(0);
    //                         cartAfterCheckout.innerHTML = "Your shopping cart is empty. Please return to the shop to order more";
    //
    //                     } else {
    //                         swal.fire('Thông báo', 'Checkout đã bị hủy!', 'warning');
    //                     }
    //                 });
    //                 // Người dùng đã đăng nhập
    //                 // TODO: Xử lý khi đã đăng nhập
    //             } else {
    //                 // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
    //                 window.location.href = '/login?action=login';
    //             }
    //         },
    //         error: function() {
    //             // Xử lý lỗi nếu cần thiết
    //         }
    //     });
    // }

    function checkout(id) {

        // checkLoginStatus();
            console.log(sessionStorage.getItem('username'))

        if (sessionStorage.getItem('username') === null) {
            // alert("Vui lòng đăng nhập dể tiếp tục")
            // // Nếu chưa đăng nhập, chuyển hướng qua trang đăng nhập
            // window.location.href = '/login?action=login';
            $.ajax({
                url: '/login?action=login',
                type: 'GET',
                success: function(response) {
                    swal.fire({
                        title: 'Vui lòng đăng nhập để tiếp tục',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.value) {
                            window.location.href = '/login?action=login';
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        } else {
            var cartItems = JSON.parse(localStorage.getItem("cart"))
            var data = {
                quantitys: cartItems.map(e => e.quantity).join(),
                productIds: cartItems.map(e => e.id).join(),
                id: id
            }
            swal.fire({
                title: 'Check out',
                text: 'Do you want to check out?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Submit',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.value) {
                    $.ajax('/products?action=checkout', {
                        type: 'POST',
                        dataType: 'json',
                        data: data
                    });
                    // Xoá dữ liệu trong local storage
                    localStorage.removeItem("cart");
                    swal.fire('Thành công', 'Checkout thành công!', 'success');
                    var cartAfterCheckout = document.getElementById("cartaftercheckout");
                    // console.log(document.getElementsByClassName('row-table'))
                    $('#tBodyProduct').empty();
                    $('#subtotal').text(0);
                    $('#total').text(0);
                    cartAfterCheckout.innerHTML = "Your shopping cart is empty. Please return to the shop to order more";

                } else {
                    swal.fire('Thông báo', 'Checkout đã bị hủy!', 'warning');
                }
            });
            // Nếu đã đăng nhập, thực hiện hành động mong muốn
            //
        }

    }




    // function checkout(id) {
    //         var cartItems = JSON.parse(localStorage.getItem("cart"))
    //         var data = {
    //             quantitys: cartItems.map(e => e.quantity).join(),
    //             productIds: cartItems.map(e => e.id).join(),
    //             id: id
    //         }
    //         swal.fire({
    //             title: 'Check out',
    //             text: 'Do you want to check out?',
    //             icon: 'question',
    //             showCancelButton: true,
    //             confirmButtonText: 'Submit',
    //             cancelButtonText: 'Cancel'
    //         }).then((result) => {
    //             if (result.value) {
    //                 $.ajax('/products?action=checkout', {
    //                     type: 'POST',
    //                     dataType: 'json',
    //                     data: data
    //                 });
    //                 // Xoá dữ liệu trong local storage
    //                 localStorage.removeItem("cart");
    //                 swal.fire('Thành công', 'Checkout thành công!', 'success');
    //                 var cartAfterCheckout = document.getElementById("cartaftercheckout");
    //                 // console.log(document.getElementsByClassName('row-table'))
    //                 $('#tBodyProduct').empty();
    //                 $('#subtotal').text(0);
    //                 $('#total').text(0);
    //                 cartAfterCheckout.innerHTML = "Your shopping cart is empty. Please return to the shop to order more";
    //
    //             } else {
    //                 swal.fire('Thông báo', 'Checkout đã bị hủy!', 'warning');
    //             }
    //         });
    //     }

    function logout() {
        // Xóa dữ liệu username từ sessionStorage
        sessionStorage.removeItem('username');
    }

    function test(){
        swal.fire({
            title: 'Sweet!',
            text: 'GÁI XINH.',
            imageUrl: 'https://antimatter.vn/wp-content/uploads/2022/10/hinh-anh-gai-xinh-de-thuong.jpg',
            imageWidth: 400,
            imageHeight: 200,
            imageAlt: 'Custom image',
        })
    }

</script>
<!--===============================================================================================-->
<script src="js/main.js"></script>


</body>
</html>