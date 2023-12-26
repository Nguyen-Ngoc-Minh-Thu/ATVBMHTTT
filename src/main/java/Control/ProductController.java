// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ProductController.java

package Control;

import Dao.ProductDao;
import Entity.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "ProductController", value = { "/Product" })
public class ProductController extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String id = request.getParameter("id");
        String category = null;
        String categoryName = null;
        List list = null;
        ProductDao dao = new ProductDao();
        try
        {
            Product product = dao.getProduct(id);
            list = dao.getProductsRelation(product.getCategory());
            if(product.getCategory() == 1)
            {
                category = "daythatlung";
                categoryName = "Dây thắt lưng";
            } else
            if(product.getCategory() == 2)
            {
                category = "matthatlung";
                categoryName = "Mặt thắt lưng";
            } else
            {
                category = "thatlung";
                categoryName = "Thắt lưng nam";
            }
            request.setAttribute("listproduct", list);
            request.setAttribute("category", category);
            request.setAttribute("product", product);
            request.setAttribute("namecategory", categoryName);
            request.getRequestDispatcher("Product.jsp").forward(request, response);
        }
        catch(SQLException | ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws ServletException, IOException
    {
    }
}
