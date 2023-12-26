<%@ page import="Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String category = (String) request.getAttribute("category"); %>
<html>
<head>
  <title><%=category%></title>
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
  <% String id = (String) request.getAttribute("id");
    if(id==null){
      %>
        <li><a href="ListProduct"> <%=category%> </a></li>
    <% } else { %>
        <li><a href="ListProduct?category=<%=id%>"><%=category%></a></li>
    <% } %>
</ul>
  <div class="row">
    <jsp:include page="/Layout/MenuBarProduct.jsp" />
    <div id="content" class="col-sm-9">
      <h2 class="page_title"><%=category%></h2>
      <div class="rows cat-products clearfix">
        <% List<Product> list = (List<Product>) request.getAttribute("list");
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
                <% if(p.getPrice()==p.getPrice_buy()) { %>
                <p class="price">
                  <span class="price-new"><%=p.getPrice_buy()%>&nbsp;VNĐ</span>
                </p>
                <% } else { %>
                <p class="price">
                  <span class="price-new"><%=p.getPrice_buy()%>&nbsp;VNĐ</span> <span
                        class="price-old"><%=p.getPrice()%>&nbsp;VNĐ</span>
                </p>
                <% } %>
              </div>
            </div>
          </div>
        </div>
        <% } %>

<%--        phan trang--%>
<%--        <div class="row pro_pagination clearfix">--%>
<%--          <div class="pagination-wrapper">--%>
<%--            <ul class="pagination">--%>
<%--              <li class="active"><span>1</span></li>--%>
<%--              <li><a--%>
<%--                      href="https://opencart.mahardhi.com/MT01/adi/index.php?route=product/search&amp;search=shirt&amp;page=2">2</a>--%>
<%--              </li>--%>
<%--              <li><a--%>
<%--                      href="https://opencart.mahardhi.com/MT01/adi/index.php?route=product/search&amp;search=shirt&amp;page=2">&gt;</a>--%>
<%--              </li>--%>
<%--              <li><a--%>
<%--                      href="https://opencart.mahardhi.com/MT01/adi/index.php?route=product/search&amp;search=shirt&amp;page=2">&gt;|</a>--%>
<%--              </li>--%>
<%--            </ul>--%>
<%--          </div>--%>
<%--          <div class="result-count">Showing 1 to 12 of 13 (2 Pages)</div>--%>
<%--        </div>--%>
      </div>
    </div>
  </div>
</div>
</div>
<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
