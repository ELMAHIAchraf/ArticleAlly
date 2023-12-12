package com.example.web.Beans;

public class Article {
    private int id;
    private String titre;
    private String desc;
    private String category;
    private String creator;
    private String creationDate;
    private  String updateDate;



    public Article(int id, String titre, String desc, String category, String creator, String creationDate, String updateDate) {
        this.id = id;
        this.titre = titre;
        this.desc = desc;
        this.category = category;
        this.creator = creator;
        this.creationDate = creationDate;
        this.updateDate = updateDate;
    }
    public Article(int id, String titre, String desc, String category, String creator) {
        this.id = id;
        this.titre = titre;
        this.desc = desc;
        this.category = category;
        this.creator = creator;
    }

    public Article(int id, String titre, String desc) {
        this.id = id;
        this.titre = titre;
        this.desc = desc;
    }
    public Article(String titre, String desc) {
        this.titre = titre;
        this.desc = desc;
    }

    public int getId() {
        return id;
    }

    public String getTitre() {
        return titre;
    }

    public String getDesc() {
        return desc;
    }

    public String getCategory() {
        return category;
    }

    public String getCreator() {
        return creator;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }
}
