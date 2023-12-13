package com.example.web;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.example.web.Beans.Article;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/listArticle")
public class listArticle extends HttpServlet {
    private Jdbc jdbc;
    public void init() {
        jdbc=new Jdbc();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {
            try {
                Connection con = jdbc.getConnexion();

                String query = "SELECT art_id, art_titre, art_description, cat_titre, user_name, user_id, art_creation_date, art_update_date" +
                        "  FROM articles NATURAL JOIN categories NATURAL JOIN users";
                Statement statement = con.createStatement();
                ResultSet res = statement.executeQuery(query);

                List<Article> articles = new ArrayList<>();
                while (res.next()) {
                    int art_id = res.getInt("art_id");
                    String art_titre = res.getString("art_titre");
                    String art_description = res.getString("art_description");
                    String cat_titre = res.getString("cat_titre");
                    int user_id=res.getInt("user_id");
                    String user_name = res.getString("user_name");
                    String art_creation_date = res.getString("art_creation_date");
                    String art_update_date = res.getString("art_update_date");

                    Article article = new Article(art_id, art_titre, art_description, cat_titre,user_id ,user_name, art_creation_date, art_update_date);
                    articles.add(article);
                }
                int current_user = (int) session.getAttribute("user_id");
                request.setAttribute("articles", articles);
                request.setAttribute("current_user", current_user);
                request.getRequestDispatcher("listArticle.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("ShowArticle");
        }
    }

    public void destroy() {

    }
}