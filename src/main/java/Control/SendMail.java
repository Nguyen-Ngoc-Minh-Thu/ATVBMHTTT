package Control;

import Dao.AccountDao;
import Entity.Account;
import Entity.MailConfig;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import service.Ulti;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SendMail", value = "/SendMail")
public class SendMail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Email email = new SimpleEmail();
        // Cấu hình thông tin Email Server
        email.setHostName(MailConfig.HOST_NAME);
        email.setSmtpPort(MailConfig.TSL_PORT);
        email.setAuthenticator(new DefaultAuthenticator(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD));
        email.setTLS(true);
        String username = request.getParameter("email");

        // Người gửi
        try {
            UserService user = new UserService();
            Account account = user.findAccount(username);
            if(account == null){
                request.setAttribute("mess", "Người dùng không tồn tại");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }
            else {
                String OTP = Ulti.randomOTP();
                AccountDao.insertOTP(account.getUsername(), OTP);
                email.setFrom(MailConfig.APP_EMAIL);
                // Người nhận
                email.addTo(account.getUsername());

                // Tiêu đề
                email.setSubject("CVT: Gui ma OTP cho ban. Ma OTP nay co hieu luc trong 60s ke tu khi nhan duoc mail nay!");

                // Nội dung email
                email.setMsg("Ma OTP cua ban la: " + OTP);

                // send message
                email.send();

                System.out.println("Message sent successfully");
                request.setAttribute("mess", "Đã gui ma OTP vào mail của bạn");
                request.setAttribute("username", account.getUsername());
                request.getRequestDispatcher("CheckOTP.jsp").forward(request, response);
            }
        } catch (EmailException | SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}
