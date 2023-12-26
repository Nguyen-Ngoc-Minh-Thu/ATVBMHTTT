<%@ page import="Entity.Product" %>
<%@ page import="Dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ</title>

    <script src="../catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="../catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script src="../catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
          rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="../catalog/view/javascript/mahardhi/jquery.elevateZoom.min.js"></script>
    <script src="../catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
    <script src="../catalog/view/javascript/mahardhi/owl.carousel.min.js"></script>
    <script type="text/javascript" src="../catalog/view/javascript/mahardhi/quickview.js"></script>
    <link href="../catalog/view/theme/mahardhi/stylesheet/mahardhi/owl.carousel.min.css" rel="stylesheet">
    <link href="../catalog/view/theme/mahardhi/stylesheet/mahardhi/owl.theme.default.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../catalog/view/javascript/jquery/magnific/magnific-popup.css">
    <script type="text/javascript" src="../catalog/view/javascript/mahardhi/mahardhi_search.js"></script>
    <link href="../catalog/view/theme/mahardhi/stylesheet/stylesheet.css" rel="stylesheet">
    <link href="../catalog/view/theme/mahardhi/stylesheet/themify-icons.css" rel="stylesheet" />
    <link href="../catalog/view/theme/mahardhi/stylesheet/animate.min.css" rel="stylesheet" />
    <link href="../catalog/view/javascript/jquery/swiper/css/swiper.min.css" type="text/css" rel="stylesheet"
          media="screen" />
    <link href="../catalog/view/javascript/jquery/swiper/css/opencart.css" type="text/css" rel="stylesheet"
          media="screen" />
    <script src="../catalog/view/javascript/jquery/swiper/js/swiper.jquery.js" type="text/javascript"></script>
    <script src="../catalog/view/javascript/mahardhi/tabs.js" type="text/javascript"></script>
    <script src="../catalog/view/javascript/mahardhi/jquery.cookie.js" type="text/javascript"></script>
    <script src="../catalog/view/javascript/common.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../catalog/view/theme/mahardhi/stylesheet/mahardhi/jquery-ui.min.css">

    <script src="../catalog/view/javascript/mahardhi/jquery-ui.min.js"></script>

    <script type="text/javascript" src="../catalog/view/javascript/mahardhi/custom.js"></script>
</head>
<body>
<% ProductDao dao = new ProductDao();
    List<Product> list = dao.getProductsBestSeller(10);
