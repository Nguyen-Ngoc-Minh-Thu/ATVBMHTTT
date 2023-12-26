<%@ page import="Entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="Ekka - Admin Dashboard HTML Template.">

  <title>Chỉnh sửa sản phẩm</title>

  <!-- GOOGLE FONTS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
          href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
          rel="stylesheet">

  <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet" />
  <link href='assets/plugins/slick/slick.min.css' rel='stylesheet'>
  <link href='assets/plugins/swiper/swiper-bundle.min.css' rel='stylesheet'>

  <!-- ekka CSS -->
  <link id="ekka-css" rel="stylesheet" href="assets/css/ekka.css" />

  <!-- FAVICON -->
  <link href="assets/img/logoshop.png" rel="shortcut icon" />

</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">
<!-- WRAPPER -->
<div class="wrapper">

  <!-- LEFT MAIN SIDEBAR -->
  <div class="ec-left-sidebar ec-bg-sidebar">
    <div id="sidebar" class="sidebar ec-sidebar-footer">

      <div class="ec-brand">
        <a href="IndexAdmin" title="CVT">
          <img class="ec-brand-icon" src="assets/img/logoshop.png" alt="" />
          <span class="ec-brand-name text-truncate">CVT Shop</span>
        </a>
      </div>

      <!-- begin sidebar scrollbar -->
      <div class="ec-navigation" data-simplebar>
        <!-- sidebar menu -->
        <ul class="nav sidebar-inner" id="sidebar-menu">
          <!-- Dashboard -->
          <li>
            <a class="sidenav-item-link" href="IndexAdmin">
              <i class="mdi mdi-view-dashboard-outline"></i>
              <span class="nav-text">Bảng điều khiển</span>
            </a>
            <hr>
          </li>
          <!-- Users -->
          <li class="has-sub">
            <a class="sidenav-item-link" href="javascript:void(0)">
              <i class="mdi mdi-account-group"></i>
              <span class="nav-text">Khách hàng</span> <b class="caret"></b>
            </a>
            <div class="collapse">
              <ul class="sub-menu" id="users" data-parent="#sidebar-menu">
                <li class="">
                  <a class="sidenav-item-link" href="AdminListUser">
                    <span class="nav-text">Danh sách khách hàng</span>
                  </a>
                </li>
                <!-- <li class="">
                    <a class="sidenav-item-link" href="user-profile.html">
                        <span class="nav-text">Users Profile</span>
                    </a>
                </li> -->
              </ul>
            </div>
            <hr>
          </li>

          <!-- Products -->
          <li class="has-sub active expand">
            <a class="sidenav-item-link" href="javascript:void(0)">
              <i class="mdi mdi-palette-advanced"></i>
              <span class="nav-text">Các sản phẩm</span> <b class="caret"></b>
            </a>
            <div class="collapse show">
              <ul class="sub-menu" id="products" data-parent="#sidebar-menu">
                <li class="">
                  <a class="sidenav-item-link" href="AdminAddProduct.jsp">
                    <span class="nav-text">Thêm sản phẩm</span>
                  </a>
                </li>
                <li class="active">
                  <a class="sidenav-item-link" href="AdminListProduct">
                    <span class="nav-text">Danh sách sản phẩm</span>
                  </a>
                </li>
                <!-- <li class="">
                    <a class="sidenav-item-link" href="product-detail.html">
                        <span class="nav-text">Product Detail</span>
                    </a>
                </li> -->
              </ul>
            </div>
          </li>

          <!-- Orders -->
          <li class="has-sub">
            <a class="sidenav-item-link" href="javascript:void(0)">
              <i class="mdi mdi-cart"></i>
              <span class="nav-text">Đơn hàng</span> <b class="caret"></b>
            </a>
            <div class="collapse">
              <ul class="sub-menu" id="orders" data-parent="#sidebar-menu">
                <li class="">
                  <a class="sidenav-item-link" href="AdminListOrder">
                    <span class="nav-text">Danh sách đơn hàng</span>
                  </a>
                </li>
                <!-- <li class="">
                    <a class="sidenav-item-link" href="order-history.html">
                        <span class="nav-text">Lịch sử đơn hàng</span>
                    </a>
                </li> -->
                <!-- <li class="">
                    <a class="sidenav-item-link" href="order-detail.html">
                        <span class="nav-text">Order Detail</span>
                    </a>
                </li> -->
                <!-- <li class="">
                    <a class="sidenav-item-link" href="invoice.html">
                        <span class="nav-text">Invoice</span>
                    </a>
                </li> -->
              </ul>
            </div>
          </li>
          <!-- Bài viết -->
          <!-- <li class="has-sub">
              <a class="sidenav-item-link" href="javascript:void(0)">
                  <i class="mdi mdi-palette-advanced"></i>
                  <span class="nav-text">Bài viết</span> <b class="caret"></b>
              </a>
          </li> -->
          <!-- Reviews -->
          <!-- Other Pages -->
          <!-- <li class="has-sub">
              <a class="sidenav-item-link" href="javascript:void(0)">
                  <i class="mdi mdi-image-filter-none"></i>
                  <span class="nav-text">Other Pages</span> <b class="caret"></b>
              </a>
              <div class="collapse">
                  <ul class="sub-menu" id="otherpages" data-parent="#sidebar-menu">
                      <li class="has-sub">
                          <a href="404.html">404 Page</a>
                      </li>
                  </ul>
              </div>
          </li> -->
        </ul>
      </div>
    </div>
  </div>

  <!-- PAGE WRAPPER -->
  <div class="ec-page-wrapper">
