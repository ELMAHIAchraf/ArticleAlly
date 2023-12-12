package com.example.web;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.example.web.Beans.Category;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/listCategory")
public class listCategory extends HttpServlet {
    private Jdbc jdbc;
    public void init() {
        jdbc=new Jdbc();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {
            try {
                Connection con = jdbc.getConnexion();

                String query = "SELECT cat_id, cat_titre, cat_description, user_name, cat_creation_date, cat_update_date  FROM  categories NATURAL JOIN users";
                Statement statement = con.createStatement();
                ResultSet res = statement.executeQuery(query);


                List<Category> categories = new ArrayList<>();

                while (res.next()) {

                    int cat_id = res.getInt("cat_id");
                    String cat_titre = res.getString("cat_titre");
                    String cat_description = res.getString("cat_description");
                    String user_name = res.getString("user_name");
                    String cat_creation_date = res.getString("cat_creation_date");
                    String cat_update_date = res.getString("cat_update_date");

                    Category category = new Category(cat_id, cat_titre, cat_description, user_name, cat_creation_date, cat_update_date);
                    categories.add(category);

                }
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("listCategory.jsp").forward(request, response);

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