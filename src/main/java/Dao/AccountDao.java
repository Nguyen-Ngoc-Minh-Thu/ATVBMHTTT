package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Connect.DataDB;
import Entity.Account;
import service.Ulti;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;

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



    public static String getPublicKeyAsBase64(PublicKey publicKey) {
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }

    public static String getPrivateKeyAsBase64(PrivateKey privateKey) {
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }
// kiểm tra có bị trùng khóa
    public static boolean isPublicKeyExists(String publicKey) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("SELECT COUNT(*) AS count FROM account WHERE publicKey = ?");
        sta.setString(1, publicKey);
        ResultSet rs = sta.executeQuery();
        rs.next();
        int count = rs.getInt("count");
        return count > 0;
    }

    //lưu public key vô db
    public static void addPublicKey(String username, String publickey) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        //ngày hiện tại tạo key
        Date today = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String todayFM = formatter.format(today);
        PreparedStatement sta = db.getStatement("INSERT INTO publickey (username, publickey_txt, create_day, STATUS) VALUES (?, ?, ?, ?)");
        sta.setString(1, username);
        sta.setString(2, publickey);
        sta.setString(3, todayFM);
        sta.setString(4, "đang được dùng" );
        sta.executeUpdate();
    }


    //Thư
    public static void setExpiredPublicKey(String username, String date) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update publickey set missing_day = ?, report_day = ?, expired_day = ?, STATUS = 'đã hết hạn' where username = ? and create_day < ? and expired_day is Null ");
        sta.setString(1, date);
        sta.setString(2, date);
        sta.setString(3, date);
        sta.setString(4,username);
        sta.setString(5, date);
        sta.executeUpdate();
    }

    public static void addPublicKey(String username, String publickey_txt, String date) throws SQLException, ClassNotFoundException {

        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("insert into publickey (username, publickey_txt, create_day, STATUS) values (?, ?, ?, ?)");
        sta.setString(1, username);
        sta.setString(2, publickey_txt);
        sta.setString(3, date);
        sta.setString(4, "đang được dùng");
        sta.executeUpdate();

    }
}