%>
<jsp:include page="Layout/Header.jsp"/>
<div id="common-home">
    <div class="swiper-viewport slideshow">
        <div id="slideshow0" class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide text-center">
                    <a href="#"><img
                            src="Image/image_web/banner1.jpg"
                            alt="Main-banner1" class="img-responsive" /></a>
                </div>
                <div class="swiper-slide text-center">
                    <a href="#"><img
                            src="Image/image_web/banner2.jpg"
                            alt="Main-banner2" class="img-responsive" /></a>
                </div>
                <div class="swiper-slide text-center">
                    <a href="#"><img
                            src="Image/image_web/banner3.jpg"
                            alt="Main-banner2" class="img-responsive" /></a>
                </div>
            </div>
        </div>
        <div class="swiper-pagination slideshow0"></div>
        <div class="swiper-pager">
            <div class="swiper-button-prev"><i class="fa fa-angle-left"></i></div>
            <div class="swiper-button-next"><i class="fa fa-angle-right"></i></div>
        </div>
    </div>
    <script type="text/javascript">
        $('#slideshow0').swiper({
            mode: 'horizontal',
            slidesPerView: 1,
            pagination: '.slideshow0',
            paginationClickable: true,
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            spaceBetween: 0,
            autoplay: 2500,
            autoplayDisableOnInteraction: true,
            loop: true
        });

    </script>

    <div>
        <div class="promo-box-section section-padding-sm">
            <div class="container">
                <!-- box1 -->
                <div class="col-xs-4 promo-item mb-sm-30">
                    <div class="promo-box">
                        <div class="promo-icon"><i class="fa-sharp fa-solid fa-truck-fast"></i></div>
                        <div class="promo-info">
                            <h6><a href="#">Miễn phí vận chuyển</a></h6>
                            <p>Đơn hàng trên 500.000đ</p>
                        </div>
                    </div>
                </div><!-- box1 -->
                <div class="col-xs-4 promo-item mb-sm-30">
                    <div class="promo-box">
                        <div class="promo-icon"><i class="fa-solid fa-handshake"></i></div>
                        <div class="promo-info">
                            <h6><a href="#">Bảo hành chính hãng</a></h6>
                            <p>Áp dụng toàn quốc</p>
                        </div>
                    </div>
                </div><!-- box1 -->
                <div class="col-xs-4 promo-item">
                    <div class="promo-box">
                        <div class="promo-icon"><i class="fa-solid fa-headset"></i></div>
                        <div class="promo-info">
                            <h6><a href="#">Hỗ trợ 24/7</a></h6>
                            <p>Hỗ trợ tận tâm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="product-tab-block">
        <div class="container">
            <div class="row main-tab">
                <div class="box product-tabs product-tab-box">
                    <div class="page-title">
                        <h2>SẢN PHẨM HÀNG ĐẦU</h2>
                    </div>
                    <div id="tabs" class="mahardhi-tabs">
                        <ul class="nav nav-tabs top-product-tab">
                            <li>
                                <a href="#tab-featured" data-toggle="tab">Bán chạy nhất</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="tab-featured" class="tab-pane">
                            <div id="featuredTabCarousel" class="box-product  product-tab-carousel  clearfix">
                                <%for(Product p :list){%>
                                <div class="product-layouts col-xs-12">
                                    <div class="product-thumb transition">
                                        <div class="item-inner">
                                            <div class="image">
                                                <a
                                                        href="Product?id=<%=p.getId()%>">
                                                    <img style="width: 280px; height: 280px" src="<%=p.getImages().get(0)%>"
                                                         alt="ladies shirt" title="ladies shirt"
                                                         class="img-responsive" />
                                                    <% if(p.getImages().size()==1){%>
                                                    <img style="width: 280px; height: 280px" class="img-responsive hover-img"
                                                         src="<%=p.getImages().get(0)%>"
                                                         title="ladies shirt" alt="ladies shirt" />
                                                    <% }else { %>
                                                    <img style="width: 280px; height: 280px" class="img-responsive hover-img"
                                                         src="<%=p.getImages().get(1)%>"
                                                         title="ladies shirt" alt="ladies shirt" />
                                                    <% } %>
                                                </a>
                                                <div class="product-item-addcart">
                                                    <a href="Cart?id=<%=p.getId()%>" class="addcart">Thêm vào giỏ
                                                        hàng</a>
                                                </div>
                                            </div>
                                            <div class="thumb-description clearfix">
                                                <div class="caption">
                                                    <h4 class="product_name"><a
                                                            href="<Product?id=<%=p.getId()%>>"><%=p.getName()%></a>
                                                    </h4>
                                                    <br>
                                                    <h5>Đã bán: <%=p.getProduct_sold()%> sản phẩm</h5>
                                                    <p class="price">
                                                        <% if(p.getPrice_buy()==p.getPrice()){ %>
                                                        <span class="price-new"><%=p.getPrice_buy()%>VNĐ</span>
                                                        <%} else { %>
                                                        <span class="price-new"><%=p.getPrice_buy()%>VNĐ</span>
                                                        <span class="price-old"><%=p.getPrice()%>VNĐ</span>
                                                        <% } %>

                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $('#tabs a').tabs();

        // set slider
        const direction = $('html').attr('dir');
        $('.product-tab-carousel').each(function () {
            if ($(this).closest('#column-left').length == 0 && $(this).closest('#column-right').length == 0) {
                $(this).addClass('owl-carousel owl-theme');
                const items = $(this).data('items') || 4;
                const sliderOptions = {
                    loop: false,
                    nav: true,
                    navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
                    dots: false,
                    items: items,
                    responsiveRefreshRate: 200,
                    responsive: {
                        0: { items: 1 },
                        481: { items: ((items - 2) > 1) ? (items - 2) : 1 },
                        769: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        991: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1150: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1024: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1200: { items: items }
                    }
                };
                if (direction == "rtl") sliderOptions['rtl'] = direction;
                $(this).owlCarousel(sliderOptions);
            }
        });
    </script>
    <div>
        <div class="parallex-banner section-padding overlay-black40 parallex-img bg-fixed parallax"
             data-image-src="Image/image_web/parallax.jpg"
             style="background-image: url('Image/image_web/parallax.jpg'); background-size:100%;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 parallex-description">
                        <div class="parallex-inner">
                            <div class="parallex-inner-logo"><img src="Image/image_web/logoshop.png" alt=""></div>
                            <div class="parallex-inner-descritpion">
                                <p>Thắt lưng nam tức các mẫu thắt lưng da nam làm từ chất liệu da thật. Các sản phẩm
                                    ví thương hiệu FTT leather hiện đã cập nhật tại toàn bộ cửa hàng của FTT
                                    leather. Ngoài chất liệu 100% da thật, phong phú về chủng loại như dây lưng da,
                                    thắt lưng da cá sấu, thắt lưng cá sấu, thắt lưng đà điểu, thắt lưng da bò, dây
                                    lưng da cá sấu….</p>
                                <p>Thắt lưng nam là sản phẩm đồng hành cùng nam giới. Hiện nay có rất nhiều loại
                                    thắt lưng da bò, thắt lưng da cá sấu, thắt lưng đà điểu… Ngoài ra lại còn có các
                                    kiểu dây lưng mặt trượt, mặt thắt lưng xỏ kim, dây lưng có khấc… Nhưng mỗi mẫu
                                    thắt lưng da nam và mỗi loại chất liệu dây lưng da lại có một đặc điểm, phù hợp
                                    với một vài người khác nhau. Vậy nên chọn thắt lưng da nam là không hề đơn giản
                                </p>
                            </div><a href="#" class="btn btn-default btn-color mt-25">Mua sắm ngay bây giờ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-padding brand-section gray-bg">
        <div class="container">
            <div class="carousel">
                <div class="page-title">
                    <h2>CỘNG SỰ HỢP TÁC CỦA CHÚNG TÔI</h2>
                </div>
                <div class="swiper-viewport"
                     style="max-height: 80px">
                    <div id="carousel0" class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/06-170x70.jpg"
                                         alt="Disney" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/06-170x70.jpg"
                                         alt="Canon" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/05-170x70.jpg"
                                         alt="Burger King" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/04-170x70.jpg"
                                         alt="Coca Cola" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/03-170x70.jpg"
                                         alt="Sony" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/02-170x70.jpg"
                                         alt="RedBull" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://opencart.mahardhi.com/MT01/adi/image/cache/catalog/brand/01-170x70.jpg"
                                         alt="NFL" class="img-responsive m-auto" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination carousel0"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#carousel0').swiper({
            mode: 'horizontal',
            slidesPerView: 6,

            paginationClickable: false,
            nextButton: '',
            prevButton: '',
            autoplay: 2500,
            autoplayDisableOnInteraction: true,
            loop: true,
            breakpoints: {
                1201: {
                    slidesPerView: 4,
                    spaceBetween: 40
                },
                992: {
                    slidesPerView: 4,
                    spaceBetween: 30
                },
                768: {
                    slidesPerView: 3,
                    spaceBetween: 30
                },
                640: {
                    slidesPerView: 2,
                    spaceBetween: 10
                },
                320: {
                    slidesPerView: 1,
                    spaceBetween: 10
                }
            }
        });
    </script>
    <div class="container">
        <div class="row">


        </div>
    </div>
</div>


<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
