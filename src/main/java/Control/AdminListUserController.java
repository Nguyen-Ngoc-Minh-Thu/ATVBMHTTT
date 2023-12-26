package Control;

import Dao.AccountDao;
import Dao.OrderDao;
import Entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminListUserController", value = "/AdminListUser")
public class AdminListUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //creat map acount
        Map<Account, Integer> map = new HashMap<Account, Integer>();
        List<Account> list;
        AccountDao dao = new AccountDao();
        OrderDao orderdao = new OrderDao();
        try {
            list = dao.getAllAccount();
            for(Account a: list){
                map.put(a, orderdao.countOrder(a.getUsername()));
            }
            request.setAttribute("listaccount", map);
            request.getRequestDispatcher("AdminListUser.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
