<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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
<div id="account-login" class="container">
    <ul class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
        <li><a href="Login.jsp">Đăng nhập</a></li>
    </ul>
    <div class="row">
        <jsp:include page="/Layout/MenuBarAccount.jsp" />
        <div id="content" class="col-sm-9">
            <div class="row">
                <div class="col-sm-6">
                    <div class="well">
                        <h1 style="font-size: 30px;">KHÁCH HÀNG MỚI</h1>
                        <h2>Đăng ký tài khoản</h2>
                        <p>
                            Bằng cách tạo tài khoản, bạn sẽ có thể mua sắm nhanh hơn, cập nhật trạng thái đơn hàng
                            và theo dõi các đơn hàng bạn đã thực hiện trước đó.</p>
                        <br>
                        <!-- link đăng ký tài khoản -->
                        <a href="Register.jsp"
                           class="btn btn-primary">Tiếp tục</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="well">
                        <h1 style="font-size: 30px;">ĐĂNG NHẬP TÀI KHOẢN</h1>
                        <form action="/Login" method="post">
                            <div class="form-group">
                                <label class="control-label" for="input-email" style="font-size: 18px;">Địa chỉ
                                    Email đăng nhập</label>
                                <input type="text" name="email" value="" placeholder="Nhập địa chỉ email"
                                       id="input-email" class="form-control"  required/>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-password" style="font-size: 18px;">Mật
                                    khẩu</label>
                                <input type="password" name="password" value="" placeholder="Mật khẩu"
                                       id="input-password" class="form-control" required />
                                <!-- link trang quên mật khẩu -->
                                <a href="Forgottenpassword.jsp">Quên
                                    mật khẩu?</a>
                            </div>
                            <input type="submit" value="Đăng nhập" class="btn btn-primary" />


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