<% Product product = (Product) request.getAttribute("product"); %>
    <!-- Header -->
    <header class="ec-main-header" id="header">
      <nav class="navbar navbar-static-top navbar-expand-lg">
        <!-- Sidebar toggle button -->
        <button id="sidebar-toggler" class="sidebar-toggle"></button>
        <!-- search form. don't use -->
        <div class="search-form d-lg-inline-block">
        </div>

        <!-- navbar right -->
        <div class="navbar-right">
          <ul class="nav navbar-nav">
            <!-- User Account -->
            <li class="dropdown user-menu">
              <button class="dropdown-toggle nav-link ec-drop" data-bs-toggle="dropdown"
                      aria-expanded="false">
                <img src="assets/img/user/user.png" class="user-image" alt="User Image" />
              </button>
              <ul class="dropdown-menu dropdown-menu-right ec-dropdown-menu">
                <!-- User image -->
                <li class="dropdown-header">
                  <img src="assets/img/user/user.png" class="img-circle" alt="User Image" />
                  <div class="d-inline-block">
                    Admin <small class="pt-1">
                    <p>admin@gmail.com</p>
                  </small>
                  </div>
                </li>
                <li class="right-sidebar-in">
                  <a href="javascript:0"> <i class="mdi mdi-settings-outline"></i> Cài đặt </a>
                </li>
                <li class="dropdown-footer">
                  <a href="LogOut"> <i class="mdi mdi-logout"></i> Đăng xuất </a>
                </li>
              </ul>
            </li>
            <li class="right-sidebar-in right-sidebar-2-menu">
              <i class="mdi mdi-settings-outline mdi-spin"></i>
            </li>
          </ul>
        </div>
      </nav>
    </header>

    <!-- CONTENT WRAPPER -->
    <div class="ec-content-wrapper">
      <div class="content">
        <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
          <div>
            <h1>Chỉnh sửa sản phẩm</h1>
            <p class="breadcrumbs"><span><a href="AdminIndex?idpd=<%=product.getId()%>">Trang chủ</a></span>
              <span><i class="mdi mdi-chevron-right"></i></span>Chỉnh sửa sản phẩm
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="card card-default">
              <div class="card-header card-header-border-bottom">
                <h2>Chỉnh sửa sản phẩm</h2>
              </div>

              <div class="card-body product-detail">
                <form action="AdminUpdateProduct?idpd=<%=product.getId()%>" method="post">
                <div class="row">
                  <div class="col-xl-4 col-lg-6">
                    <div class="row">
                      <div class="single-pro-img">
                        <div class="single-product-scroll">
                          <div class="single-product-cover">
                            <% for(String link : product.getImages()) { %>
                            <div class="single-slide zoom-image-hover">
                              <img style="max-width: 371px; max-height: 371px;" class="img-responsive"
                                   src="<%=link%>"
                                   alt="">
                            </div>
                            <% } %>
                          </div>
                        <div class="single-nav-thumb">
                          <% for(String linkI : product.getImages()){ %>
                          <div class="single-slide">
                            <img style="max-width: 72px; max-height: 48px;" class="img-responsive"
                                 src="<%=linkI%>"
                                 alt="">
                          </div>
                          <% } %>
                        </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-5 col-lg-6">
                    <div class="row product-overview">
                      <div class="col-12">
                        <Label class="product-title">Tên sản phẩm
                          <input type="text" class="form-control" name="nameproduct"
                                 value="<%=product.getName()%>" required>
                        </Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <Label class="product-sku">Mã sản phẩm: <label class="form-control"><%=product.getId()%></label>

                        </Label>
                        <Label class="product-sku">Thương hiệu
                          <input type="text" class="form-control" name="brand"
                                 value="<%=product.getBrand()%>" required>
                        </Label>
                        <span class="text-uppercase">Loại sản phẩm</span>
                        <select name="category" id="lang-select">
                          <% if(product.getCategory()==1) { %>
                          <option value="3" selected>Thắt lưng nam</option>
                          <option value="2">Mặt thắt lưng</option>
                          <option value="1">Dây thắt lưng</option>
                          <% }else if(product.getCategory()==2) { %>
                          <option value="3" >Thắt lưng nam</option>
                          <option value="2" selected>Mặt thắt lưng</option>
                          <option value="1">Dây thắt lưng</option>
                          <% } else { %>
                          <option value="3" >Thắt lưng nam</option>
                          <option value="2">Mặt thắt lưng</option>
                          <option value="1" selected>Dây thắt lưng</option>
                          <% } %>
                        </select>
                        <br>
                        <Label class="product-prict">Giá
                          <input type="text" class="form-control" name="price"
                                 value="<%=product.getPrice()%>" required>VNĐ
                        </Label>
                        <br>
                        <Label class="product-sku">Giá bán
                          <input type="text" class="form-control" name="pricebuy"
                                 value="<%=product.getPrice_buy()%>" required>VNĐ
                        </Label>
                        <br>
                        <Label class="product-stock">Số lượng
                          <input type="number" class="form-control" name="quantity"
                                 value="<%=product.getQuantity()%>" required>
                        </Label>
                        <label class="product-detail">Chi tiết
                        <input type="text" class="form-control" name="detail"
                               value="<%=product.getDetail()%>" required>
                        </label>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="d-flex justify-content-end mt-5">
                  <button type="submit"
                          class="btn btn-primary mb-2 btn-pill">Cập nhật sản phẩm</button>
                </div>
                </form>
              </div>

            </div>
          </div>
        </div> <!-- End Content -->
      </div> <!-- End Content Wrapper -->

      <!-- Footer -->
      <footer class="footer mt-auto">
        <div class="copyright bg-white">
          <p>
            Copyright &copy; <span id="ec-year"></span><a class="text-primary"
                                                          href="https://themeforest.net/user/ashishmaraviya" target="_blank"> Ekka Admin Dashboard</a>. All Rights Reserved.
          </p>
        </div>
      </footer>

    </div> <!-- End Page Wrapper -->
  </div> <!-- End Wrapper -->
</div>
  <!-- Common Javascript -->
  <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
  <script src="assets/plugins/jquery/jquery-3.5.1.min.js"></script>
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/plugins/simplebar/simplebar.min.js"></script>
  <script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
  <script src="assets/plugins/slick/slick.min.js"></script>
  <script src="assets/plugins/swiper/swiper-bundle.min.js"></script>

  <!-- Option Switcher -->
  <script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

  <!-- Ekka Custom -->
  <script src="assets/js/ekka.js"></script>
</body>
</html>
