package Control;

import Entity.Product;
import java.util.Set;
import java.sql.SQLException;
import service.Ulti;
import Dao.ProductDao;
import Dao.OrderDao;
import Entity.Cart;
import Entity.Account;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "CheckOrderController", value = { "/CheckOrder" })
public class CheckOrderController extends HttpServlet
{
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        Cart cart = (Cart)request.getSession().getAttribute("cart");
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
        String address = request.getParameter("address_detail")+", "+request.getParameter("phuongxa")+", "+request.getParameter("quanhuyen")+", "+request.getParameter("tinhthanh");
        String comment = request.getParameter("comment");
        OrderDao dao = new OrderDao();
        ProductDao daoProduct = new ProductDao();
        try {
            int total = cart.getTotalSum() + totalship;
            String id_order = Ulti.randomText();
            while(!dao.checkIdOrder(id_order)){
                id_order = Ulti.randomText();
            }
            dao.addOrder(id_order, username, payment, ship, totalship, total, fullname, numberphone, address, comment, cart.getCart().size());
            Set<String> list = cart.getCart().keySet();
            for (String s : list) {
                Product p = daoProduct.getProduct(s);
                dao.addProductOrder(id_order, s, cart.getCart().get(s), p.getPrice_buy() * cart.getCart().get(s));
            }
            cart.getCart().clear();
            request.getRequestDispatcher("Success.jsp").forward(request, response);
        }
        catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}