package Entity;

import java.util.List;

public class Product
{
    private String id;
    private String name;
    private int price;
    private String brand;
    private int category;
    private String stock;
    private int price_buy;
    private int quantity;
    private int product_sold;
    private String detail;
    private List<String> images;
    
    public Product(String id, String name, int price, String brand, int category, String stock, int price_buy, int quantity, int product_sold, String detail, List<String> images) {
        this.category = category;
        this.id = id;
        this.name = name;
        this.price = price;
        this.brand = brand;
        this.stock = stock;
        this.price_buy = price_buy;
        this.quantity = quantity;
        this.product_sold = product_sold;
        this.detail = detail;
        this.images = images;
    }
    
    public int getCategory() {
        return this.category;
    }
    
    public void setCategory(int category) {
        this.category = category;
    }
    
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public int getPrice() {
        return this.price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public List<String> getImages() {
        return this.images;
    }
    
    public void setImages(List<String> images) {
        this.images = images;
    }
    
    public String getBrand() {
        return this.brand;
    }
    
    public void setBrand(String brand) {
        this.brand = brand;
    }
    
    public String getStock() {
        return this.stock;
    }
    
    public void setStock(String stock) {
        this.stock = stock;
    }
    
    public int getPrice_buy() {
        return this.price_buy;
    }
    
    public void setPrice_buy(int price_buy) {
        this.price_buy = price_buy;
    }
    
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getProduct_sold() {
        return this.product_sold;
    }
    
    public void setProduct_sold(int product_sold) {
        this.product_sold = product_sold;
    }
    
    public String getDetail() {
        return this.detail;
    }
    
    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", brand='" + brand + '\'' +
                ", category=" + category +
                ", stock='" + stock + '\'' +
                ", price_buy=" + price_buy +
                ", quantity=" + quantity +
                ", product_sold=" + product_sold +
                ", detail='" + detail + '\'' +
                ", images=" + images +
                '}';
    }
}