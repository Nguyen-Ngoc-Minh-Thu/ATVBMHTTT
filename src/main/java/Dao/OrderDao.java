package Dao;

import Entity.Order;
import java.sql.ResultSet;
import java.util.ArrayList;
import Entity.ProductOrder;
import java.util.List;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import Connect.DataDB;

import javax.xml.crypto.Data;

public class OrderDao
{
    public void updateOrder(String id, String status) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update order1 set status =? where id=?");
        sta.setString(2, id);
        sta.setString(1, status);
        sta.executeUpdate();
    }
    public int countOrder(String username) throws SQLException, ClassNotFoundException {
        int i=0;
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from account where username = ?");
        sta.setString(1, username);
        ResultSet rs = sta.executeQuery();
        while(rs.next()){
            i++;
        }

        return i;
    }
    public void addOrder(final String id, final String username, final String payment, final String ship, final int totalship, final int total, final String fullname, final String phone, final String address, final String comment, final int number) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("insert into order1(id, username, payment, ship, totalship, total, fullname, phone, address, comment, date, status, number) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)");
        sta.setString(1, id);
        sta.setString(2, username);
        sta.setString(3, payment);
        sta.setString(4, ship);
        sta.setInt(5, totalship);
        sta.setInt(6, total);
        sta.setString(7, fullname);
        sta.setString(8, phone);
        sta.setString(9, address);
        sta.setString(10, comment);
        sta.setString(11, "Đang xử lý");
        sta.setInt(12, number);
        sta.executeUpdate();
    }
    public List<Order> getAllOrders()  throws SQLException, ClassNotFoundException{
        List<Order> list = new ArrayList<Order>();
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from order1 order by date desc");
        ResultSet rs = sta.executeQuery();
        Order order;
        while(rs.next()){
            order = new Order(rs.getString("id"), rs.getString("username"), rs.getString("payment"), rs.getString("ship"), rs.getString("fullname"), rs.getString("phone"), rs.getString("address"), rs.getInt("total"), rs.getDate("date"), rs.getInt("totalship"), rs.getString("comment"), rs.getString("status"), rs.getInt("number"), rs.getTime("date"));
            order.setNameAccount(AccountDao.getFullName(rs.getString("username")));
            list.add(order);
        }
        return list;
    }

    public List<ProductOrder> getProductsOrder(String id_order) throws SQLException, ClassNotFoundException {
        List<ProductOrder> list = new ArrayList<ProductOrder>();
        DataDB db = new DataDB();
        ProductDao product;
        PreparedStatement sta = db.getStatement("select * from product_order where id_order = ?");
        sta.setString(1, id_order);
        ResultSet rs = sta.executeQuery();
        ProductOrder p;
        while (rs.next()) {
            p = new ProductOrder(rs.getInt("id"), rs.getString("id_order"), rs.getString("id_product"), rs.getInt("quantity"), rs.getInt("total"));
            list.add(p);
        }
        return list;
    }

    public List<Order> getAllOrders(String username) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<Order>();
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from order1 where username = ? order by date desc");
        sta.setString(1, username);
        ResultSet rs = sta.executeQuery();
        Order order;
        while (rs.next()) {
                order = new Order(rs.getString("id"), rs.getString("username"), rs.getString("payment"), rs.getString("ship"), rs.getString("fullname"), rs.getString("phone"), rs.getString("address"), rs.getInt("total"), rs.getDate("date"), rs.getInt("totalship"), rs.getString("comment"), rs.getString("status"), rs.getInt("number"), rs.getTime("date"));
                list.add(order);
        }
        return list;
    }

    public void addProductOrder(final String id_order, final String id_product, final int quantity, final int total) throws SQLException, ClassNotFoundException {
        final DataDB db = new DataDB();
        final PreparedStatement sta = db.getStatement("insert into product_order(id_order, id_product, quantity, total) values (?,?,?,?)");
        sta.setString(1, id_order);
        sta.setString(2, id_product);
        sta.setInt(3, quantity);
        sta.setInt(4, total);
        sta.executeUpdate();
    }

    public boolean checkIdOrder(final String id_order) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from order1 where id=?");
        sta.setString(1, id_order);
        ResultSet rs = sta.executeQuery();
        return !rs.next();
    }

    public Order getOrder(final String idOrder) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from order1 where id = ?");
        sta.setString(1, idOrder);
        ResultSet rs = sta.executeQuery();
        if (rs.next()) {
            Order order = new Order(rs.getString("id"), rs.getString("username"), rs.getString("payment"), rs.getString("ship"), rs.getString("fullname"), rs.getString("phone"), rs.getString("address"), rs.getInt("total"), rs.getDate("date"), rs.getInt("totalship"), rs.getString("comment"), rs.getString("status"), rs.getInt("number"), rs.getTime("date"));
            return order;
        }
        return null;
    }

    public List<Order> getOrderWeek() throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<Order>();
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from order1 where week(date)=week(now()) order by date desc");
        ResultSet rs = sta.executeQuery();
        Order order;
        while (rs.next()) {
            order = new Order(rs.getString("id"), rs.getString("username"), rs.getString("payment"), rs.getString("ship"), rs.getString("fullname"), rs.getString("phone"), rs.getString("address"), rs.getInt("total"), rs.getDate("date"), rs.getInt("totalship"), rs.getString("comment"), rs.getString("status"), rs.getInt("number"), rs.getTime("date"));
            list.add(order);
        }
        return list;
    }
}