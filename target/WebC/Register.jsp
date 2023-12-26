<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<div id="account-register" class="container">
  <ul class="breadcrumb">
    <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
    <li><a href="Register.jsp">Đăng ký</a></li>
  </ul>
  <div class="row">
    <jsp:include page="/Layout/MenuBarAccount.jsp" />
    <div id="content" class="col-sm-9">
      <h1>Đăng ký tài khoản</h1>
      <p>Nếu bạn đã có tài khoản với chúng tôi, vui lòng đăng nhập tại trang <a
              href="Login.jsp">đăng nhập</a>.</p>
      <form action="/Register" method="post" class="form-horizontal" name="form1" onsubmit="return validation()">
        <fieldset id="account">
          <legend>Thông Tin Cá Nhân Của Bạn</legend>
          <div class="form-group required" style="display:  none ;">
            <label class="col-sm-2 control-label">Customer Group</label>
            <div class="col-sm-10">
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id" value="1" checked="checked" />
                  Default</label>
              </div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">Họ</label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="" placeholder="Họ" id="input-firstname"
                     class="form-control" required />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname">Tên</label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="" placeholder="Tên" id="input-lastname"
                     class="form-control" required />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
            <div class="col-sm-10">
              <input type="email" name="email" value="" placeholder="E-Mail" id="input-email"
                     class="form-control" required />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone">Điện thoại</label>
            <div class="col-sm-10">
              <input type="tel" name="telephone" value="" placeholder="Điện thoại"
                     id="input-telephone" class="form-control" required />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label">Giới tính</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="male" value="1" checked="checked"/>
                Nam</label>
              <label class="radio-inline">
                <input type="radio" name="male" value="0"/>
                Nữ</label>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <legend>Mật Khẩu Của Bạn</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password">Mật khẩu</label>
            <div class="col-sm-10">
              <input type="password" name="password" value="" placeholder="Mật khẩu"
                     id="input-password" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm">Xác nhận mật khẩu</label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="" placeholder="Xác nhận mật khẩu"
                     id="input-confirm" class="form-control" />
            </div>
          </div>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">Tôi đã đọc và đồng ý với <a
                  href="privacypolicy.html"
          ><b>Chính sách quyền riêng tư</b></a>
            <input type="checkbox" name="agree" value="1" required />
            &nbsp;
            <input type="submit" name="summit" value="Tiếp Tục" class="btn btn-primary" />
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="Layout/Footer.jsp" />
<% String mess = (String)request.getAttribute("mess");
  if(mess!=null){ %>
<script>
  alert("<%=mess%>");
</script>
<% } %>

<script>

  function validation(){
    var pass = document.form1.password.value;

    var pass2 = document.getElementById("input-password")

    if(pass.length < 6){

      alert("Mật khẩu phải có từ 6 ký tự trở lên")
      pass2.style.border = "1px solid red";

      return false;

    }else{

      pass2.style.border = "1px solid black";

      return true;

    }
  }


</script>
</body>
</html>
