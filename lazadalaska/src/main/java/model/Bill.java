package model;

import java.util.Calendar;
import java.util.Date;

public class Bill {
    private int id;
    private User user_id;
    private Date date;
    private double total;
private Status status;



    public Bill(int id, User user_id, Date date, double total, Status status) {
        this.id = id;
        this.user_id = user_id;
        this.date = date;
        this.total = total;
        this.status = status;
    }


    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Bill() {
    }

    public Bill(User user_id, Date date, double total) {
        this.user_id = user_id;
        this.date = date;
        this.total = total;
    }

    public Bill(int id, User user_id, Date date, double total) {
        this.id = id;
        this.user_id = user_id;
        this.date = date;
        this.total = total;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    public int getMonthFromDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.MONTH) + 1; // Tháng trong Calendar được đánh số từ 0 đến 11, nên cần cộng 1.
    }
}
