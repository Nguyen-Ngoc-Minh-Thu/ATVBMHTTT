<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- FOOTER -->
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 clearfix footer-left-panel">
                    <div class="position-footer-left">
                        <div>
                            <div class="footer-block contact-info-block">
                                <h5 class="footer-title">THÔNG TIN CHÚNG TÔI</h5>
                                <ul class="list-unstyled">
                                    <li><i class="fa fa-location-arrow"></i>49, Đường số 8, P.Tam Phú, TP.Thủ Đức
                                        <br>TP.Hồ Chí Minh
                                    </li>
                                    <li><i class="fa fa-phone"></i>0776849194</li>
                                    <li><i class="fa fa-fax"></i>0987654321</li>
                                    <li><i class="fa fa-envelope"></i><a
                                            href="mailto:20130215@st.hcmuaf.edu.vn">20130463@st.hcmuaf.edu.vn</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>



                </div>
                <div class="col-sm-2 clearfix">
                    <h5>THÔNG TIN</h5>
                    <ul class="list-unstyled">
                        <li><a
                                href="AboutUs.jsp">Về chúng tôi</a></li>
                        <li><a
                                href="Deliveryinformation.jsp">Thông tin giao hàng</a></li>
                        <li><a
                                href="Privacypolicy.jsp">Chính sách bảo mật</a></li>
                        <li><a
                                href="TermsAndConditions.jsp">Điều khoản và điều kiện</a></li>
                        <li><a
                                href="ContactUs.jsp">Liên hệ chúng tôi</a></li>
                    </ul>
                </div>

                <div class="col-sm-2 clearfix">

                </div>
                <div class="col-sm-4 clearfix footer-right-panel">
                    <div class="position-footer-right">
                        <div class="newsletter-wrapper nessletter_banner">
                            <div class="newsletter-inner newsletter-block clearfix">
                                <div class="text-content">
                                    <h3 class="title-text">BẢN TIN CỦA CHÚNG TÔI</h3>
                                </div>
                                <div class="newsletter-form">
                                    <p>Đăng ký nhận bản tin của chúng tôi để nhận được những tin tức, thông báo mới
                                        nhất và đặc biệt.
                                    </p>
                                    <div class="newsletter-form-box">
                                        <form name="frmnewsletter" id="frmnewsletter"
                                              onsubmit="subscribe();return false" method="post">
                                            <div class="subscribe-form">
                                                <input type="email" name="newsletter_usr_email"
                                                       id="newsletter_usr_email"
                                                       placeholder="Nhập địa chỉ email tại đây..."
                                                       class="form-control input-lg inputNew txtemail" required>
                                                <button type="submit"
                                                        class="btn btn-default btn-lg button_mini subscribe-btn">Đăng
                                                    ký</button>
                                            </div>
                                            <!-- newsletter notofication -->
                                            <div class="newsletter-message">
                                            </div>
                                            <!-- newsletter notofication -->
                                        </form>
                                    </div>
                                    <!-- newsletter box -->
                                </div>
                            </div>
                        </div>
                        <script>
                            //add
                            function subscribe() {
                                $.ajax({
                                    type: 'post',
                                    url: 'index.php?route=extension/module/mahardhi_newsletter/subscribe',
                                    dataType: 'html',
                                    data: $("#frmnewsletter").serialize(),
                                    success: function (html) {
                                        try {
                                            eval(html);
                                        }
                                        catch (e) {
                                        }
                                    }
                                });
                            }

                            // check for validation
                            $(document).ready(function () {
                                $('#newsletter_usr_email').keypress(function (e) {
                                    if (e.which == 13) {
                                        e.preventDefault();
                                        subscribe();
                                    }
                                });
                            });</script>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p class="powered">Copyright 2022 ©<a
                            href="https://www.facebook.com/yenvi.2201/">Vi</a></p>
                </div>
                <div class="col-md-6">
                    <div class="position-footer-bottom">
                        <div>
                            <div class="social-block">
                                <ul>
                                    <li><a href="https://www.facebook.com/yenvi.2201/"><i
                                            class="fa-brands fa-facebook"></i></a></li>
                                    <li><a href="https://www.youtube.com/channel/UCWKTeKUQS3TxUuwOLHOpung"><i
                                            class="fa-brands fa-youtube"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-google"></i></a></li>
                                    <li><a href="https://github.com/nguyenthiyenvi20130463"><i
                                            class="fa-brands fa-github"></i></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</footer>
<a href="#" class="scrollToTop back-to-top"><i class="fa-solid fa-angles-up"></i></a>