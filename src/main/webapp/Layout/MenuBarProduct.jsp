<%@ page import="Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.ProductDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ProductDao dao = new ProductDao();
    List<Product> list = dao.getProductsBestSeller();
%>
<aside id="column-left" class="col-sm-3 hidden-xs">
    <div class="category-list widget-sidebar"><a href="ListProduct">
        <h3 class="toggled relative">TẤT CẢ SẢN PHẨM</h3>
    </a></div>
    <div class="category-list widget-sidebar">
            <a href="ListProduct?category=thatlung">
                <h4 class="toggled relative">&nbsp;THẮT LƯNG NAM</h4>
            </a>
    </div>
        <div class="category-list widget-sidebar">
            <a href="ListProduct?category=matthatlung">
                <h4 class="toggled relative">&nbsp;MẶT THẮT LƯNG</h4>
            </a>
        </div>
            <div class="category-list widget-sidebar">
            <a href="ListProduct?category=daythatlung">
                <h4 class="toggled relative">&nbsp;DÂY THẮT LƯNG RỜI</h4>
            </a>
    </div>
    <div class="box widget-sidebar">
        <div class="box-heading">
            <div class="box-content special">
                <div class="page-title toggled">
                    <h3 class="relative">Bán chạy nhất</h3>
                </div>
                <div class="block_box">
                    <div class="row">
                        <div id="special-carousel" class="box-product  clearfix" data-items="4">
                            <% for(Product p: list){ %>
                                <div class="product-layout col-lg-3 col-md-4 col-sm-4 col-xs-6">
                                <div class="product-thumb transition clearfix">
                                    <div class="image">
                                        <a href="Product?id=<%=p.getId()%>"><img
                                                src="<%=p.getImages().get(0)%>"
                                                alt="thatlung" title="thatlung"
                                                class="img-responsive" /></a>
                                    </div>
                                    <div class="thumb-description clearfix">
                                        <div class="caption">
                                            <h4 class="product-title"><a
                                                    href="Product?id=<%=p.getId()%>"><%=p.getName()%></a>
                                            </h4>
                                            <label>Đã bán <%=p.getProduct_sold()%></label>
                                            <% if(p.getPrice_buy()!=p.getPrice()) { %>
                                            <p class="price">
                                                <span class="price-new"><%=p.getPrice_buy()%>&nbsp;VNĐ</span> <span
                                                    class="price-old"><%=p.getPrice()%>&nbsp;VNĐ</span>
                                            </p>
                                            <% } else { %>
                                            <p class="price">
                                                <span class="price-new"><%=p.getPrice_buy()%>&nbsp;VNĐ</span>
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

    <div class="swiper-viewport widget-sidebar">
        <div id="banner0" class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="index.jsp"><img src="../Image/image_web/banner.png" alt="left banner"
                                                   class="img-responsive" /></a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        if ($('#banner0 .swiper-slide').length > 1) {
            $('#banner0').swiper({
                effect: 'fade',
                autoplay: 2500,
                autoplayDisableOnInteraction: false
            });
        }
    </script>

</aside>
