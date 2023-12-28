package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import Connect.DataDB;
import Entity.Account;
import service.Ulti;

public class AccountDao
{
    public static void addAccount(final Account account) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("insert into account (username, password, fullname, phone, sex, role, enabled, newsletter, date) values (?, ?, ?, ?, ?, 1, 1, ?, now())");
        sta.setString(1, account.getUsername());
        sta.setString(2, account.getPassword());
        sta.setString(3, account.getFullName());
        sta.setString(4, account.getPhoneNumber());
        sta.setInt(5, account.getSex());
        sta.setString(6, ""+account.getNewsletter());
        sta.executeUpdate();
    }

    public static boolean checkTime(String username) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("SELECT TIME_TO_SEC(TIMEDIFF(now(), time_otp)) as 'time' from account where username=?");
        sta.setString(1, username);
        ResultSet rs = sta.executeQuery();
        while(rs.next()){
            //muon setting thoi gian hieu luc bao lau thi sua tham so
            return rs.getInt("time")<=60 ? true : false;
        }
        return false;
    }

    public List<Account> getAllAccount() throws SQLException, ClassNotFoundException {
        List<Account> list = new ArrayList<Account>();
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from account");
        ResultSet rs = sta.executeQuery();
        Account account;
        while(rs.next()){
            account = new Account(rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("phone"), rs.getInt("sex"), rs.getInt("newsletter"));
            account.setEnable(rs.getInt("enabled"));
            account.setDate(rs.getDate("date"));
            list.add(account);
        }

        return list;
    }
    public static void updateAccount(final Account account) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update account set fullname =? , phone=? , sex=? where username = ?");
        sta.setString(1, account.getFullName());
        sta.setString(2, account.getPhoneNumber());
        sta.setInt(3, account.getSex());
        sta.setString(4, account.getUsername());
        sta.executeUpdate();
    }
    public static void updateAccount(String fullname, String phone, int sex, int enabled, String username) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update account set fullname =? , phone=? , sex=?, enabled=? where username = ?");
        sta.setString(1, fullname);
        sta.setString(2, phone);
        sta.setInt(3, sex);
        sta.setInt(4, enabled);
        sta.setString(5, username);
        sta.executeUpdate();
    }
    public static void updatePassword(final Account account) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update account set password =? where username = ?");
        sta.setString(1, account.getPassword());
        sta.setString(2, account.getUsername());
        sta.executeUpdate();
    }
    public static void updatePassword(String username, String password) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update account set password =? where username = ?");
        System.out.println(password);
        sta.setString(1, password);
        sta.setString(2, username);
        sta.executeUpdate();
    }
    public static void insertOTP(String username, String OTP) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update account set otp =?, time_otp = now() where username = ?");
        sta.setString(1, OTP);
        sta.setString(2, username);
        sta.executeUpdate();
    }
    public static String getFullName(String username) throws SQLException, ClassNotFoundException{
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from account where username = ?");
        sta.setString(1, username);
        ResultSet rs = sta.executeQuery();
        String name = "";
        if(rs.next()){
            name = rs.getString("fullname");
        }
        return name;
    }
    public static boolean checkOTP(String username, String otp) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from account where otp=? and username=?");
        sta.setString(1, otp);
        sta.setString(2, username);
        ResultSet rs = sta.executeQuery();
        if(rs.next()){
            return true;
        }
        return false;
    }

    public List<Account> getAccountWeek() throws SQLException, ClassNotFoundException {
        List<Account> list = new ArrayList<Account>();
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from account where week(date) = week(now())");
        ResultSet rs = sta.executeQuery();
        Account account;
        while(rs.next()){
            account = new Account(rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("phone"), rs.getInt("sex"), rs.getInt("newsletter"));
            account.setEnable(rs.getInt("enabled"));
            account.setDate(rs.getDate("date"));
            list.add(account);
        }
        return list;
    }
}