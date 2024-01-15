package service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendMail {
    public static void send(String to, String sub, String msg) {
        final String user = "20130421@st.hcmuaf.edu.vn";
        final  String pass = "minh@thu12";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");


        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress(to)));
            message.setSubject(sub);
            message.setContent(msg, "text/html; charset=UTF-8");
//            message.setContent(msg, "text/html");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static int randomOTP() {
        return (int) Math.floor(((Math.random() * 899999) + 100000));
    }


}
