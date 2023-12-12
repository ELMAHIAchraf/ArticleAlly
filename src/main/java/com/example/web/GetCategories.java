package com.example.web;

import java.io.*;
import java.sql.*;

import com.example.web.Beans.Category;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.*;

@WebServlet("/GetCategories")

public class GetCategories extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {
            try {
                Connection con = jdbc.getConnexion();
                String query = "SELECT cat_id, cat_titre  FROM categories";

                Statement statement = con.createStatement();
                ResultSet res = statement.executeQuery(query);

                List<Category> categories = new ArrayList<>();
                while (res.next()) {
                    int catId = res.getInt("cat_id");
                    String catName = res.getString("cat_titre");

                    Category category = new Category(catId, catName);
                    categories.add(category);
                }
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/addArticle.jsp").forward(request, response);

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
