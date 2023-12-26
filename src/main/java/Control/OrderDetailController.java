// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   OrderDetailController.java

package Control;

import Dao.OrderDao;
import Entity.Account;
import Entity.ProductOrder;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "OrderDetailController", value = { "/OrderDetail" })
public class OrderDetailController extends HttpServlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            response.sendRedirect("Login.jsp");
            return;
        }
        String id_order = request.getParameter("id");
        OrderDao dao = new OrderDao();
        try
        {
            Entity.Order order = dao.getOrder(id_order);
            List<ProductOrder> list = dao.getProductsOrder(id_order);
            request.setAttribute("order", order);
            request.setAttribute("orderdetail", list);
            request.getRequestDispatcher("Orderdetail.jsp").forward(request, response);
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
