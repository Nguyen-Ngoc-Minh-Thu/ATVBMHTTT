<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Cập nhật lại mật khẩu</title>
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
    <% String mess = (String)request.getAttribute("mess");
      if(mess!=null){ %>
    <script>
      alert("<%=mess%>");
    </script>
    <% } %>
    <% String username = (String) request.getAttribute("username");%>
    <div id="content" class="col-sm-9">
      <h4 class="page_title">Cập nhật lại mật khẩu cho account có username là <%=username%></h4>
      <form action="DonePassword" method="post" class="form-horizontal">
        <fieldset>
          <div class="form-group required">
            <label class="col-sm-2 control-label" >Nhập mật khẩu mới</label>
            <div class="col-sm-10">
              <input type="password" name="password" value="" placeholder="Nhập mật khâu mới"  class="form-control">
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label">Xác nhận lại mật khẩu</label>
            <div class="col-sm-10">
              <input type="password" name="repassword" value="" placeholder="Xác nhận mật khẩu"  class="form-control">
            </div>
          </div>
          <input type="hidden" name="username" value="<%=username%>" class="form-control">
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="login.jsp" class="btn btn-default">Trở về</a></div>
          <div class="pull-right"><input type="submit" value="Tiếp tục" class="btn btn-primary"></div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
