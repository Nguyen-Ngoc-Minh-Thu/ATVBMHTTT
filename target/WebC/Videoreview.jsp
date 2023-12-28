<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Video liên quan</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<div id="videoreview" class="container">
  <ul class="breadcrumb">
    <li><a href="Home.jsp"><i class="fa fa-home"></i></a></li>
    <li><a href="Videoreview.jsp">Video liên quan</a></li>
  </ul>
  <div class="row">
    <jsp:include page="/Layout/MenuBarProduct.jsp" />
    <div id="content" class="col-sm-9">
      <h2 class="page_title">VIDEO LIÊN QUAN</h2>
      <br>
      <div class="blog-layout product-list blog-category clearfix">
        <div class="product-thumb blog-block clearfix">
          <h3 style="text-align: center;">so sánh thắt lưng da thật và giả</h3>
          <div style="text-align: center;"><iframe id="_ytid_87190" width="560" height="315"
                                                   src="https://www.youtube.com/embed/0pstdfcqq_Q" title="YouTube player"
                                                   data-epytgalleryid="epyt_gallery_15679"
                                                   allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                   allowfullscreen data-no-lazy="1" data-skipgform_ajax_framebjll=""></iframe>
          </div>
        </div>
      </div>
      <br>
      <div class="blog-layout product-list blog-category clearfix">
        <div class="product-thumb blog-block clearfix">
          <h3 style="text-align: center;">chọn thắt lưng da nam làm quà tặng cho nam giới</h3>
          <div style="text-align: center;"><iframe width="560" height="315"
                                                   src="https://www.youtube.com/embed/CxedCiwHEzA" title="YouTube video player"
                                                   frameborder="0"
                                                   allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                   allowfullscreen></iframe></div>
        </div>
      </div>
      <br>
      <div class="blog-layout product-list blog-category clearfix">
        <div class="product-thumb blog-block clearfix">
          <h3 style="text-align: center;">Tuyệt chiêu phân biệt da cá sấu thật giả</h3>
          <div style="text-align: center;"><iframe width="560" height="315"
                                                   src="https://www.youtube.com/embed/zr0lzv4ccxc" title="YouTube video player"
                                                   frameborder="0"
                                                   allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                   allowfullscreen></iframe></div>
        </div>
      </div>
      <br>
      <div class="blog-layout product-list blog-category clearfix">
        <div class="product-thumb blog-block clearfix">
          <h3 style="text-align: center;">3 Cách phân biệt thắt lưng da thật và giả</h3>
          <div style="text-align: center;"><iframe width="560" height="315"
                                                   src="https://www.youtube.com/embed/YHDnl5qoTww" title="YouTube video player"
                                                   frameborder="0"
                                                   allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                   allowfullscreen></iframe></div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
