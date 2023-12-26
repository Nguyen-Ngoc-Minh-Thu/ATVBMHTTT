package Dao;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;
import Connect.DataDB;
import Entity.Product;
import service.Ulti;

public class ProductDao
{
    public Product getProduct(final String id) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product where id_product=?");
        sta.setString(1, id);
        ResultSet rs = sta.executeQuery();
        Product product = null;
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), images);
        }
        return product;
    }
    public boolean checkId(String id) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product where id_product=?");
        sta.setString(1, id);
        ResultSet rs = sta.executeQuery();
        return rs.next();
    }
    public String id_notfound() throws SQLException, ClassNotFoundException {
        String id = Ulti.randomText();
        while(checkId(id)){
            id = Ulti.randomText();
        }
        return id;
    }
    public void insertImageProduct(String id_product, String link) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement rs = db.getStatement("insert into imageproduct(id_product, link) values (? , ?)");
        rs.setString(1, id_product);
        rs.setString(2, link);
        rs.executeUpdate();
    }
    public List<Product> getProductsBestSeller() throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<Product>();
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product ORDER BY products_sold DESC limit 0, 3");
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            Product product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), images);
            list.add(product);
        }
        return list;
    }
    public void updateProduct(String id, String name, String brand, int category, int price, int pricebuy, int quantity, String detail) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement sta = db.getStatement("update product set name =?, brand =?,category = ?, price=?, price_buy = ?, quantity =?, detail =? where id_product = ?");
        sta.setString(1, name);
        sta.setString(2, brand);
        sta.setInt(3, category);
        sta.setInt(4, price);
        sta.setInt(5, pricebuy);
        sta.setInt(6, quantity);
        sta.setString(7, detail);
        sta.setString(8, id);
        sta.executeUpdate();
    }
    public List<Product> getProductsBestSeller(int n) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<Product>();
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product ORDER BY products_sold DESC limit 0, ?");
        sta.setInt(1, n);
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            Product product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), images);
            list.add(product);
        }
        return list;
    }
    
    public List<Product> getProductsRelation(final int category) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<Product>();
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product  where category = ? limit 0, 10");
        sta.setInt(1, category);
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            Product product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), (List)images);
            list.add(product);
        }
        return list;
    }
    
    public List<Product> getAllProducts() throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<Product>();
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product");
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            Product product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), images);
            list.add(product);
        }
        return list;
    }
    
    public List<Product> getAllProducts(final int category) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<Product>();
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta = db.getStatement("select * from product where category=?");
        sta.setInt(1, category);
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            Product product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), images);
            list.add(product);
        }
        return list;
    }
    public List<Product> getAllProducts(int category, String text) throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<Product>();
        DataDB db = new DataDB();
        DataDB db2 = new DataDB();
        PreparedStatement sta;
        if(text==null && category==0) {
            sta = db.getStatement("select * from product");
        }
        else if(category == 0 && text!=null){
            sta = db.getStatement("select * from product where name like ?");
            sta.setString(1, "%"+text+"%");
        } else if (category !=0 && text==null) {
            sta = db.getStatement("select * from product where category=?");
            sta.setInt(1, category);
        } else{
            sta = db.getStatement("select * from product where category=? and name like ?");
            sta.setInt(1, category);
            sta.setString(2, "%"+text+"%");
        }
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            List<String> images = new ArrayList<String>();
            String id_product = rs.getString("id_product");
            PreparedStatement staImg = db2.getStatement("select * from imageproduct where id_product=?");
            staImg.setString(1, id_product);
            ResultSet rsImg = staImg.executeQuery();
            while (rsImg.next()) {
                images.add("Image/"+rsImg.getString("link"));
            }
            Product product = new Product(rs.getString("id_product"), rs.getString("name"), rs.getInt("price"), rs.getString("brand"), rs.getInt("category"), rs.getString("stock"), rs.getInt("price_buy"), rs.getInt("quantity"), rs.getInt("products_sold"), rs.getString("detail"), images);
            list.add(product);
        }
        return list;
    }
    public static void main(final String[] args) throws SQLException, ClassNotFoundException {
        ProductDao dao = new ProductDao();
        List<Product> list = dao.getAllProducts(0, "bạc");
        for (Product p : list) {
            System.out.println(p.toString());
        }
    }

    public void insertProduct(String idProduct, String nameproduct, String brand, int category, int price, int pricebuy, int quantity, String detail) throws SQLException, ClassNotFoundException {
        DataDB db = new DataDB();
        PreparedStatement rs = db.getStatement("insert into product(id_product, name, brand, category, price, price_buy, quantity, detail, products_sold, stock) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        rs.setString(1, idProduct);
        rs.setString(2, nameproduct);
        rs.setString(3, brand);
        rs.setInt(4, category);
        rs.setInt(5, price);
        rs.setInt(6, pricebuy);
        rs.setInt(7, quantity);
        rs.setString(8, detail);
        rs.setInt(9, 0);
        if(quantity!=0){
            rs.setString(10,"Còn hàng");
        }
        else rs.setString(10,"Hết hàng");
        rs.executeUpdate();
    }
}