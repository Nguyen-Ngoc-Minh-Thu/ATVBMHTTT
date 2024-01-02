package Control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import Dao.AccountDao;
import RSASigner.RSASigner;
import org.json.JSONObject;
import java.security.KeyPair;

@WebServlet(name = "GenerateKeyServlet", value = "/GenerateKeyServlet")
public class GenerateKeyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RSASigner rsa = new RSASigner();
        try {
            rsa.generateKeyPair();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        String publicKey = rsa.publicKeyToString();
        String privateKey = rsa.privateKeyToString();

        // Lưu trữ khóa công khai và khóa riêng tư trong session
        HttpSession session = request.getSession();
        session.setAttribute("publicKey", publicKey);
        session.setAttribute("privateKey", privateKey);

        // Gửi dữ liệu JSON chứa khóa công khai và khóa riêng tư về client
        JSONObject responseData = new JSONObject();
        responseData.put("publicKey", publicKey);
        responseData.put("privateKey", privateKey);

        response.setContentType("application/json");
        response.getWriter().write(responseData.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
