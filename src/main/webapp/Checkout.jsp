<%@ page import="Entity.Cart" %>
<%@ page import="Dao.ProductDao" %>
<%@ page import="Entity.Product" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>
<html>
<head>
  <title>Thanh toán</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="CSS/stylesheet.css">
  <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
  <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
  <script src="JS/Custom.js" type="text/javascript"></script>
</head>
<body>
  <jsp:include page="Layout/Header.jsp"/>
  <div id="checkout" class="container">
    <ul class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
      <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
      <li><a href="Cart">Giỏ hàng</a></li>
      <li><a href="Checkout">Thanh toán</a></li>
    </ul>
    <div class="row">
      <jsp:include page="Layout/MenuBarAccount.jsp" />
      <div id="content" class="col-sm-9">
        <form action="CheckOrder" method="post">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3>Bước 1: Chi tiết thanh toán</h3>
          </div>
          <div class="panel-body">
            <p>Nhập thông tin địa chỉ giao hàng</p>
            <fieldset>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-lastname">Họ và
                  tên</label>
                <div class="col-sm-10">
                  <input type="text" name="fullname" value="" placeholder="Họ và tên"
                         id="input-lastname" class="form-control" required>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address-1">Số điện
                  thoại</label>
                <div class="col-sm-10">
                  <input type="tel" name="phone" value=""
                         placeholder="Số điện thoại" id="input-address-1"
                         class="form-control" required>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Tỉnh/TP</label>
                <div class="col-sm-10">
                  <select class="form-select form-select-sm mb-3 form-control"
                          id="city" aria-label=".form-select-sm" name="tinhthanh" required>
                    <option value="" selected>Chọn tỉnh thành</option>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Quận/Huyện</label>
                <div class="col-sm-10">
                  <select class="form-select form-select-sm mb-3 form-control"
                          id="district" aria-label=".form-select-sm" name="quanhuyen" required>
                    <option value=""  selected>Chọn quận huyện</option>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Phường/Xã</label>
                <div class="col-sm-10">
                  <select class="form-select form-select-sm form-control" id="ward"
                          aria-label=".form-select-sm" name="phuongxa" required>
                    <option value="" selected>Chọn phường xã</option>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address-1">Địa chỉ cụ
                  thể</label>
                <div class="col-sm-10">
                  <input type="text" name="address_detail" value="" placeholder="Địa chỉ"
                         id="" class="form-control" required>
                </div>
              </div>
            </fieldset>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3>Bước 2: Phương thức thanh toán</h3>
          </div>
          <div class="panel-body">
            <p>Vui lòng chọn phương thức vận chuyển ưa thích để sử dụng cho đơn đặt hàng này.</p>
            <p><strong>Phí cố định</strong></p>
            <div class="radio">
              <label> <input type="radio" name="shipping_method" value="0" checked="checked">
                Giao hàng tiết kiệm  :  30.000đ</label>
            </div>
            <div class="radio">
              <label> <input type="radio" name="shipping_method" value="1">
                Viettel Post  :  30.000đ</label>
            </div>
            <br>
            <p>Vui lòng chọn phương thức thanh toán để sử dụng cho đơn đặt hàng này.</p>
            <div class="radio">
              <label> <input type="radio" name="payment_method" value="Cod" checked="checked">
                Thanh toán khi nhận hàng
              </label>
            </div>
            <p><strong>Thêm ghi chú về đơn hàng của bạn</strong></p>

            <p>
              <textarea name="comment" rows="8" class="form-control"></textarea>
            </p>
          </div>
      </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3>Bước 3: Xác nhận đơn hàng</h3>
          </div>
            <div class="panel-body">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <td class="text-left">Tên sản phẩm</td>
                    <td class="text-left">Mã Sản phẩm</td>
                    <td class="text-right">Số lượng</td>
                    <td class="text-right">Giá</td>
                    <td class="text-right">Tổng cộng</td>
                  </tr>
                  </thead>
                  <tbody>
                  <% ProductDao dao = new ProductDao();
                    Product product;
                    Set<String> set = cart.getCart().keySet();
                    int sumTotal=0;
                    int total=0;
                    for(String id : set){
                      product = dao.getProduct(id);
                      total=product.getPrice_buy()*cart.getCart().get(id);
                      %>
                     <tr>
                     <td class="text-left"><a href="Product?id=<%=id%>"><%=product.getName()%></a> </td>
                    <td class="text-left"><%=id%></td>
                    <td class="text-right"><%=cart.getCart().get(id)%></td>
                    <td class="text-right"><%=product.getPrice_buy()%></td>
                    <td class="text-right"><%=total%></td>
                  </tr>
                  <% } %>
                  </tbody>

                  <tfoot>

                  <tr>
                    <td colspan="4" class="text-right"><strong>Tổng cộng: </strong></td>
                    <td class="text-right"><%=cart.getTotalSum()+30000%>&nbsp;VNĐ</td>
                  </tr>
                  <tr>
                    <td colspan="4" class="text-right"><strong>Phí giao hàng</strong>
                    </td>
                    <td class="text-right">30000 VNĐ</td>
                  </tr>
                  <tr>
                    <td colspan="4" class="text-right"><strong>Thành tiền: </strong></td>
                    <td class="text-right" ><%=cart.getTotalSum()+30000%>&nbsp;VNĐ</td>
                  </tr>
                  </tfoot>

                </table>
              </div>
            </div>
          </div>
        <div class="buttons">
          <div class="pull-right">
            <input type="submit" value="Thanh toán hóa đơn" id="button-confirm"
                   data-loading-text="Loading..." class="btn btn-primary">
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
  <script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
      url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
      method: "GET",
      responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
      renderCity(result.data);
    });

    function renderCity(data) {
      for (const x of data) {
        citis.options[citis.options.length] = new Option(x.Name, x.Name);
      }
      citis.onchange = function () {
        district.length = 1;
        ward.length = 1;
        if (this.value != "") {
          const result = data.filter(n => n.Name === this.value);

          for (const k of result[0].Districts) {
            district.options[district.options.length] = new Option(k.Name, k.Name);
          }
        }
      };
      district.onchange = function () {
        ward.length = 1;
        const dataCity = data.filter((n) => n.Name === citis.value);
        if (this.value != "") {
          const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

          for (const w of dataWards) {
            wards.options[wards.options.length] = new Option(w.Name, w.Name);
          }
        }
      };
    }
  </script>
  <jsp:include page="Layout/Footer.jsp" />
</body>
</html>
