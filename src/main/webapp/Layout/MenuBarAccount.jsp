<%@ page import="Entity.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside id="column-left" class="col-sm-3 hidden-xs">
    <div class="account-content widget-sidebar">
        <div class="box-content">
            <div class="list-group">
                <h3 class="toggled">TÀI KHOẢN</h3>
                <%if (session.getAttribute("account") == null) {%>
                <!-- Tài khoản -->
                <ul class="list-unstyled">
                    <a href="Login.jsp" class="list-group-item">Đăng nhập</a>
                    <!-- link trang đăng ký -->
                    <a href="Register.jsp"
                       class="list-group-item">Đăng ký</a>
                    <!-- link quên mật khẩu  -->
                    <a href="Forgottenpassword.jsp"
                       class="list-group-item">Quên mật khẩu</a>
                    <br>
                </ul>
                <%
                } else {
                    Account account = (Account)session.getAttribute("account");
                %>
                <ul class="list-unstyled">
                    <a href="MyAccount.jsp" class="list-group-item">Tài khoản của tôi</a>
                    <a href="EditAccount.jsp" class="list-group-item">Chỉnh sửa tài khoản</a>
                    <a href="Changepassword.jsp" class="list-group-item">Đổi mật khẩu</a>
                    <a href="Cart" class="list-group-item">Giỏ hàng của bạn</a>
                    <a href="HistoryOrder" class="list-group-item">Lịch sử đơn hàng</a>
                    <a href="ReportPrivate" class="list-group-item">Báo cáo lộ key</a>
                    <a href="LogOutController" class="list-group-item">Đăng xuất</a>
                    <br>
                </ul>
                <%}%>

            </div>
        </div>
    </div>
    <div class="sidebar widget-sidebar">
        <div class="box-content">
            <h3 class="box-content toggled">THÔNG TIN</h3>
            <ul class="list-unstyled">
                <li>
                    <!-- link ve chung toi -->
                    <a
                            href="AboutUs.jsp">Về
                        chúng tôi</a>
                </li>
                <li>
                    <!-- link thong tin giao hang -->
                    <a
                            href="Deliveryinformation.jsp">Thông
                        tin giao hàng</a>
                </li>
                <li>
                    <!-- link chinh sach bao mat -->
                    <a
                            href="Privacypolicy.jsp">Chính
                        sách bảo mật</a>
                </li>
                <li>
                    <!-- link dieu khoan va dieu kien -->
                    <a
                            href="TermsAndConditions.jsp">Điều
                        khoản và điều kiện</a>
                </li>
                <li>
                    <!-- link lien he chung toi -->
                    <a href="AboutUs.jsp">Liên
                        hệ chúng tôi</a>
                </li>
                <li></li>
            </ul>
        </div>
    </div>

    <div class="swiper-viewport widget-sidebar">
        <div id="banner0" class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="index.jsp"><img src="../Image/image_web/banner.png" alt="left banner"
                                            class="img-responsive" /></a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        if ($('#banner0 .swiper-slide').length > 1) {
            $('#banner0').swiper({
                effect: 'fade',
                autoplay: 2500,
                autoplayDisableOnInteraction: false
            });
        }
    </script>

</aside>
