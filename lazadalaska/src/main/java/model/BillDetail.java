package model;

public class BillDetail {
    private int detail_id;
    private Bill bill_id;
    private Product product_id;
    private int quantity;
    private Double price;

    public BillDetail() {
    }

    public BillDetail(Bill bill_id, Product product_id, int quantity, Double price) {
        this.bill_id = bill_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.price = price;
    }

    public BillDetail(int detail_id, Bill bill_id, Product product_id, int quantity, Double price) {
        this.detail_id = detail_id;
        this.bill_id = bill_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.price = price;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public Bill getBill_id() {
        return bill_id;
    }

    public void setBill_id(Bill bill_id) {
        this.bill_id = bill_id;
    }

    public Product getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Product product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
