package Control;

import java.sql.SQLException;
import javax.servlet.ServletResponse;
import javax.servlet.ServletRequest;

import Dao.AccountDao;
import Entity.Account;
import RSASigner.RSASigner;
import org.json.JSONObject;
import service.PasswordEncoder;
import service.SendMail;
import service.UserService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.security.KeyPair;

@WebServlet(name = "RegisterController", value = {"/Register"})
public class RegisterController extends HttpServlet {
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        final String firstname = request.getParameter("firstname");
        final String lastname = request.getParameter("lastname");
        final String email = request.getParameter("email");
        final String phone = request.getParameter("telephone");
        final String password = request.getParameter("password");
        final String verifyPassword = request.getParameter("confirm");
        String publicKey = request.getParameter("publicKey");
        String privateKey = request.getParameter("privateKey");
        //ép kiểu String sang int để kiểm tra
        int otp = Integer.parseInt(request.getParameter("otp"));


        final int newsletter = 0;
        final int sex = Integer.parseInt(request.getParameter("male"));
        System.out.println(password + "-" + verifyPassword);
        final String fullname = firstname + " " + lastname;
        if (!password.equals(verifyPassword)) {
            request.setAttribute("mess", "Mật khẩu không trùng khớp! Vui lòng nhập lại");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }
        if(session.getAttribute("my-otp") != null){
            int my_top = (int) session.getAttribute("my-otp");
            if ( my_top == otp ){
                try {
                    final UserService service = new UserService();
                    final Account account = service.findAccount(email);
                    if (account == null) {
                        String encodePassword = PasswordEncoder.hashPassword(password);
                        final Account acountNew = new Account(email, encodePassword, fullname, phone, sex, newsletter);

                        AccountDao.addAccount(acountNew);
                        AccountDao.addPublicKey(email, publicKey);
//                        System.out.println(privateKey);
                        SendMail.send(email, "Private Key của bạn là", privateKey);
//                        System.out.println(acountNew.toString());
                        request.setAttribute("mess", "Đăng ký tài khoản thành công, Và private key đã được gửi về mail của bạn hãy kiểm tra - đừng để lộ private key ra bên ngoài.");
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("mess", "Tài khoản đã tồn tại!");
                        request.getRequestDispatcher("Register.jsp").forward((ServletRequest) request, (ServletResponse) response);
                    }

                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            } else {
                request.setAttribute("mess", "OTP không trùng khớp");
                request.getRequestDispatcher("Register.jsp").forward((ServletRequest) request, (ServletResponse) response);
            }
        }else{
            request.setAttribute("mess", "Vui lòng nhập OTP!!!");
            request.getRequestDispatcher("Register.jsp").forward((ServletRequest) request, (ServletResponse) response);
        }


    }




}