package Control;

import Entity.Account;
import org.apache.commons.mail.EmailException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static Utils.MailUtils.sendEmail;

@WebServlet(name = "ReportPrivateController", value = "/ReportPrivate")
public class ReportPrivateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("account");
        if (account == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        System.out.println(account.getUsername());
        String messString = (String) request.getAttribute("message");
        if (messString == null) {
            HttpSession session = request.getSession();
            String confirmCode = createOTP();
            try {
                sendEmail(account.getUsername(), confirmCode);
            } catch (EmailException e) {
                throw new RuntimeException(e);
            }
            session.setAttribute("confirmCode", confirmCode);
            session.setAttribute("timeEndOTP", new Date().getTime() / 1000 + 2 * 60);
        }
        request.setAttribute("message", messString);
        request.getRequestDispatcher("VerifyOwner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

    public static String createOTP() {
        Random rd = new Random();
        String confirmCode = rd.nextInt(1000000) + "";
        return confirmCode;
    }
}