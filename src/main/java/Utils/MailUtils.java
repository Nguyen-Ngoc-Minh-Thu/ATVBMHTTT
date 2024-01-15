package Utils;

import Dao.AccountDao;
import Entity.Account;
import Entity.MailConfig;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import service.Ulti;
import service.UserService;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class MailUtils {
    static String attachFileName = "private-key_";
    public static boolean sendEmail(String to, String data, String datetime) {
        attachFileName += datetime + ".txt";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MailConfig.APP_EMAIL));
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Day la private key cua ban: ");

            PrintWriter writer = new PrintWriter(new FileWriter(attachFileName));
            writer.println(data);
            writer.flush();
            writer.close();
            MimeBodyPart attachmentPart = new MimeBodyPart();
            attachmentPart.attachFile(attachFileName);
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(attachmentPart);
            message.setContent(multipart);
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            return false;
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            File file = new File(attachFileName);
            if (file.exists()) {
                file.delete();
            }
        }
    }

    public static void main(String[] args) {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        sendEmail("20130215@st.hcmuaf.edu.vn", "Nguyeenx Dacdws Cuongwf", dateFormat.format(now));
    }

    public static void sendEmail(String to, String data) throws EmailException {
        Email email = new SimpleEmail();
        // Cấu hình thông tin Email Server
        email.setHostName(MailConfig.HOST_NAME);
        email.setSmtpPort(MailConfig.TSL_PORT);
        email.setAuthenticator(new DefaultAuthenticator(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD));
        email.setTLS(true);

        email.setFrom(MailConfig.APP_EMAIL);
        // Người nhận
        email.addTo(to);
        // Tiêu đề
        email.setSubject("CVT: Gui ma OTP cho ban");
        // Nội dung email
        email.setMsg("Ma OTP cua ban la: " + data);

        // send message
        email.send();

    }
}
