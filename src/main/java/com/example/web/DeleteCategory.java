package com.example.web;

import java.io.*;
import java.sql.*;
import java.util.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/DeleteCategory")
public class DeleteCategory extends HttpServlet {
    private  Jdbc jdbc;
    public void init() {
        jdbc=new Jdbc();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cat_id=request.getParameter("cat_id");

        try{
            Connection con = jdbc.getConnexion();

            String query2="DELETE FROM articles WHERE cat_id=?";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.setString(1, cat_id);
            int recordNum2 = ps2.executeUpdate();

            String query="DELETE FROM categories WHERE cat_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cat_id);
            int recordNum = ps.executeUpdate();
            if(recordNum>0){
                response.sendRedirect("listCategory");
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void destroy() {

    }
}