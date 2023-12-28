package Control;

import Dao.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminUpdateProduct", value = "/AdminUpdateProduct")
public class AdminUpdateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idpd");
        String nameProduct = request.getParameter("nameproduct");
        String brand = request.getParameter("brand");
        int category = Integer.parseInt(request.getParameter("category"));
        int price = Integer.parseInt(request.getParameter("price"));
        int pricebuy = Integer.parseInt(request.getParameter("pricebuy"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String detail = request.getParameter("detail");
        ProductDao dao = new ProductDao();
        try {
            dao.updateProduct(id, nameProduct, brand, category, price, pricebuy, quantity, detail);
            response.sendRedirect("AdminProduct?id="+id);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
