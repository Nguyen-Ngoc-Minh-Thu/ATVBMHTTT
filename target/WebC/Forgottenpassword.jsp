<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Quên mật khẩu</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="../CSS/stylesheet.css">
  <script src="../JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" media="screen">
  <script src="../Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="../JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<div id="account-login" class="container">
  <ul class="breadcrumb">
    <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
    <li><a href="MyAccount.jsp">Tài khoản</a></li>
    <li><a href="Login.jsp">Quên mật khẩu</a></li>
  </ul>
  <div class="row">
    <jsp:include page="/Layout/MenuBarAccount.jsp" />
    <div id="content" class="col-sm-9">
      <h1 class="page_title">Quên mật khẩu?</h1>
      <p>Nhập địa chỉ e-mail được liên kết với tài khoản của bạn. Nhấn vào tiếp tục để nhận lại mật khẩu của bạn trong e-mail đã đăng ký</p>
      <form action="SendMail" method="post" class="form-horizontal">
        <fieldset>
          <legend>Địa chỉ email của bạn</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">Địa chỉ email</label>
            <div class="col-sm-10">
              <input type="text" name="email" value="" placeholder="Địa chỉ email" id="input-email" class="form-control">
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="login.jsp" class="btn btn-default">Trở về</a></div>
          <div class="pull-right"><input type="submit" value="Tiếp tục" class="btn btn-primary"></div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
