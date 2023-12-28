<%@ page import="Entity.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Account account = (Account)session.getAttribute("account"); %>
<html>
<head>
    <title>Thông tin của tôi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="CSS/stylesheet.css">
    <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
    <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<% String mess = (String)request.getAttribute("mess");
    if(mess!=null){ %>
<script>
    alert("<%=mess%>");
</script>
<% } %>
    <jsp:include page="Layout/Header.jsp" />
    <div id="myaccount" class="container">
        <ul class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
            <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
            <li><a href="EditAccount.jsp">Chỉnh sửa tài khoản</a></li>
        </ul>
    <div class="row">
        <jsp:include page="/Layout/MenuBarAccount.jsp" />
        <div id="content" class="col-sm-9">
            <h1 class="page_title">Thông tin tài khoản của tôi</h1>
            <form action="/EditAccount" method="post" class="form-horizontal">
                <fieldset>
                    <legend>Thông tin cá nhân của bạn</legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname">Họ và tên</label>
                        <div class="col-sm-10">
                            <input type="text" name="fullname" value="<%=account.getFullName() %>" placeholder="Họ và tên"
                                   id="input-lastname" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" >E-Mail</label>
                        <div class="col-sm-10">
                            <label class="form-control"><%=account.getUsername()%></label>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-telephone">Số điện thoại</label>
                        <div class="col-sm-10">
                            <input type="tel" name="telephone" value="<%=account.getPhoneNumber()%>" placeholder="Số điện thoại"
                                   id="input-telephone" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">Giới tính</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" value="1" <% if(account.getSex()==1){%> checked="checked"<%}%>/>
                                Nam</label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" value="0" <% if(account.getSex()==0){%> checked="checked"<%}%>/>
                                Nữ</label>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons clearfix">
                    <div class="pull-left"><a
                            href="MyAccount.jsp"
                            class="btn btn-default">Trở về</a></div>
                    <div class="pull-right">
                        <input type="submit" value="Tiếp tục" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
</body>
</html>
