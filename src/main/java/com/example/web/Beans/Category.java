package com.example.web.Beans;

public class Category {
    private int id;
    private String name;
    private String description;
    private String user_name;
    private String cat_creation_date;
    private  String cat_update_date;

    public Category(int id, String name, String description, String user_name, String cat_creation_date, String cat_update_date) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.user_name = user_name;
        this.cat_creation_date = cat_creation_date;
        this.cat_update_date = cat_update_date;
    }
    public Category(int id, String name, String description){
        this.id=id;
        this.name=name;
        this.description=description;
    }
    public Category(int id, String name){
        this.id=id;
        this.name=name;
    }

    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getCat_creation_date() {
        return cat_creation_date;
    }

    public String getCat_update_date() {
        return cat_update_date;
    }
}
