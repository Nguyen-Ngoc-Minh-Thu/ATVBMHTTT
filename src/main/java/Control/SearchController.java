package Control;

import Dao.ProductDao;
import Entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/Search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateId = request.getParameter("category_id");
        String name_search = request.getParameter("search_name");
        ProductDao dao = new ProductDao();
        List<Product> list = null;
        System.out.println(cateId);
        String category="";
        try
        {
            if(cateId.equals("All"))
            {
                list = dao.getAllProducts(0, name_search);
                category = "Tất cả sản phẩm";
            } else
            if(cateId.equals("3"))
            {
                list = dao.getAllProducts(3, name_search);
                category = "Thắt lưng nam";
            } else
            if(cateId.equals("2"))
            {
                list = dao.getAllProducts(2, name_search);
                category = "Mặt thắt lưng";
            } else
            if(cateId.equals("1"))
            {
                list = dao.getAllProducts(1, name_search);
                category = "Dây thắt lưng";
            }

            request.setAttribute("list", list);
            request.setAttribute("id", category);
            request.setAttribute("text", name_search);
            request.getRequestDispatcher("Search.jsp").forward(request, response);
        }
        catch(SQLException | ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }

    }
}
