package model;

import java.time.Instant;

public class Category {
    private int id;

    private String name;
    private Instant deleteAt;

    public Category(String name) {
        this.name = name;
    }

    public Category(int id, String name){
        this.id = id;
        this.name = name;

    }



    public Instant getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Instant deleteAt) {
        this.deleteAt = deleteAt;
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


}

