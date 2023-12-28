package Control;

import Dao.AccountDao;
import Dao.OrderDao;
import Entity.Account;
import Entity.Order;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminUserController", value = "/AdminUser")
public class AdminUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("id");
        OrderDao orderDao = new OrderDao();
        try {
            UserService user = new UserService();
            List<Order> listorder = orderDao.getAllOrders(username);
            Account account = user.findAccount(username);
            System.out.println(account.getEnable());
            request.setAttribute("account", account);
            request.setAttribute("listorder", listorder);
            request.getRequestDispatcher("AdminUser.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
