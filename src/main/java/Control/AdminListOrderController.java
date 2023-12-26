package Control;

import Dao.OrderDao;
import Entity.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminListOrderController", value = "/AdminListOrder")
public class AdminListOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao dao = new OrderDao();
        try {
            List<Order> list  = dao.getAllOrders();
            request.setAttribute("listorder", list);
            request.getRequestDispatcher("AdminListOrder.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
