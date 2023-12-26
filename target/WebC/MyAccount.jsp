<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>My Account</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
  <jsp:include page="Layout/Header.jsp" />
  <% String mess = (String)request.getAttribute("mess");
    if(mess!=null){ %>
  <script>
    alert("<%=mess%>");
  </script>
  <% } %>
  <div id="myaccount" class="container">
    <ul class="breadcrumb">
      <li><a href="Home.jsp"><i class="fa fa-home"></i></a></li>
      <li><a href="MyAccount.jsp">Về chúng tôi</a></li>
    </ul>
    <div class="row">
      <jsp:include page="/Layout/MenuBarAccount.jsp" />
      <div id="content" class="col-sm-6">
        <H1>TÀI KHOẢN CỦA TÔI</H1>
        <a href="EditAccount.jsp">
          <p>Chỉnh sửa thông tin tài khoản</p>
        </a>
        <a href="Changepassword.jsp">
          <p>Thay đổi mật khẩu tài khoản</p>
        </a>
        <br>
        <h1>ĐƠN ĐẶT HÀNG</h1>
        <a href="Cart">
          <p>Xem giỏ hàng của bạn</p>
        </a>
        <a href="HistoryOrder">
          <p>Xem lịch sử đơn hàng</p>
        </a>
        <br>
      </div>
    </div>
  </div>
</body>
</html>
