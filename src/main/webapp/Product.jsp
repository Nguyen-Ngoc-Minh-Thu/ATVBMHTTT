<%@ page import="Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Product product = (Product)request.getAttribute("product"); %>
<% String category = (String) request.getAttribute("category"); %>
<% String categoryName = (String) request.getAttribute("namecategory"); %>
<% List<Product> list = (List<Product>) request.getAttribute("listproduct"); %>
<html>
<head>
    <title><%=product.getName()%>></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="../CSS/stylesheet.css">
    <script src="../JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" media="screen">
    <script src="../Bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="JQuery/jquery.elevateZoom.min.js" type="text/javascript"></script>
    <script src="JS/owl.carousel.min.js" type="text/javascript"></script>
    <script src="../JS/Custom.js" type="text/javascript"></script>
    <link rel="stylesheet" href="CSS/owl.carousel.min.css">
</head>
<body>
    <jsp:include page="Layout/Header.jsp" />
    <div id="product-product" class="container">
        <ul class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
            <li><a href="ListProduct?category=<%=category%>"><%=categoryName%></a></li>
            <li><a href=""><%=product.getName()%></a></li>
        </ul>
        <div class="row">
            <div id="content" class="col-sm-12">

                <div class="row">

                    <div class="col-sm-6 product-left">
                        <div class="thumbnails">
                            <div class="pro-image" width="360" height="540">
                                <a href="<%=product.getImages().get(0)%>"
                                   title="thatlungdabo" class="thumbnail">
                                    <img src="<%=product.getImages().get(0)%>"
                                         title="thatlung" id="zoom" alt="thatlung"
                                         data-zoom-image="<%=product.getImages().get(0)%>"  />
                                </a>
                            </div>
                            <div id="additional-carousel" class="owl-carousel owl-theme thumbnails-gellery clearfix">
                                <% for(String link: product.getImages()) { %>
                                    <div class="image-additional">
                                    <a href="<%=link%>"
                                       title="party wear" class="elevatezoom-gallery"
                                       data-image="<%=link%>"
                                       data-zoom-image="<%=link%>">
                                        <img src="<%=link%>"
                                             title="party wear" alt="party wear" width="90" height="100" />
                                    </a>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 right-info">
                        <h1 class="product_title"><%=product.getName()%></h1>
                        <ul class="list-unstyled product-manufacturer">
                            <li><span class="disc">Thương hiệu: </span><%=product.getBrand()%>
                            </li>

                            <li><span class="disc">Mã sản phẩm: </span> <span class="disc1"><%=product.getId()%></span></li>
                            <li><span class="disc">Tình trạng: </span><span class="disc1"><%=product.getStock()%></span></li>
                        </ul>

                        <ul class="list-unstyled product_price">
                            <% if(product.getPrice_buy()!=product.getPrice()){ %>
                            <li>
                                <span class="pro_oldprice" style="text-decoration: line-through;"><%=product.getPrice()%>&nbsp;VNĐ</span>
                                <span class="pro_price"><%=product.getPrice_buy()%>&nbsp;VNĐ</span>
                            </li>
                            <% } else { %>
                            <span class="pro_price"><%=product.getPrice_buy()%>&nbsp;VNĐ</span>
                            <% } %>
                            <li><span class="disc"><label id="box"><%=product.getQuantity()%></label> sản phẩm có sẵn</span></li>
                        </ul>
                        <div id="product" class="product-options">
                            <div class="form-group clearfix">
                                <form action="/Cart?id=<%=product.getId()%>" method="post">
                                <div class="product-btn-quantity">
                                    <button class="minus" id="minus"><i class="fa fa-minus" aria-hidden="true" onclick="minus()"></i></button>
                                    <input type="text" name="quantity" value="1" min="1" size="2" id="input-quantity"
                                           class="form-control" />
                                    <button class="plus" id="plus"><i class="fa fa-plus" aria-hidden="true" onclick="plus()"></i></button>
                                    <% if(!product.getStock().equals("Hết hàng")) { %>
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">
                                        &nbsp;<span class="">Thêm vào giỏ hàng</span></button>
                                    <% } else { %>
                                    <label class="btn btn-primary btn-lg btn-block" style="background-color: #5e5e5e"> &nbsp;<span class="">Hết hàng</span>s</label>
                                    <% } %>
                                </div>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style" data-url="Product">

                            <a class="addthis_counter addthis_pill_style"></a>
                        </div>
                        <script type="text/javascript"
                                src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                        <!-- AddThis Button END -->
                    </div>
                </div>

                <div class="tab-block">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-description" data-toggle="tab">Mô tả</a></li>
                    </ul>
                    <div class="tab-content clearfix">
                        <div class="tab-pane active" id="tab-description">
                            <div>
                                <%=product.getDetail()%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="related-products-block">
                    <div class="page-title">
                        <h2>SẢN PHẨM LIÊN QUAN</h2>
                    </div>
                    <div class="row">
                        <div id="related-carousel" class="related-carousel clearfix" data-items="4">
                            <% for(Product p : list){ %>
                                <div class="product-layout col-xs-12">
                                <div class="product-thumb transition">
                                    <div class="image">
                                        <a href="Product?id=<%=p.getId()%>">
                                            <img src="<%=p.getImages().get(0)%>"
                                                 alt="thatlung" title="thatlung" class="img-responsive" />
                                            <% if(p.getImages().size()==1){ %>
                                                <img class="img-responsive hover-img"
                                                 src="<%=p.getImages().get(0)%>"
                                                 title="thatlung" alt="thatlung" />
                                            <% } else { %>
                                                <img class="img-responsive hover-img"
                                                 src="<%=p.getImages().get(0)%>"
                                                 title="thatlung" alt="thatlung" />
                                            <% } %>
                                        </a>
                                        <div class="product-item-addcart">
                                            <button type="button" class="addcart" onclick="cart.add();"><span>Thêm
													vào giỏ hàng</span></button>
                                        </div>
                                    </div>
                                    <div class="thumb-description clearfix">
                                        <div class="caption">
                                            <h4><a href="Product?id=<%=p.getId()%>"><%=p.getName()%></a></h4>
                                            <% if(p.getPrice_buy()!=p.getPrice()){ %>
                                            <span class="pro_oldprice"
                                                  style="text-decoration: line-through;"><%=p.getPrice()%>>&nbsp;VNĐ</span>
                                            <p class="price">
                                                <%=p.getPrice_buy()%>&nbsp;VNĐ
                                            </p>
                                            <% } else { %>
                                            <p class="price">
                                                <%=p.getPrice_buy()%>&nbsp;VNĐ
                                            </p>
                                            <% } %>
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


    <script>

        let amountElement = document.getElementById('input-quantity');
        let amount = amountElement.value;
        let render = function (amount) {

            amountElement.value = amount;


        }

        let minus = function () {

            if (amount > 1)
                amount--
            render(amount);

        }

        let plus = function () {
            amount++
            render(amount);
        }

        amountElement.addEventListener('input', () => {


            amount = amountElement.value;


            amount = (isNaN(amount) || amount == 0) ? 1 : amount;
            amount = parseInt(amount);
            console.log(amount);
            render(amount);
        });

    </script>





    <!-- M-Custom script -->
    <script type="text/javascript">
        // Additional images
        const direction = $('html').attr('dir');
        $('#additional-carousel').each(function () {
            const items = $(this).data('items') || 4;
            const sliderOptions = {
                loop: false,
                nav: true,
                navText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
                dots: false,
                items: 4,
                responsiveRefreshRate: 200,
                responsive: {
                    0: { items: 1 },
                    320: { items: 2 },
                    425: { items: 3 },
                    480: { items: 3 },
                    767: { items: 4 },
                    768: { items: 3 },
                    991: { items: 3 },
                    992: { items: 3 },
                    1201: { items: 4 }
                }
            };
            if (direction == 'rtl') sliderOptions['rtl'] = true;
            $(this).owlCarousel(sliderOptions);
        });

        $('.related-carousel').each(function () {
            if ($(this).closest('#column-left').length == 0 && $(this).closest('#column-right').length == 0) {
                $(this).addClass('owl-carousel owl-theme');
                const items = $(this).data('items') || 4;
                const sliderOptions = {
                    loop: false,
                    nav: true,
                    navText: ['<i class="fa fa-angle-left" aria-hidden="true">', '<i class="fa fa-angle-right" aria-hidden="true">'],
                    dots: false,
                    items: items,
                    responsiveRefreshRate: 200,
                    responsive: {
                        0: { items: 1 },
                        481: { items: ((items - 2) > 1) ? (items - 2) : 1 },
                        767: { items: ((items - 2) > 1) ? (items - 2) : 1 },
                        768: { items: ((items - 2) > 1) ? (items - 2) : 1 },
                        991: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1024: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1201: { items: items }
                    }
                };
                if (direction == 'rtl') sliderOptions['rtl'] = true;
                $(this).owlCarousel(sliderOptions);
            }
        });

        $(document).ready(function () {
            if ($(window).width() > 767) {
                $("#zoom").elevateZoom({
                    zoomType: "inner",
                    cursor: "crosshair",
                    gallery: 'additional-carousel',
                    galleryActiveClass: 'active'
                });

                var image_index = 0;
                $(document).on('click', '.thumbnail', function () {
                    $('.thumbnails').magnificPopup('open', image_index);
                    return false;
                });

                $('#additional-carousel a').click(function () {
                    var smallImage = $(this).attr('data-image');
                    var largeImage = $(this).attr('data-zoom-image');
                    var ez = $('#zoom').data('elevateZoom');
                    $('.thumbnail').attr('href', largeImage);
                    ez.swaptheimage(smallImage, largeImage);
                    image_index = $(this).index('#additional-carousel a');
                    return false;
                });
            } else {
                $(document).on('click', '.thumbnail', function () {
                    $('.thumbnails').magnificPopup('open', 0);
                    return false;
                });
            }
        });

        $(document).ready(function () {
            $('.thumbnails').magnificPopup({
                type: 'image',
                delegate: 'a.elevatezoom-gallery',
                gallery: {
                    enabled: true
                }
            });
        });

       </script>
<jsp:include page="Layout/Footer.jsp"></jsp:include>
</body>
</html>
