package Control;

import service.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@MultipartConfig
@WebServlet(name = "VerifyOTP", value = "/VerifyOTP")
public class VerifyOTP extends HttpServlet {
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        PrintWriter out = response.getWriter();

        int code = SendMail.randomOTP();
        session.setAttribute("my-otp", code);
        SendMail.send(username, "Xác minh tài khoản",
                "Mã xác nhận tài khoản của bạn là: " + code);
        out.println(1);
        out.flush();

        // Đặt một nhiệm vụ để xoá session sau 1 phút
        scheduler.schedule(() -> session.removeAttribute("my-otp"), 1, TimeUnit.MINUTES);
    }
//

    @Override
    public void destroy() {
        scheduler.shutdownNow();
    }

}
