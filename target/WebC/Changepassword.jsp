<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Đổi mật khẩu</title>
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
      <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
     <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
      <li><a href="Changepassword.jsp">Đổi mật khẩu</a></li>
    </ul>
    <div class="row">
      <jsp:include page="/Layout/MenuBarAccount.jsp" />
      <div id="content" class="col-sm-9">
        <h1 class="page_title">Thay đổi mật khẩu</h1>
        <form action="ChangePassword" method="post"class="form-horizontal" name="form1" onsubmit="return validation()">
          <fieldset>
            <legend>Mật khẩu của bạn</legend>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-password">Mật khẩu cũ</label>
              <div class="col-sm-10">
                <input type="password" name="password" value="" placeholder="Mật khẩu cũ" id="input-password" class="form-control" required>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-password">Mật khẩu mới</label>
              <div class="col-sm-10">
                <input type="password" name="newpassword" value="" placeholder="Mật khẩu mới" id="input-newpassword" class="form-control" required>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-confirm">Xác nhận mật khẩu</label>
              <div class="col-sm-10">
                <input type="password" name="confirm" value="" placeholder="Xác nhận mật khẩu" id="input-confirm" class="form-control" required>
              </div>
            </div>
          </fieldset>
          <div class="buttons clearfix">
            <div class="pull-left"><a href="MyAccount.jsp" class="btn btn-default">Trở về</a></div>
            <div class="pull-right">
              <input type="submit" value="Tiếp tục" class="btn btn-primary">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
    <jsp:include page="/Layout/Footer.jsp" />
  <script>

    function validation() {
      var pass = document.form1.password.value;
      var pass2 = document.form1.newpassword.value;
      var pass3 = document.form1.confirm.value;
      var passold = document.getElementById("input-password")
      var passnew = document.getElementById("input-newpassword")
      var passComfirm = document.getElementById("input-confirm")


      if (pass.length < 6) {
        alert("Mật khẩu phải có từ 6 ký tự trở lên")
        passold.style.border = "1px solid red";
        return false;
        if (pass2.length < 6) {
          passnew.style.border = "1px solid red";
          return false;
        }
          if (pass3.length < 6) {
            passComfirm.style.border = "1px solid red";
            return false;
          }
          if (pass.length >= 6 && pass2 >= 6 && pass3 >= 6) return true;
        }
      }

  </script>
</body>
</html>
