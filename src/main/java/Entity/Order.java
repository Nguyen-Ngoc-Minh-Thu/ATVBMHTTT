package Entity;

import java.sql.Time;
import java.sql.Date;

public class Order
{
    private String id;
    private String username;
    private String payment;
    private String ship;
    private String fullname;
    private String phone;
    private String address;
    private int total;
    private Date date;
    private Time time;
    private int totalship;
    private String comment;
    private String status;
    private int number;
    private String nameAccount;
    public Order(String id, String username, String payment, String ship, String fullname, String phone, String address, int total, Date date, int totalship, String comment, String status, int number, Time time) {
        this.id = id;
        this.username = username;
        this.payment = payment;
        this.ship = ship;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.total = total;
        this.date = date;
        this.totalship = totalship;
        this.comment = comment;
        this.status = status;
        this.number = number;
        this.time = time;
    }

    public String getNameAccount() {
        return nameAccount;
    }

    public void setNameAccount(String nameAccount) {
        this.nameAccount = nameAccount;
    }

    public Time getTime() {
        return this.time;
    }
    
    public void setTime(Time time) {
        this.time = time;
    }
    
    public int getNumber() {
        return this.number;
    }
    
    public void setNumber(int number) {
        this.number = number;
    }
    
    public int getTotalship() {
        return this.totalship;
    }
    
    public void setTotalship(int totalship) {
        this.totalship = totalship;
    }
    
    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPayment() {
        return this.payment;
    }
    
    public void setPayment(String payment) {
        this.payment = payment;
    }
    
    public String getShip() {
        return this.ship;
    }
    
    public void setShip(String ship) {
        this.ship = ship;
    }
    
    public String getFullname() {
        return this.fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public int getTotal() {
        return this.total;
    }
    
    public void setTotal(int total) {
        this.total = total;
    }
    
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", payment='" + payment + '\'' +
                ", ship='" + ship + '\'' +
                ", fullname='" + fullname + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", total=" + total +
                ", date=" + date +
                ", time=" + time +
                ", totalship=" + totalship +
                ", comment='" + comment + '\'' +
                ", status='" + status + '\'' +
                ", number=" + number +
                ", nameAccount='" + nameAccount + '\'' +
                '}';
    }
}