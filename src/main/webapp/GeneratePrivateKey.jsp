<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/14/2024
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xác minh thời gian lộ key</title>
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
    <div class="row">
        <jsp:include page="/Layout/MenuBarAccount.jsp" />
        <div id="content" class="col-sm-9">
            <div style="height: 100px"></div>
            <h1 class="page_title">Nhập thời gian lộ private key của bạn</h1>
            <form action="/GeneratePrivateKey" method="post">
                <label for="datetime">Chọn ngày bị lộ private key: </label>
                <input type="datetime-local" id="datetime" name="datetime" required><br><br>
                <input type="submit" value="Next">
            </form>
        </div>
    </div>
</div>
</body>
</html>