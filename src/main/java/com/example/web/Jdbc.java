package com.example.web;
import java.sql.*;
public class Jdbc {
    private static Connection con;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/articles_db", "root", "");
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    public Connection getConnexion() {
        return con;
    }
}