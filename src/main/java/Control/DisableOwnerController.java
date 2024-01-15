package Control;

import Entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "DisableOwnerController", value = "/DisableOwner")
public class DisableOwnerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            response.sendRedirect("Login.jsp");
            return;
        }
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute("confirmCode");

        if (code != null) {
            String otp = request.getParameter("otp");
            if(code.equalsIgnoreCase(otp)){
                request.getRequestDispatcher("GeneratePrivateKey.jsp").forward(request, response);
            }
            else {
                request.setAttribute("message", "OTP không trùng khớp");
                request.getRequestDispatcher("/VerifyOwner.jsp").forward(request, response);
            }
        }
        else {
            request.getRequestDispatcher("/").forward(request, response);
        }
    }
}