package Control;

import Dao.AccountDao;
import Entity.Account;
import RSASigner.RSASigner;
import Utils.MailUtils;
import RSASigner.RSASigner;
import Utils.MailUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Random;

import static Utils.MailUtils.sendEmail;

@WebServlet(name = "GeneratePrivateKeyController", value = "/GeneratePrivateKey")
public class GeneratePrivateKeyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            response.sendRedirect("Login.jsp");
            return;
        }
        String dateTime = request.getParameter("datetime");
        LocalDateTime localDateTime = LocalDateTime.parse(dateTime);

        ZoneId zoneIdICT = ZoneId.of("Asia/Ho_Chi_Minh");

        // Convert LocalDateTime to a specific timezone (ICT)
        LocalDateTime localDateTimeICT = localDateTime.atZone(zoneIdICT).toLocalDateTime();

        // Define a format for displaying LocalDateTime
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        // Format LocalDateTime in ICT timezone as a String
        String dateTimeICTString = localDateTimeICT.format(formatter);

        //update expiredPublicKey
        try {
            AccountDao.setExpiredPublicKey(account.getUsername(), dateTimeICTString);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //generate key
        //sendmail private key và lưu public key vào db
        RSASigner rsa = new RSASigner();
        String privateKey = rsa.getPrivateKey();
        String publicKey = rsa.getPublicKey();
        //send mail private key
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat dateFormatSendMail = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        MailUtils.sendEmail(account.getUsername(), privateKey, dateFormatSendMail.format(now));
        //luu public key vao db
        try {
            AccountDao.addPublicKey(account.getUsername(), publicKey, dateFormat.format(now));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("MyAccount.jsp").forward(request,response);
    }
}