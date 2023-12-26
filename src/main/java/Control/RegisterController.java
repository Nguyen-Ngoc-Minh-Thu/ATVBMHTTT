package Control;

import java.sql.SQLException;
import javax.servlet.ServletResponse;
import javax.servlet.ServletRequest;
import Dao.AccountDao;
import Entity.Account;
import service.PasswordEncoder;
import service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "RegisterController", value = { "/Register" })
public class RegisterController extends HttpServlet
{
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final String firstname = request.getParameter("firstname");
        final String lastname = request.getParameter("lastname");
        final String email = request.getParameter("email");
        final String phone = request.getParameter("telephone");
        final String password = request.getParameter("password");
        final String verifyPassword = request.getParameter("confirm");
        final int newsletter = 0;
        final int sex = Integer.parseInt(request.getParameter("male"));
        System.out.println(password+"-"+verifyPassword);
        final String fullname =  firstname+" "+ lastname;
        if(!password.equals(verifyPassword)){
            request.setAttribute("mess", "Mật khẩu không trùng khớp! Vui lòng nhập lại");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }
        try {
            final UserService service = new UserService();
            final Account account = service.findAccount(email);
            if (account == null) {
                String encodePassword = PasswordEncoder.hashPassword(password);
                final Account acountNew = new Account(email, encodePassword, fullname, phone, sex, newsletter);
                AccountDao.addAccount(acountNew);
                System.out.println(acountNew.toString());
                request.setAttribute("mess", "Đăng ký tài khoản thành công");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            else {
                request.setAttribute("mess", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("Register.jsp").forward((ServletRequest)request, (ServletResponse)response);
            }
        }
        catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}