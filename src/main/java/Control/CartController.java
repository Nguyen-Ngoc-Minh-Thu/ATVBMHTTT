package Control;

import Dao.ProductDao;
import Entity.Account;
import Entity.Cart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name="CartController", value={"/Cart"})
public class CartController extends HttpServlet
{

    public CartController()
    {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        String id = request.getParameter("id");
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        if(id != null)
        {
            cart.addProductUpdate(id, 1);
            request.getRequestDispatcher("ListProduct").forward(request, response);
        } else
        {
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        Account account = (Account)request.getSession().getAttribute("account");
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        if(account == null)
        {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        } else
        {
            String id = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.addProductUpdate(id, quantity);
            response.sendRedirect("/ListProduct");
            return;
        }
    }
}
