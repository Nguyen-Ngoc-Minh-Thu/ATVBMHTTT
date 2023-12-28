// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HistoryOrderController.java

package Control;

import Dao.OrderDao;
import Entity.Account;
import Entity.Order;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "HistoryOrderController", value = { "/HistoryOrder" })
public class HistoryOrderController extends HttpServlet
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
        OrderDao dao = new OrderDao();
        try
        {
            List<Order> list = dao.getAllOrders(account.getUsername());
            request.setAttribute("listorder", list);
            request.getRequestDispatcher("HistoryOrder.jsp").forward(request, response);
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
