package Control;

import Dao.OrderDao;
import Entity.Order;
import Entity.OrderDetails;
import Entity.ProductOrder;
import RSASigner.RSASigner;
import service.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "VerifySignatureController", value = "/VerifySignatureController")
public class VerifySignatureController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Lấy id_order từ request
            String id_order = request.getParameter("orderId");

            // Khởi tạo OrderDao để truy xuất cơ sở dữ liệu
            OrderDao orderDao = new OrderDao();

            // Lấy chữ ký từ cơ sở dữ liệu
            String receivedSignature = orderDao.getSignatureByIdOrder(id_order);

            // Lấy thông tin đơn hàng và sản phẩm từ cơ sở dữ liệu
//            OrderDetails orderDetails = orderDao.getOrderDetails(id_order);
            List<ProductOrder> productOrderList = OrderDao.getProductDetailsForOrder(id_order);
            String listP = "";
            for (ProductOrder list11 : productOrderList) {
                listP = list11.getId_product() + list11.getQuantity();
            }

            Order order = orderDao.getOrder(id_order);
            String data = order.getFullname()+order.getPhone()+order.getAddress()+order.getComment()+listP;
            // Lấy public key từ cơ sở dữ liệu
            String publicKey = orderDao.getPublicKeyByUsername(order.getUsername());

            // Xác minh chữ ký
//            boolean signatureValid = RSASigner.verify(orderDetails.toString(), receivedSignature, publicKey);
            RSASigner rsa = new RSASigner();
            // Tạo chữ ký RSA dựa trên thông tin đơn hàng và chi tiết sản phẩm

            String signature = rsa.decrypt(receivedSignature,publicKey);
            System.out.println(data);
            System.out.println("de   "+signature);
            if (signature.equals(data)) {
                // Gửi thông điệp thành công
                response.getWriter().write("Chữ ký hợp lệ");
            } else {
                // Chữ ký không hợp lệ
                response.getWriter().write("Chữ ký không hợp lệ");
                String subject = "Lỗi trong quá trình xác thực đơn hàng!!!";
                String message = "Xin Chào " + order.getUsername() + ",\n\n"
                        + "Chúng tôi nhận thấy rằng đơn hàng có mã " + order.getId() + " của bạn đã có chút thay đổi so với lúc đầu. "
                        + "Nên không thể xác nhận được, chúng tôi đã tiến hành hủy đơn hàng và bạn hãy đặt lại đơn hàng mới. Xin lỗi quý khách vì sự bất tiện này.\n\n"
                        + "Chúc bạn một ngày tốt lành,\n" + "ShopCVT";
                SendMail.send(order.getUsername(),subject, message);

            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
