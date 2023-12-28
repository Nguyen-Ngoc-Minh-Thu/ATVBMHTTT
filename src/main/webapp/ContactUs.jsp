
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Liên hệ chúng tôi</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<div id="contactus" class="container">
  <ul class="breadcrumb">
    <li><a href="index.html"><i
            class="fa fa-home"></i></a></li>
    <li><a href="contactus.html">Contact Us</a></li>
  </ul>
  <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 contact-left">
      <div class="content-details">
        <div class="location-info">
          <div class="location-title title"><i class="fa fa-home"></i>&nbsp;&nbsp;CTV Shop</div>
          <div class="content-address"> 49, Đường số 8, phường Tam Phú, TP.Thủ Đức, TP.HCM</div>
          <a href="https://www.google.com/maps/place/49+%C4%90%C6%B0%E1%BB%9Dng+s%E1%BB%91+8,+B%C3%ACnh+Chi%E1%BB%83u,+Th%E1%BB%A7+%C4%90%E1%BB%A9c,+Th%C3%A0nh+ph%E1%BB%91+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam/@10.8668509,106.7412966,17z/data=!3m1!4b1!4m5!3m4!1s0x317527f3986fe4e7:0xa94b0540bf20f232!8m2!3d10.8668509!4d106.7434853?hl=en-gb"
             target="_blank" class="btn btn-info"><i class="fa-solid fa-location-dot"></i> &nbsp;Xem bản đồ GoogleMap</a>
        </div>
        <div class="phone-info">
          <div class="phone-title title"><i class="fa fa-mobile"></i>&nbsp;&nbsp;Số điện thoại</div>
          <div class="content-number"> 0776849194</div>
        </div>
        <div class="fax-info">
          <div class="fax-title title"><i class="fa fa-fax"></i>&nbsp;&nbsp;Fax</div>
          <div class="fax-number">0987654321</div>
        </div>
        <div class="openstore-info">
          <div class="open-title title"><i class="fa fa-clock-o"></i>Khung giờ hoạt động</div>
          <div class="openstore-detail">8:00 AM - 8:00 PM</div>
        </div>
        <div class="comment-info">
          <div class="comment-title title"><i class="fa fa-comments-o"></i>Bình luận</div>
          <div class="comment-detail">Sự Sang trọng - Tinh tế - Đẳng cấp của bạn là niềm tự hào              của chúng tôi</div>
        </div>
      </div>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 contact-right">
      <!-- mẫu liên hệ -->
      <p>Hãy gửi yêu cầu, thắc mắc, hoặc muốn liên hệ với shop. Vui lòng gửi mail vào địa chỉ: nguyenyenvi12345@gmail.com</p>
    </div>
  </div>
</div>
<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
