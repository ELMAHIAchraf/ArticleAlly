package com.example.web;

import java.io.*;
import java.sql.*;

import com.example.web.Beans.Article;
import com.example.web.Beans.Category;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.*;

@WebServlet("/GetToEditArticle")

public class GetToEditArticle extends HttpServlet{


    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {
            try {
                Connection con = jdbc.getConnexion();
                int user_id = (int) session.getAttribute("user_id");
                String query = "SELECT cat_id, cat_titre FROM categories WHERE user_id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, user_id);
                ResultSet res = ps.executeQuery();

                List<Category> categories = new ArrayList<>();
                while (res.next()) {
                    int catId = res.getInt("cat_id");
                    String catName = res.getString("cat_titre");

                    categories.add(new Category(catId, catName));
                }
                int art_id = Integer.parseInt(request.getParameter("art_id"));

                String query2 = "SELECT art_titre, art_description FROM  articles WHERE art_id=?";
                PreparedStatement ps2 = con.prepareStatement(query2);
                ps2.setInt(1, art_id);
                ResultSet res2 = ps2.executeQuery();

                if (res2.next()) {
                    String art_titre = res2.getString("art_titre");
                    String art_description = res2.getString("art_description");

                    Article article = new Article(art_id, art_titre, art_description);

                    request.setAttribute("article", article);
                }
                request.setAttribute("categories", categories);

                request.getRequestDispatcher("editArticle.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            response.sendRedirect("ShowArticle");
        }

    }
    public void destroy(){

    }
}
