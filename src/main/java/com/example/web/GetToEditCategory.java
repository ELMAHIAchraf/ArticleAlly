package com.example.web;

import java.io.*;
import java.sql.*;

import com.example.web.Beans.Category;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/GetToEditCategory")

public class GetToEditCategory extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{

        try{

            Connection con = jdbc.getConnexion();
            int cat_id = Integer.parseInt(request.getParameter("cat_id"));
            String query="SELECT cat_titre, cat_description FROM  categories WHERE cat_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cat_id);
            ResultSet res = ps.executeQuery();

            if(res.next()){
                String cat_titre = res.getString("cat_titre");
                String cat_description = res.getString("cat_description");
                Category category = new Category(cat_id, cat_titre, cat_description);

                request.setAttribute("category", category);
                request.getRequestDispatcher("editCategory.jsp").forward(request, response);
            }


        }catch (Exception e){
            e.printStackTrace();
        }


    }
    public void destroy(){

    }
}
