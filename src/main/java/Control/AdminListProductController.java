package Control;

import Dao.ProductDao;
import Entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminListProductController", value = "/AdminListProduct")
public class AdminListProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao dao = new ProductDao();
        try {
            List<Product> list = dao.getAllProducts();
            request.setAttribute("listproduct", list);
            request.getRequestDispatcher("AdminListProduct.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
