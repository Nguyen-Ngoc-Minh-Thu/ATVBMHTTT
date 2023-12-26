package service;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import Entity.Account;
import java.sql.SQLException;

public class UserService extends Service
{
    public UserService() throws SQLException, ClassNotFoundException {
    }
    // encodepassword
    public Account findAccount(String username, String password) throws SQLException, ClassNotFoundException {
        Account account = null;
        PreparedStatement ps = super.db.getStatement("select * from account where username=?");
        ps.setString(1, username);
        final ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String encodepassword = rs.getString("password");
            if(PasswordEncoder.checkPassword(password, encodepassword)){
                account = new Account(rs.getString("username"), rs.getString("password"),
                        rs.getString("fullname"), rs.getString("phone"), rs.getInt("sex"),
                        Integer.parseInt(rs.getString("newsletter")));
                account.setRole(rs.getInt("role"));
                account.setEnable(rs.getInt("enabled"));
            }
        }
        return account;
    }
    
    public Account findAccount(String name) throws SQLException, ClassNotFoundException {
        Account account = null;
        PreparedStatement ps = super.db.getStatement("select * from account where ? = username");
        ps.setString(1, name);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            account = new Account(rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("phone"), rs.getInt("sex"), Integer.parseInt(rs.getString("newsletter")));
            account.setEnable(rs.getInt("enabled"));
        }
        return account;
    }
}