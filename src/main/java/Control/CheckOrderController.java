package Control;

import Entity.*;

import java.util.List;
import java.util.Set;
import java.sql.SQLException;

import service.Ulti;
import Dao.ProductDao;
import Dao.OrderDao;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.util.Base64;

import RSASigner.RSASigner;

@WebServlet(name = "CheckOrderController", value = {"/CheckOrder"})
public class CheckOrderController extends HttpServlet {
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("account");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (account == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        if (cart.getCart().isEmpty()) {
            response.sendRedirect("Cart");
        }
        String username = account.getUsername();
        String paymentText = request.getParameter("payment_method");
        String payment = paymentText.equals("Cod") ? "Thanh toán khi nhận hàng" : null;
        String shipText = request.getParameter("shipping_method");
        String ship = shipText.equals("0") ? "Giao hàng tiết kiệm" : "Viettel Post";
        int totalship = 30000;
        String fullname = request.getParameter("fullname");
        String numberphone = request.getParameter("phone");
        String address = request.getParameter("address_detail") + ", " + request.getParameter("phuongxa") + ", " + request.getParameter("quanhuyen") + ", " + request.getParameter("tinhthanh");
        String comment = request.getParameter("comment");
        OrderDao dao = new OrderDao();
        ProductDao daoProduct = new ProductDao();
        try {
            int total = cart.getTotalSum() + totalship;
            String id_order = Ulti.randomText();
            while (!dao.checkIdOrder(id_order)) {
                id_order = Ulti.randomText();
            }
            int qty = cart.getCart().size();

            dao.addOrder(id_order, username, payment, ship, totalship, total, fullname, numberphone, address, comment, qty);
            Set<String> list = cart.getCart().keySet();
            for (String s : list) {
                Product p = daoProduct.getProduct(s);
                dao.addProductOrder(id_order, s, cart.getCart().get(s), p.getPrice_buy() * cart.getCart().get(s));
            }
            cart.getCart().clear();

            // Lấy thông tin đơn hàng và chi tiết sản phẩm sau khi thêm thành công
            OrderDetails orderDetails = dao.getOrderDetails(id_order);

            // Người dùng nhập private key từ giao diện
            String privateKey = request.getParameter("private_key");

            // Kiểm tra xem người dùng đã nhập private key hay chưa
            if (privateKey == null || privateKey.isEmpty()) {
                // Nếu không có private key, xử lý lỗi hoặc chuyển hướng đến trang nhập lại
                request.setAttribute("error", "Vui lòng nhập private key");

                return;
            }
            List<ProductOrder> productOrderList = OrderDao.getProductDetailsForOrder(id_order);
            String listP = "";
            for (ProductOrder list11 : productOrderList) {
                listP = list11.getId_product() + list11.getQuantity();
            }
            RSASigner rsa = new RSASigner();
            // Tạo chữ ký RSA dựa trên thông tin đơn hàng và chi tiết sản phẩm
            String od= fullname + numberphone + address + comment+listP;
            String signature = rsa.encrypt(od, privateKey);

// Lưu chữ ký vào cơ sở dữ liệu
            dao.updateOrderWithSignature(id_order, signature);
            request.getRequestDispatcher("Success.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}