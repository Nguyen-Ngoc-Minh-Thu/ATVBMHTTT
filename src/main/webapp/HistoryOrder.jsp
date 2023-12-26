<%@ page import="Entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Order> list = (List<Order>)request.getAttribute("listorder"); %>
<html>
<head>
    <title>Lịch sử đơn hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="CSS/stylesheet.css">
    <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
    <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
    <jsp:include page="Layout/Header.jsp"/>
    <div id="history_order" class="container">
        <ul class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
            <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
            <li><a href="HistoryOrder">Lịch sử đơn hàng</a></li>
        </ul>
        <div class="row">
            <jsp:include page="Layout/MenuBarAccount.jsp" />
            <div id="content" class="col-sm-9">
                <h1 class="page_title">Lịch sử đơn hàng</h1>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center">ID đặt hàng</td>
                            <td class="text-left">Khách hàng</td>
                            <td class="text-center">Số lượng sản phẩm</td>
                            <td class="text-left">Trạng thái</td>
                            <td class="text-right">Tổng cộng</td>
                            <td class="text-left">Ngày mua</td>
                            <td class="text-after"></td>
                        </tr>
                        </thead>
                        <tbody>
                        <% for(Order o : list) { %>
                        <tr>
                            <td class="text-center">#<%=o.getId()%></td>
                            <td class="text-left"><%=o.getFullname()%></td>
                            <td class="text-center"><%=o.getNumber()%></td>
                            <td class="text-left"><%=o.getStatus()%></td>
                            <td class="text-right"><%=o.getTotal()%></td>
                            <td class="text-left"><%=o.getDate().toString()%></td>
                            <td class="text-right"><a href="OrderDetail?id=<%=o.getId()%>" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="View"><i class="fa fa-eye"></i></a></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="buttons clearfix">
                    <div class="pull-right"><a href="MyAccount.jsp" class="btn btn-primary">Tiếp tục</a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
