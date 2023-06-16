<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <title>Home</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-rHoG5h2gUFe90z93Hc3K6OaV3WZDv9Kx7qLhGjSfuY3fPTTF6G/y32InWtzS2C7n" crossorigin="anonymous">

  <!--===============================================================================================-->
  <style>
    .page-menu{
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .page-link {
      display: inline-block;
      padding: 10px 15px;
      margin: 5px;
      background-color: #f2f2f2;
      color: #333;
      text-decoration: none;
      border: 1px solid #ccc;
      border-radius: 5px;
      transition: background-color 0.3s ease;
      align-items: center;
    }

    .page-link:hover {
      background-color: #ddd;
      color: #555;
    }

    .page-link:focus {
      outline: none;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
    }

    .page-link.active {
      background-color: #555;
      color: #fff;
    }

    .page-link.disabled {
      opacity: 0.5;
      pointer-events: none;
    }

    .page-link.disabled:hover {
      background-color: #f2f2f2;
      color: #333;
      cursor: not-allowed;
    }
  </style>
</head>
<body class="animsition">

<!-- Header -->
<header>
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

    <div class="wrap-menu-desktop">
      <nav class="limiter-menu-desktop container">

        <!-- Logo desktop -->
        <a href="#" class="logo">
          <img src="/images/lazadaalaskapng-removebg-preview.png" style="width: 140px;
    object-fit: cover" alt="IMG-LOGO">
        </a>

        <!-- Menu desktop -->
        <div class="menu-desktop">
          <ul class="main-menu">
            <li class="active-menu">
              <a href="products">Home</a>
              <ul class="sub-menu">
                <li><a href="index.html">Homepage 1</a></li>
                <li><a href="home-02.html">Homepage 2</a></li>
                <li><a href="home-03.html">Homepage 3</a></li>
              </ul>
            </li>

            <li>
              <a href="product.html">Shop</a>
            </li>

            <li class="label1" data-label1="hot">
              <a href="shoping-cart.html">Features</a>
            </li>

            <li>
              <a href="blog.html">Blog</a>
            </li>

            <li>
              <a href="about.html">About</a>
            </li>

            <li>
              <a href="/login/login.jsp">Log in</a>
            </li>
          </ul>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m">
          <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
          </div>

          <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>

          <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
            <i class="zmdi zmdi-favorite-outline"></i>
          </a>
        </div>
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

      <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
        <i class="zmdi zmdi-shopping-cart"></i>
      </div>

      <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
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
        <a href="index.html">Home</a>
        <ul class="sub-menu-m">
          <li><a href="index.html">Homepage 1</a></li>
          <li><a href="home-02.html">Homepage 2</a></li>
          <li><a href="home-03.html">Homepage 3</a></li>
        </ul>
        <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
      </li>

      <li>
        <a href="product.html">Shop</a>
      </li>

      <li>
        <a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
      </li>

      <li>
        <a href="blog.html">Blog</a>
      </li>

      <li>
        <a href="about.html">About</a>
      </li>

      <li>
        <a href="contact.html">Contact</a>
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
      <ul class="header-cart-wrapitem w-full" id="cart-items">
        <li class="header-cart-item flex-w flex-t m-b-12">
<%--          <div class="header-cart-item-img">--%>
<%--            <img src="images/item-cart-01.jpg" alt="IMG">--%>
<%--          </div>--%>

<%--          <div class="header-cart-item-txt p-t-8">--%>
<%--            <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">--%>
<%--              White Shirt Pleat--%>
<%--            </a>--%>

<%--            <span class="header-cart-item-info">--%>
<%--								1 x $19.00--%>
<%--							</span>--%>
<%--          </div>--%>
        </li>

<%--        <li class="header-cart-item flex-w flex-t m-b-12">--%>
<%--          <div class="header-cart-item-img">--%>
<%--            <img src="images/item-cart-02.jpg" alt="IMG">--%>
<%--          </div>--%>

<%--          <div class="header-cart-item-txt p-t-8">--%>
<%--            <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">--%>
<%--              Converse All Star--%>
<%--            </a>--%>

<%--            <span class="header-cart-item-info">--%>
<%--								1 x $39.00--%>
<%--							</span>--%>
<%--          </div>--%>
<%--        </li>--%>

<%--        <li class="header-cart-item flex-w flex-t m-b-12">--%>
<%--          <div class="header-cart-item-img">--%>
<%--            <img src="images/item-cart-03.jpg" alt="IMG">--%>
<%--          </div>--%>

<%--          <div class="header-cart-item-txt p-t-8">--%>
<%--            <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">--%>
<%--              Nixon Porter Leather--%>
<%--            </a>--%>

<%--            <span class="header-cart-item-info">--%>
<%--								1 x $17.00--%>
<%--							</span>--%>
<%--          </div>--%>
<%--        </li>--%>
      </ul>

      <div class="w-full">
        <div class="header-cart-total w-full p-tb-40" id="cartTotal">
          Total:
        </div>

        <div class="header-cart-buttons flex-w w-full">
          <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
            View Cart
          </a>

          <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
            Check Out
          </a>
        </div>
      </div>
    </div>
  </div>
</div>



<!-- Slider -->
<section class="section-slide">
  <div class="wrap-slick1">
    <div class="slick1">
      <div class="item-slick1" style="background-image: url(images/slide-01.jpg);">
        <div class="container h-full">
          <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
            <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Women Collection 2018
								</span>
            </div>

            <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
              <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
                NEW SEASON
              </h2>
            </div>

            <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
              <a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
                Shop Now
              </a>
            </div>
          </div>
        </div>
      </div>

      <div class="item-slick1" style="background-image: url(images/slide-02.jpg);">
        <div class="container h-full">
          <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
            <div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Men New-Season
								</span>
            </div>

            <div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
              <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
                Jackets & Coats
              </h2>
            </div>

            <div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
              <a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
                Shop Now
              </a>
            </div>
          </div>
        </div>
      </div>

      <div class="item-slick1" style="background-image: url(images/slide-03.jpg);">
        <div class="container h-full">
          <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
            <div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Men Collection 2018
								</span>
            </div>

            <div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
              <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
                New arrivals
              </h2>
            </div>

            <div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
              <a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
                Shop Now
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
        <!-- Block1 -->
        <div class="block1 wrap-pic-w">

          <img src="<c:url value="/images/banner-01.jpg"></c:url>" alt="IMG-BANNER">

          <a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
            <div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Women
								</span>

              <span class="block1-info stext-102 trans-04">
									Spring 2018
								</span>
            </div>

            <div class="block1-txt-child2 p-b-4 trans-05">
              <div class="block1-link stext-101 cl0 trans-09">
                Shop Now
              </div>
            </div>
          </a>
        </div>
      </div>

      <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
        <!-- Block1 -->
        <div class="block1 wrap-pic-w">
          <img src="../images/banner-02.jpg" alt="IMG-BANNER">

          <a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
            <div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Men
								</span>

              <span class="block1-info stext-102 trans-04">
									Spring 2018
								</span>
            </div>

            <div class="block1-txt-child2 p-b-4 trans-05">
              <div class="block1-link stext-101 cl0 trans-09">
                Shop Now
              </div>
            </div>
          </a>
        </div>
      </div>

      <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
        <!-- Block1 -->
        <div class="block1 wrap-pic-w">
          <img src="../images/banner-03.jpg" alt="IMG-BANNER">

          <a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
            <div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Accessories
								</span>

              <span class="block1-info stext-102 trans-04">
									New Trend
								</span>
            </div>

            <div class="block1-txt-child2 p-b-4 trans-05">
              <div class="block1-link stext-101 cl0 trans-09">
                Shop Now
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
  <div class="container">
    <div class="p-b-10">
      <h3 class="ltext-103 cl5">
        Product Overview
      </h3>
    </div>

    <div class="flex-w flex-sb-m p-b-52">
      <div class="flex-w flex-l-m filter-tope-group m-tb-10">
        <a href="/products">
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
          All Products
        </button>
        </a>

        <a href="/category?category=fashion">
          <button name="category" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women">
            Fashion
          </button>
        </a>

        <a href="/category?category=cosmetics">
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
          Cosmetics
        </button>
        </a>

        <a href="/category?category=technological">
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag">
          Technological
        </button>
        </a>
<%--        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".shoes">--%>
<%--          Shoes--%>
<%--        </button>--%>

<%--        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".watches">--%>
<%--          Watches--%>
<%--        </button>--%>
      </div>

      <div class="flex-w flex-c-m m-tb-10">
        <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
          <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
          <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
          Filter
        </div>

        <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
          <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
          <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
          Search
        </div>
      </div>

      <!-- Search product -->
      <div class="dis-none panel-search w-full p-t-10 p-b-15">
        <div class="bor8 dis-flex p-l-15">
<%--          <form action="/products" method="get">--%>
<%--            <div class="search-container">--%>
<%--              <input class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" value="${pageable.search}" type="search" name="search" id="searchInput" onsearch="onClearSearch()" placeholder="Nhập để tìm kiếm...."/>--%>
<%--              <button id="searchButton" class="search-button">--%>
<%--                <i class="fa fa-search"></i>--%>
<%--              </button>--%>
<%--            </div>--%>
<%--          </form>--%>
<%--          <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">--%>
<%--            <i class="zmdi zmdi-search"></i>--%>
<%--          </button>--%>
          <form action="/products" method="get">
          <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="search" name="search" onsearch="onClearSearch()" placeholder="Search for product" value="${pageable.search}">
          <button id="searchButton" class="search-button">
            <i class="fa fa-search"></i>
          </button>
          </form>

        </div>
      </div>

      <!-- Filter -->
      <div class="dis-none panel-filter w-full p-t-10">
        <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
          <div class="filter-col1 p-r-15 p-b-27">
            <div class="mtext-102 cl2 p-b-15">
              Sort By
            </div>

            <ul>
              <li class="p-b-6">
                <a href="/products?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=id" class="filter-link stext-106 trans-04">
                  Default
                </a>
<%--                <a href="#" class="filter-link stext-106 trans-04">--%>
<%--                  Default--%>
<%--                </a>--%>
              </li>

              <li class="p-b-6">
                <a href="/products?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=name" class="filter-link stext-106 trans-04">
                  Name
                </a>
              </li>

              <li class="p-b-6">
                <a href="/products?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=category_name" class="filter-link stext-106 trans-04">
                  Category
                </a>
              </li>

<%--              <li class="p-b-6">--%>
<%--                <a href="#" class="filter-link stext-106 trans-04 filter-link-active">--%>
<%--                  Newness--%>
<%--                </a>--%>
<%--              </li>--%>

              <li class="p-b-6">
                <a href="/products?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=price" class="filter-link stext-106 trans-04">
                  Price: Low to High
                </a>
              </li>

              <li class="p-b-6">
                <a href="/products?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=price" class="filter-link stext-106 trans-04">
                  Price: High to Low
                </a>
              </li>
            </ul>
          </div>

          <div class="filter-col2 p-r-15 p-b-27">
            <div class="mtext-102 cl2 p-b-15">
              Price
            </div>

            <ul>
              <li class="p-b-6">
                <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                  All
                </a>
              </li>

              <li class="p-b-6">
                <a href="#" class="filter-link stext-106 trans-04">
                  $0.00 - $50.00
                </a>
              </li>

              <li class="p-b-6">
                <a href="#" class="filter-link stext-106 trans-04">
                  $50.00 - $100.00
                </a>
              </li>

              <li class="p-b-6">
                <a href="#" class="filter-link stext-106 trans-04">
                  $100.00 - $150.00
                </a>
              </li>

              <li class="p-b-6">
                <a href="#" class="filter-link stext-106 trans-04">
                  $150.00 - $200.00
                </a>
              </li>

              <li class="p-b-6">
                <a href="#" class="filter-link stext-106 trans-04">
                  $200.00+
                </a>
              </li>
            </ul>
          </div>

          <div class="filter-col3 p-r-15 p-b-27">
            <div class="mtext-102 cl2 p-b-15">
              Color
            </div>

            <ul>
              <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

                <a href="#" class="filter-link stext-106 trans-04">
                  Black
                </a>
              </li>

              <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

                <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                  Blue
                </a>
              </li>

              <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
										<i class="zmdi zmdi-circle"></i>
									</span>

                <a href="#" class="filter-link stext-106 trans-04">
                  Grey
                </a>
              </li>

              <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
										<i class="zmdi zmdi-circle"></i>
									</span>

                <a href="#" class="filter-link stext-106 trans-04">
                  Green
                </a>
              </li>

              <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
										<i class="zmdi zmdi-circle"></i>
									</span>

                <a href="#" class="filter-link stext-106 trans-04">
                  Red
                </a>
              </li>

              <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

                <a href="#" class="filter-link stext-106 trans-04">
                  White
                </a>
              </li>
            </ul>
          </div>

          <div class="filter-col4 p-b-27">
            <div class="mtext-102 cl2 p-b-15">
              Tags
            </div>

            <div class="flex-w p-t-4 m-r--5">
              <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                Fashion
              </a>

              <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                Lifestyle
              </a>

              <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                Denim
              </a>

              <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                Streetstyle
              </a>

              <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                Crafts
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="product-list" class="row isotope-grid">
<c:forEach items="${products}" var="product">
  <div  class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
    <!-- Block2 -->
    <div class="block2">
      <div class="block2-pic hov-img0">
        <a href="/product/productdetail.jsp">
          <img src="${product.img}" >
        </a>

        <a href="#" onclick="onClickQuickView(${product.id})" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
          Quick View
        </a>
      </div>

      <div class="block2-txt flex-w flex-t p-t-14">
        <div class="block2-txt-child1 flex-col-l ">
          <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" class="product-name">
            ${product.name}
          </a>
          <span class="stext-105 cl3">
             ${product.getCategory().getName()}
								</span>
          <fmt:formatNumber value="${product.price}" pattern="#,##0.00" var="formattedPrice" />
          <span class="stext-105 cl3" class="product-price">
             Price: ${formattedPrice}
								</span>
          <span class="stext-105 cl3" class="product-price">
             Quantity: ${product.quantity}
								</span>
        </div>

        <div class="block2-txt-child2 flex-r p-t-3">
          <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
            <img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
            <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
          </a>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
    </div>
<div class="page-menu">
  <c:forEach begin="1" end="${pageable.totalPages}" var="page" >
    <a class="page-link" href="/products?page=${page}&search=${pageable.search}&sortBy=${pageable.sortBy}&nameField=${pageable.nameField}">${page}</a>
  </c:forEach>
</div>

