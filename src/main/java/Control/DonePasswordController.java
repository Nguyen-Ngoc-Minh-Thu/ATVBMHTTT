package Control;

import Dao.AccountDao;
import service.PasswordEncoder;
import service.Ulti;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DonePasswordController", value = "/DonePassword")
public class DonePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        if(password.equals(repassword)){
            System.out.println(password);
            try {
                String pass = PasswordEncoder.hashPassword(password);
                AccountDao.updatePassword(username, pass);
                response.sendRedirect("Login.jsp");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        else{
            request.setAttribute("mess", "Mat khau khong trùng khớp");
            request.setAttribute("username", username);
            request.getRequestDispatcher("UpdatePassword.jsp").forward(request, response);
        }

    }
}
