package Control;

import Entity.Account;
import Entity.Cart;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "LoginController", value = { "/Login" })
public class LoginController extends HttpServlet
{

    protected void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
            throws ServletException, IOException
    {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        try
        {
            UserService service = new UserService();
            Account account = service.findAccount(username, password);
            if(account == null)
            {
                request.setAttribute("mess", "Sai thông tin!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else if(account.getRole()==2){
                HttpSession session = request.getSession();
                session.setAttribute("admin", account);
                response.sendRedirect("AdminIndex");
            }
            else
            {
                if(account.getEnable()==1) {
                    request.setAttribute("mess", "Đăng nhập thành công");
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);
                    session.setAttribute("cart", new Cart());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("mess", "Tài khoản đã bị khóa, vui lòng liên hệ admin để được giải quyết");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            }
        }
        catch(SQLException | ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }
    }
}
