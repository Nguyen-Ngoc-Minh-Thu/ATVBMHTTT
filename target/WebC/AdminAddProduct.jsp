<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Ekka - Admin Dashboard HTML Template.">

    <title>Thêm sản phẩm</title>

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

    <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet" />

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
                                <li class="active">
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
        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Thêm sản phẩm</h1>
                        <p class="breadcrumbs"><span><a href="index.html">Trang chủ</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Thêm sản phẩm</p>
                    </div>
                    <div>
                        <a href="AdminListProduct" class="btn btn-primary"> Xem tất cả sản phẩm
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Thêm sản phẩm</h2>
                            </div>

                            <div class="card-body">
                                <div class="row ec-vendor-uploads">
                                    <form action="AdminAddProduct" method="post" enctype="multipart/form-data">
                                    <div class="col-lg-4">
                                        <div class="ec-vendor-img-upload">
                                            <div class="ec-vendor-main-img">
                                                <div class="thumb-upload-set colo-md-12">
                                                    <div class="thumb-upload">
                                                        <div class="thumb-edit">
                                                            <input type='file' id="thumbUpload01"
                                                                   class="ec-image-upload" name="image1"
                                                                   accept=".png, .jpg, .jpeg" required/>
                                                            <label><img
                                                                    src="assets/img/icons/edit.svg"
                                                                    class="svg_img header_svg" alt="edit" /></label>
                                                        </div>
                                                        <div class="thumb-preview ec-preview">
                                                            <div class="image-thumb-preview">
                                                                <img class="image-thumb-preview ec-image-preview"
                                                                     src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                     alt="edit" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="thumb-upload">
                                                        <div class="thumb-edit">
                                                            <input type='file' id="thumbUpload02"
                                                                   class="ec-image-upload" name="image2"
                                                                   accept=".png, .jpg, .jpeg" />
                                                            <label><img
                                                                    src="assets/img/icons/edit.svg"
                                                                    class="svg_img header_svg" alt="edit" /></label>
                                                        </div>
                                                        <div class="thumb-preview ec-preview">
                                                            <div class="image-thumb-preview">
                                                                <img class="image-thumb-preview ec-image-preview"
                                                                     src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                     alt="edit" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="thumb-upload">
                                                        <div class="thumb-edit">
                                                            <input type='file' id="thumbUpload03"
                                                                   class="ec-image-upload" class="image3"
                                                                   accept=".png, .jpg, .jpeg" />
                                                            <label><img
                                                                    src="assets/img/icons/edit.svg"
                                                                    class="svg_img header_svg" alt="edit" /></label>
                                                        </div>
                                                        <div class="thumb-preview ec-preview">
                                                            <div class="image-thumb-preview">
                                                                <img class="image-thumb-preview ec-image-preview"
                                                                     src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                     alt="edit" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="thumb-upload">
                                                        <div class="thumb-edit">
                                                            <input type='file' id="thumbUpload04"
                                                                   class="ec-image-upload" name="image4"
                                                                   accept=".png, .jpg, .jpeg" />
                                                            <label><img
                                                                    src="assets/img/icons/edit.svg"
                                                                    class="svg_img header_svg" alt="edit" /></label>
                                                        </div>
                                                        <div class="thumb-preview ec-preview">
                                                            <div class="image-thumb-preview">
                                                                <img class="image-thumb-preview ec-image-preview"
                                                                     src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                     alt="edit" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="ec-vendor-upload-detail">
                                                <div class="col-md-6">
                                                    <label class="form-label">Tên sản phẩm</label>
                                                    <input type="text" class="form-control slug-title" name="nameproduct" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Chọn loại sản phẩm</label>
                                                    <select name="category" class="form-select" required>
                                                        <option value="3">Thắt lưng nam</option>
                                                        <option value="1">Dây thắt lưng</option>
                                                        <option value="2">Mặt thắt lung</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="col-12 col-form-label">Thương hiệu</label>
                                                    <div class="col-12">
                                                        <input name="brand" class="form-control" type="text" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Giá</label>
                                                    <input type="number" name="price" class="form-control" required>VNĐ
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Giá bán ra</label>
                                                    <input type="number" class="form-control" name="pricebuy" required>VNĐ
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Số lượng</label>
                                                    <input type="number" class="form-control" name="quantity" required>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="form-label">Chi tiết sản phẩm</label>
                                                    <textarea class="form-control" name="detail" rows="4" required></textarea>
                                                </div>
                                                <div class="col-md-12">
                                                    <button type="submit" class="btn btn-primary">Hoàn thành</button>
                                                </div>
                                        </div>
                                    </div>
                                    </form>
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
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/tags-input/bootstrap-tagsinput.js"></script>
<script src="assets/plugins/simplebar/simplebar.min.js"></script>
<script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>
