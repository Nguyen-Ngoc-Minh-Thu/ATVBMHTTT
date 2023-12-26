<%@ page import="Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Tìm kiếm</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="CSS/stylesheet.css">
<script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
<script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<div id="product-category" class="container">
    <ul class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
        <li><a href="Search">Search</a></li>
    </ul>
    <div class="row">
        <jsp:include page="/Layout/MenuBarProduct.jsp" />
        <div id="content" class="col-sm-9">
            <h2 class="page_title">Tìm kiếm</h2>
            <label class="control-label" for="input-search">Tiêu chí tìm kiếm</label>
            <div class="row">
                <form action="Search" method="post">
                <div class="col-sm-4">
                    <input type="text" name="search_name" value="" placeholder="Keywords"
                           id="input-search" class="form-control">
                </div>
                <div class="col-sm-3">
                    <select name="category_id" class="form-control">
                        <option value="All">Tất cả danh mục</option>
                        <option value="3">Thắt lưng nam</option>
                        <option value="2">Mặt thắt lưng</option>
                        <option value="1">Dây thắt lưng</option>
                    </select>
                </div>
            <input type="submit" value="Tìm kiếm" id="button-search" class="btn btn-primary">
            </form>
                <div class="rows cat-products clearfix">
                    <% List<Product> list = (List<Product>) request.getAttribute("list");
                        String text = (String) request.getAttribute("text");
                        String cate = (String) request.getAttribute("id");
                        if(list==null){ %>
                    <h3>Không tìm thấy sản phẩm có từ khóa là "<%=text%>" trong <%=cate%></h3>
                    <% } else { %>
                    <h3>Sản phẩm có từ khóa là "<%=text%>" trong <%=cate%></h3>     <%
                        for(Product p: list){ %>
                    <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="product-thumb">
                            <div class="image">
                                <a
                                        href="Product?id=<%=p.getId()%>">
                                    <img src="<%=p.getImages().get(0)%>"
                                         alt="thatlung" title="thatlung" class="img-responsive">
                                    <% if(p.getImages().size()==1){ %>
                                    <img class="img-responsive hover-img"
                                         src="<%= p.getImages().get(0)%>"
                                         title="thatlung" alt="thatlung">
                                    <%} else { %>
                                    <img class="img-responsive hover-img"
                                         src="<%= p.getImages().get(1)%>"
                                         title="thatlung" alt="thatlung">
                                    <% } %>
                                </a>
                                <div class="product-item-addcart">
                                    <a href="Cart?id=<%=p.getId()%>" class="addcart">
                                        <span>Thêm vào giỏ hàng</span>
                                    </a>
                                </div>
                            </div>
                            <div class="thumb-description clearfix">
                                <div class="caption">
                                    <h4 class="product_name"><a
                                            href="Product?id=<%=p.getId()%>"><%= p.getName()%></a></h4>
                                    <p class="price">
                                        <%= p.getPrice()%>&nbsp;VNĐ
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                    }%>
    </div>
        </div>

</div>
</div>
</div>
<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
