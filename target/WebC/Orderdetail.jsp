<%@ page import="Entity.ProductOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Order" %>
<%@ page import="Entity.Product" %>
<%@ page import="Dao.ProductDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<ProductOrder> list = (List<ProductOrder>) request.getAttribute("orderdetail");
  Order order = (Order) request.getAttribute("order");
  ProductDao dao = new ProductDao(); %>
<html>
<head>
  <title>Chi tiết đơn hàng</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
  <jsp:include page="Layout/Header.jsp"/>
  <div id="order_detail" class="container">
    <ul class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
      <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
      <li><a href="HistoryOrder">Lịch sử đơn hàng</a></li>
      <li>Chi tiết đơn hàng</li>
    </ul>
    <div class="row">
      <jsp:include page="Layout/MenuBarAccount.jsp" />
      <div id="content" class="col-sm-9">
        <h2 class="page_title">Lịch sử đơn hàng</h2>
        <table class="table table-bordered table-hover">
          <thead>
          <tr>
            <td class="text-left" colspan="2">Chi tiết đơn hàng</td>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"> <b>ID đơn hàng: #</b><%=order.getId()%><br>
              <b>Ngày mua:&nbsp;&nbsp;&nbsp;</b><%=order.getDate().toString()%>&nbsp;&nbsp;&nbsp;&nbsp;<%=order.getTime().toString()%></td>
            <td class="text-left" style="width: 50%;"> <b>Phương thức thanh toán :</b> <%=order.getPayment()%><br>
              <b>Phương thức vận chuyển :</b> <%=order.getShip()%></td>
          </tr>
          </tbody>
        </table>
        <table class="table table-bordered table-hover">
          <thead>
          <tr>
            <td class="text-left" style="width: 50%; vertical-align: top;">Địa chỉ thanh toán</td>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="text-left"><%=order.getFullname()%><br><%=order.getAddress()%><br><%=order.getPhone()%></td>
          </tr>
          </tbody>
        </table>
        <table class="table table-bordered table-hover">
          <thead>
          <tr>
            <td class="text-left" style="width: 50%; vertical-align: top;">Ghi chú đơn hàng</td>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="text-left"><%=order.getComment()%></td>
          </tr>
          </tbody>
        </table>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
            <tr>
              <td class="text-left">Tên sản phẩm</td>
              <td class="text-left">Mã sản phẩm</td>
              <td class="text-right">Số lượng</td>
              <td class="text-right">Giá</td>
              <td class="text-right">Thành tiền</td>
            </tr>
            </thead>
            <tbody>
              <% for(ProductOrder p : list) {
                Product product = dao.getProduct(p.getId_product());
              %>
                <tr>
                  <td class="text-left"><a href="Product.jsp?id=<%=product.getId()%>"><%=product.getName()%></a></td>
                <td class="text-left"><%=product.getId()%></td>
                <td class="text-right"><%=p.getQuantity()%></td>
                <td class="text-right"><%=product.getPrice_buy()%>&nbsp;VNĐ</td>
                <td class="text-right"><%=p.getTotal()%></td>
               </tr>
              <% } %>

            </tbody>
            <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b>Phí vận chuyện</b></td>
              <td class="text-right"><%=order.getTotalship()%>&nbsp;VNĐ</td>
              <td></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b>Tổng cộng</b></td>
              <td class="text-right"><%=order.getTotal()%>&nbsp;VNĐ</td>
              <td></td>
            </tr>
            </tfoot>

          </table>
        </div>
        <div class="buttons clearfix">
          <div class="pull-right"><a href="HistoryOrder" class="btn btn-primary">Tiếp tục</a></div>
        </div>
      </div>
    </div>
    
  </div>
<jsp:include page="Layout/Footer.jsp"></jsp:include>
</body>
</html>
