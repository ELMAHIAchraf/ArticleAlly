package com.example.web;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.example.web.Beans.Article;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/ShowArticleCon")
public class ShowArticleCon extends HttpServlet {
    private Jdbc jdbc;
    public void init() {
        jdbc=new Jdbc();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
            Connection con = jdbc.getConnexion();

            String query="SELECT art_id, art_titre, art_description, cat_titre, user_name  FROM articles NATURAL JOIN categories NATURAL JOIN users";
            Statement statement= con.createStatement();
            ResultSet res = statement.executeQuery(query);

            List <Article> articles = new ArrayList<>();
            while(res.next()){
                int art_id = res.getInt("art_id");
                String art_titre = res.getString("art_titre");
                String art_description = res.getString("art_description");
                String cat_titre = res.getString("cat_titre");
                String user_name = res.getString("user_name");


                Article article= new Article(art_id, art_titre, art_description, cat_titre, user_name);
                articles.add(article);
            }
            request.setAttribute("articles", articles);
            request.getRequestDispatcher("home.jsp").forward(request, response);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {

    }
}