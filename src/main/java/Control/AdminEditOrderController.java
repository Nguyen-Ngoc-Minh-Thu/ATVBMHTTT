package Control;

import Dao.OrderDao;
import Entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminEditOrderController", value = "/AdminEditOrder")
public class AdminEditOrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idorder");
        String status = request.getParameter("status");
        System.out.println(status);
        OrderDao dao = new OrderDao();
        try {
            dao.updateOrder(id, status);
            response.sendRedirect("AdminOrder?idorder="+id);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
