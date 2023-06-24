package model;

public class BillHome {
    private int id;
    private int userId;
    private long date;
    private double total;
    private boolean isCart;

    public BillHome() {
    }

    public BillHome(int userId, long date, double total, boolean isCart) {
        this.userId = userId;
        this.date = date;
        this.total = total;
        this.isCart = isCart;
    }

    public BillHome(int id, int userId, long date, double total, boolean isCart) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.total = total;
        this.isCart = isCart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public long getDate() {
        return date;
    }

    public void setDate(long date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isCart() {
        return isCart;
    }

    public void setCart(boolean cart) {
        isCart = cart;
    }
}
