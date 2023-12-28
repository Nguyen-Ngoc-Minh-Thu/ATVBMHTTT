package Control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import Dao.AccountDao;
import org.json.JSONObject;
import java.security.KeyPair;

@WebServlet(name = "GenerateKeyServlet", value = "/GenerateKeyServlet")
public class GenerateKeyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String publicKey;
            String privateKey;
            KeyPair keyPair;

            do {
                // Tạo khóa mới cho đến khi nó là duy nhất
                keyPair = AccountDao.generateKeyPair();
                publicKey = AccountDao.getPublicKeyAsBase64(keyPair.getPublic());
                privateKey = AccountDao.getPrivateKeyAsBase64(keyPair.getPrivate());
            } while (AccountDao.isPublicKeyExists(publicKey));

            // Trả về khóa dưới dạng JSON
            JSONObject keysJson = new JSONObject();
            keysJson.put("publicKey", publicKey);
            keysJson.put("privateKey", privateKey);

            response.setContentType("application/json");
            response.getWriter().write(keysJson.toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
