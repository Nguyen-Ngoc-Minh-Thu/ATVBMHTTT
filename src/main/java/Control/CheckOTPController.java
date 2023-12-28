package Control;

import Dao.AccountDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CheckOTPController", value = "/CheckOTP")
public class CheckOTPController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String otp = request.getParameter("otp");
        System.out.println(username);
        System.out.println(otp);
        try {
            if(AccountDao.checkOTP(username, otp)){
                if(AccountDao.checkTime(username)){
                    request.setAttribute("username", username);
                    request.getRequestDispatcher("UpdatePassword.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("username", username);
                    request.setAttribute("mess", "Ma OTP đã hết hạn, vui lòng chọn nhận lại mã để nhận mã OTP mới");
                    request.getRequestDispatcher("CheckOTP.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("mess", "Ma OTP sai");
                request.setAttribute("username", username);
                request.getRequestDispatcher("CheckOTP.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
