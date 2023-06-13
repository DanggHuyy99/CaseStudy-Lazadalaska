package model;

public class Product {
    private int id;

    private String name;

    private double price;

    private String describe;

    private int quantity;

    private String img;


    private Category category;

    public Product(int id, String name, double price, String describe, int quantity, String img, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.quantity = quantity;
        this.img = img;
        this.category = category;
    }

    public Product(String name, double price, String describe, int quantity, String img, Category category) {
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.quantity = quantity;
        this.img = img;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
