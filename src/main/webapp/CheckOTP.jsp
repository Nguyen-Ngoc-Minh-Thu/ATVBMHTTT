<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Xác nhận mã OTP</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="../CSS/stylesheet.css">
  <script src="../JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" media="screen">
  <script src="../Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="../JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<% String mess = (String)request.getAttribute("mess");
  if(mess!=null){ %>
<script>
  alert("<%=mess%>");
</script>
<% } %>
<% String username = (String)request.getAttribute("username");%>
<div id="account-login" class="container">
  <ul class="breadcrumb">
    <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
    <li><a href="MyAccount.jsp">Tài khoản</a></li>
    <li><a href="Login.jsp">Quên mật khẩu</a></li>
  </ul>
  <div class="row">
    <jsp:include page="/Layout/MenuBarAccount.jsp" />
    <div id="content" class="col-sm-9">
      <h1 class="page_title">Xác nhận mã OTP</h1>
      <p>Nhập mã OTP đã gửi qua mail bạn. Mã OTP có hiệu lực trong 60 giây</p>
      <form action="CheckOTP" method="post" class="form-horizontal">
        <fieldset>
          <legend>Người dùng <%=username%></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">Mã OTP:</label>
            <div class="col-sm-10">
              <input type="text" name="otp" value="" placeholder="Mã OTP" id="input-email" class="form-control" required>
              <input name="username" value="<%=username%>" type="hidden">
            </div>

          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="login.jsp" class="btn btn-default">Trở về</a></div>
          <div class="pull-right"><input type="submit" value="Tiếp tục" class="btn btn-primary"></div>
        </div>
      </form>
    <p>Bạn không nhận được mã OTP? Vui lòng click vào để nhận lại mã.<form action="SendMail" method="post">
    <input name="email" value="<%=username%>" type="hidden">
    <input type="submit" value="Nhận lại mã">
      </form> </p>
    </div>
  </div>
</div>
</body>
</html>
