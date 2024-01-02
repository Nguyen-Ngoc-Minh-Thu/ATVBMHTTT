package Entity;
import java.util.List;

public class OrderDetails {
    private Order order;
    private List<ProductOrder> productOrders;

    public OrderDetails(Order order, List<ProductOrder> productOrders) {
        this.order = order;
        this.productOrders = productOrders;
    }

    public Order getOrder() {
        return order;
    }

    public List<ProductOrder> getProductOrders() {
        return productOrders;
    }

    public String toString() {
        // Implement your own logic to convert OrderDetails to String
        return "OrderDetails{" +
                "order=" + order +
                ", productOrders=" + productOrders +
                '}';
    }
}
