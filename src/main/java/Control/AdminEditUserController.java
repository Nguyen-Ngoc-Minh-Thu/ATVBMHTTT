package Control;

import Dao.AccountDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminEditUserController", value = "/AdminEditUser")
public class AdminEditUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        int sex = Integer.parseInt(request.getParameter("sex"));
        int enable = Integer.parseInt(request.getParameter("enabled"));
        try {
            AccountDao.updateAccount(fullname, phone, sex, enable, username);
            response.sendRedirect("AdminUser?id="+username);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
