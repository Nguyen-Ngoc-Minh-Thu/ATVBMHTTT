<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Đặt hàng thành công</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script></title>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<div id="contactus" class="container">
  <ul class="breadcrumb">
    <li><a href="index.jsp"><i
            class="fa fa-home"></i></a></li>
    <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
    <li><a href="Cart">Giỏ hàng</a></li>
    <li>Thủ tục thanh toán</li>
    <li>Thành công</li>
  </ul>
  <div class="row">
    <jsp:include page="/Layout/MenuBarAccount.jsp" />
    <div id="content" class="col-sm-9">
      <h1 class="page_title">Đơn hàng của bạn đã đặt thành công</h1>
      <p>Đơn đặt hàng của bạn đã xử lý thành công</p><p>Bạn có thể xem lịch sử đặt hàng của mình bằng cách truy cập trang <a href="MyAccount.jsp">tài khoản của tôi</a> và chọn vào <a href="HistoryOrder">lịch sử đơn hàng</a> .</p>
      <p>Bạn có thể gửi bất kỳ câu hỏi, đánh giá nào của bạn cho <a href="ContactUs.jsp">cửa hàng</a> .</p>
      <p>Cảm ơn vì đã mua sắm trực tuyến với chúng tôi!</p>
      <div class="buttons">
        <div class="pull-right"><a href="index.jsp" class="btn btn-primary">Tiếp tục</a></div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
