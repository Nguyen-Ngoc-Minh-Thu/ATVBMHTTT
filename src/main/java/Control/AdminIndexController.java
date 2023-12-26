package Control;

import Dao.AccountDao;
import Dao.OrderDao;
import Dao.ProductDao;
import Entity.Account;
import Entity.Order;
import Entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminIndexController", value = "/AdminIndex")
public class AdminIndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("admim");
//        if(account == null){
//            response.sendRedirect("Login.jsp");
//            return;
//        }
        AccountDao dao = new AccountDao();
        OrderDao orderDao = new OrderDao();
        ProductDao productDao = new ProductDao();
        try {
            List<Account> list = dao.getAccountWeek();
            List<Order> listOrder = orderDao.getOrderWeek();
            List<Product> listProduct = productDao.getProductsBestSeller(10);
            System.out.println(list.size());
            System.out.println(listOrder);
            System.out.println(listProduct);
            request.setAttribute("listaccount", list);
            request.setAttribute("listorder", listOrder);
            request.setAttribute("listproduct", listProduct);
            request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
