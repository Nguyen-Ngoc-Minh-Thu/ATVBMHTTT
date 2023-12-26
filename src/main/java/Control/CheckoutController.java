
package Control;

import Entity.Account;
import Entity.Cart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "CheckoutController", value = { "/Checkout" })
public class CheckoutController extends HttpServlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            response.sendRedirect("Login.jsp");
            return;
        }
        if(cart.getCart().isEmpty())
        {
            response.sendRedirect("Cart");
            return;
        } else
        {
            request.getRequestDispatcher("Checkout.jsp").forward(request, response);
            return;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
    }
}
