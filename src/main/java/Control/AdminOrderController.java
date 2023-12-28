package Control;

import Dao.OrderDao;
import Dao.ProductDao;
import Entity.Order;
import Entity.Product;
import Entity.ProductOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminOrderController", value = "/AdminOrder")
public class AdminOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_order = request.getParameter("idorder");
        OrderDao dao = new OrderDao();
        ProductDao productDao = new ProductDao();
        try {
            Order order = dao.getOrder(id_order);
            List<ProductOrder> list = dao.getProductsOrder(id_order);
            Map<Product, Integer> map = new HashMap<Product, Integer>();
            for(ProductOrder productorder : list){
                map.put(productDao.getProduct(productorder.getId_product()), productorder.getQuantity());
            }
            request.setAttribute("order", order);
            request.setAttribute("listproduct", map);
            request.getRequestDispatcher("AdminOrder.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}