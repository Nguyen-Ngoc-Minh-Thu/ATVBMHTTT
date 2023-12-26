// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ListProductController.java

package Control;

import Dao.ProductDao;
import Entity.Product;

import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "ListProductController", value = { "/ListProduct" })
public class ListProductController extends HttpServlet
{


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String cateId = request.getParameter("category");
        String category = null;
        ProductDao dao = new ProductDao();
        List<Product> list = null;
        try
        {
            if(cateId == null)
            {
                list = dao.getAllProducts();
                category = "Danh sách sản phẩm";
            } else
            if(cateId.equals("thatlung"))
            {
                list = dao.getAllProducts(3);
                category = "Thắt lưng nam";
            } else
            if(cateId.equals("matthatlung"))
            {
                list = dao.getAllProducts(2);
                category = "Mặt thắt lưng";
            } else
            if(cateId.equals("daythatlung"))
            {
                list = dao.getAllProducts(1);
                category = "Dây thắt lưng";
            }
            request.setAttribute("list", list);
            request.setAttribute("category", category);
            request.setAttribute("id", cateId);
            request.getRequestDispatcher("ListProduct.jsp").forward(request, response);
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
