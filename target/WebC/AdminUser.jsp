<%@ page import="Entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="Ekka - Admin Dashboard HTML Template.">

  <title>Thông tin người dùng</title>

  <!-- GOOGLE FONTS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
          href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
          rel="stylesheet">

  <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- Ekka CSS -->
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
        <a href="AdminIndex" title="CVT">
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
            <a class="sidenav-item-link" href="AdminIndex">
              <i class="mdi mdi-view-dashboard-outline"></i>
              <span class="nav-text">Bảng điều khiển</span>
            </a>
            <hr>
          </li>
          <!-- Users -->
          <li class="has-sub active expand">
            <a class="sidenav-item-link" href="javascript:void(0)">
              <i class="mdi mdi-account-group"></i>
              <span class="nav-text">Khách hàng</span> <b class="caret"></b>
            </a>
            <div class="collapse show">
              <ul class="sub-menu" id="users" data-parent="#sidebar-menu">
                <li class="active">
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
          <li class="has-sub">
            <a class="sidenav-item-link" href="javascript:void(0)">
              <i class="mdi mdi-palette-advanced"></i>
              <span class="nav-text">Các sản phẩm</span> <b class="caret"></b>
            </a>
            <div class="collapse">
              <ul class="sub-menu" id="products" data-parent="#sidebar-menu">
                <li class="">
                  <a class="sidenav-item-link" href="AdminAddProduct.jsp">
                    <span class="nav-text">Thêm sản phẩm</span>
                  </a>
                </li>
                <li class="">
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
<% Account account = (Account) request.getAttribute("account");
  List<Order> list = (List<Order>) request.getAttribute("listorder"); %>
    <!-- CONTENT WRAPPER -->
    <div class="ec-content-wrapper">
      <div class="content">
        <div class="breadcrumb-wrapper breadcrumb-contacts">
          <div>
            <h1>Thông tin người dùng</h1>
          </div>

        </div>
        <div class="card bg-white profile-content">
          <div class="row">
            <div class="col-lg-4 col-xl-3">
              <div class="profile-content-left profile-left-spacing">
                <div class="text-center widget-profile px-0 border-0">
                  <div class="card-body">
                    <h4 class="py-2 text-dark"><%=account.getFullName()%></h4>
                    <p style="white-space: nowrap;"><%=account.getUsername()%></p>
                  </div>
                </div>

                <div class="d-flex justify-content-between ">
                  <div class="text-center pb-4">
                    <h6 class="text-dark pb-2"><%=list.size()%></h6>
                    <p>Đơn hàng đã mua</p>
                  </div>
                </div>

                <hr class="w-100">

                <div class="contact-info pt-4">
                  <h5 class="text-dark">Thông tin liên lạc</h5>
                  <p class="text-dark font-weight-medium pt-24px mb-2">Địa chỉ email</p>
                  <p><%=account.getUsername()%></p>
                  <p class="text-dark font-weight-medium pt-24px mb-2">Số điện thoại</p>
                  <p><%=account.getPhoneNumber()%></p>
                </div>
              </div>
            </div>

            <div class="col-lg-8 col-xl-9">
              <div class="profile-content-right profile-right-spacing py-5">
                <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myProfileTab"
                    role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="profile-tab" data-bs-toggle="tab"
                            data-bs-target="#profile" type="button" role="tab"
                            aria-controls="profile" aria-selected="true">Hồ sơ</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="settings-tab" data-bs-toggle="tab"
                            data-bs-target="#settings" type="button" role="tab"
                            aria-controls="settings" aria-selected="false">Chỉnh sửa</button>
                  </li>
                </ul>
                <div class="tab-content px-3 px-xl-5" id="myTabContent">

                  <div class="tab-pane fade show active" id="profile" role="tabpanel"
                       aria-labelledby="profile-tab">
                    <div class="tab-widget mt-5">
                      <div class="row">
                        <div class="col-xl-4">
                          <div class="media widget-media p-3 bg-white border">
                            <div class="icon rounded-circle mr-3 bg-primary">
                              <i class="mdi mdi-account-outline text-white "></i>
                            </div>

                            <div class="media-body align-self-center">
                              <h4 class="text-primary mb-2"><%=list.size()%></h4>
                              <p>Đơn hàng đã mua</p>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-xl-12">

                          <!-- Notification Table -->
                          <div class="card card-default">
                            <div class="card-header justify-content-between mb-1">
                              <h2>Thông báo mới nhất</h2>
                            </div>
                            <div class="card-body compact-notifications" data-simplebar
                                 style="height: 434px;">
                              <% for(Order order : list){ %>
                              <div
                                      class="media pb-3 align-items-center justify-content-between">
                                <div
                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
                                  <i
                                          class="mdi mdi-cart-outline font-size-20"></i>
                                </div>
                                <div class="media-body pr-3 ">
                                  <a class="mt-0 mb-1 font-size-15 text-dark"
                                     href="#">Đơn hàng mới. Tình trạng: <%=order.getStatus()%></a>
                                  <p><%=account.getFullName()%> đã đặt 1 đơn hàng mới</p>
                                </div>
                                <span class=" font-size-12 d-inline-block"><%=order.getTime().toString()%>&nbsp;&nbsp;
																		<%=order.getDate().toString()%></span>
                              </div>
                              <% } %>
                            </div>
                            <div class="mt-3"></div>
                          </div>

                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="tab-pane fade" id="settings" role="tabpanel"
                       aria-labelledby="settings-tab">
                    <div class="tab-pane-content mt-5">
                      <form action="AdminEditUser?id=<%=account.getUsername()%>", method="post">
                        <div class="form-group mb-4">
                          <label>Họ và tên</label>
                          <input type="fullname" class="form-control" id="fullname" name="fullname"
                                 value="<%=account.getFullName()%>">
                        </div>

                        <div class="form-group mb-4">
                          <label>Email</label>
                          <label class="form-control"><%=account.getUsername()%></label>
                        </div>
                        <div class="form-group mb-4">
                          <label>Số điện thoại</label>
                          <input type="text" class="form-control" id="phone" name="phone"
                                 value="<%=account.getPhoneNumber()%>">
                        </div>
                        <div>
                        <label class="col-sm-2 control-label">Giới tính</label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="sex" value="1" <% if(account.getSex()==1){%> checked="checked"<%}%>/>
                            Nam</label>
                          <label class="radio-inline">
                            <input type="radio" name="sex" value="0" <% if(account.getSex()==0){%> checked="checked"<%}%>/>
                            Nữ</label>
                        </div>

                        <br>
                          <div>
                            <label class="col-sm-2 control-label">Kích hoạt tài khoản</label>
                            <div class="col-sm-10">
                              <label class="radio-inline">
                                <input type="radio" name="enabled" value="1" <% if(account.getEnable()==1){%> checked="checked"<%}%>/>
                                Có</label>&nbsp;&nbsp;&nbsp;&nbsp;
                              <label class="radio-inline">
                                <input type="radio" name="enabled" value="0" <% if(account.getEnable()==0){%> checked="checked"<%}%>/>
                                Không</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mt-5">
                          <button type="submit"
                                  class="btn btn-primary mb-2 btn-pill">Cập nhật hồ sơ</button>
                        </div>
                        </div>
                      </form>
                    </div>
                  </div>

                </div>
              </div>
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
                                                        href="https://www.facebook.com/nguyendaccuong2002/" target="_blank"> Nguyen Dac Cuong</a>.
        </p>
      </div>
    </footer>

  </div> <!-- End Page Wrapper -->
</div> <!-- End Wrapper -->


<!-- Common Javascript -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="assets/plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/simplebar/simplebar.min.js"></script>
<script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>

</body>
</html>
