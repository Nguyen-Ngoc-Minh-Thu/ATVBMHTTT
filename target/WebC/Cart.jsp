<%@ page import="Entity.Cart" %>
<%@ page import="Dao.ProductDao" %>
<%@ page import="Entity.Product" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");
  int sumTotal=0;
%>
<html>
<head>
  <title>Giỏ hàng</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
  <jsp:include page="Layout/Header.jsp"/>
  <div id="cart" class="container">
    <ul class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
      <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
      <li><a href="Cart">Giỏ hàng</a></li>
    </ul>
    <div class="row">
      <jsp:include page="Layout/MenuBarProduct.jsp" />
      <div id="content" class="col-sm-9 checkout">
        <h2 class="page_title">Giỏ hàng của tôi </h2>
        <form action="" method="post" >
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
              <tr>
                <td class="text-center">Hình ảnh</td>
                <td class="text-left">Tên sản phẩm</td>
                <td class="text-left">Mã sản phẩm</td>
                <td class="text-left" >Số lượng</td>
                <td class="text-right">Giá</td>
                <td class="text-right">Tổng cộng</td>
              </tr>
              </thead>
              <tbody>
                    <% if(!cart.getCart().isEmpty()){
                      ProductDao dao = new ProductDao();
                      Product product;
                      Set<String> set = cart.getCart().keySet();
                      int total=0;
                      for(String id : set){
                          product = dao.getProduct(id);
                          total=product.getPrice_buy()*cart.getCart().get(id);%>

                        <tr>
                              <td class="text-center"> <a href="Product?id=<%=product.getId()%>"><img src="<%=product.getImages().get(0)%>" alt="thatlung" title="thatlung" class="img-thumbnail"></a> </td>
                      <td class="text-left"><a href="Product?id=<%=product.getId()%>"><%=product.getName()%></a>
                        <br>
                      </td>
                      <td class="text-left"><%=product.getId()%></td>
                      <td class="text-left">
                        <div class="input-group btn-block" style="max-width: 200px;">
                          <input type="number" name="quantity" value="<%=cart.getCart().get(id)%>" min="1" size="1"
                                 class="form-control" style="width:70px">
                          <span class="input-group-btn">
												<button type="submit" data-toggle="tooltip" title=""
                                                        class="btn btn-danger" data-original-title="Update"
                                                        style="background-color: #0e5ba4;"><i
                                                        class="fa fa-refresh"></i></button>
												<button type="button" data-toggle="tooltip" title=""
                                                        class="btn btn-danger" onclick="cart.remove('434');"
                                                        data-original-title="Remove"><i
                                                        class="fa fa-times-circle"></i></button>
											</span>
                        </div>
                      </td>
                      <td class="text-right"><%=product.getPrice_buy()%>&nbsp;VNĐ</td>
                      <td class="text-right"><%=total%>&nbsp;VNĐ</td>
                    </tr>
                  <% }
                    sumTotal = cart.getTotalSum();
                    } %>
              </tbody>

            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-4 col-sm-offset-8">
            <table class="table table-bordered">
              <tbody>
              <tr>
                <td class="text-left cart-total-title"> Tổng cộng:</td>
                <td class="text-right cart-total-price"><%=sumTotal%>&nbsp;VNĐ</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="ListProduct" class="btn btn-default">Tiếp tục mua sắm</a></div>
          <% if(!cart.getCart().isEmpty()){ %>
            <div class="pull-right"><a href="Checkout" class="btn btn-primary">Thanh toán</a></div>
          <% } else {%>
          <div class="pull-right"><label class="btn btn-default">Thanh toán</label></div>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="Layout/Footer.jsp" />
</body>
</html>
