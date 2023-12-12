package com.example.web;

import java.io.*;
import java.sql.*;
import java.util.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/DeleteArticle")
public class DeleteArticle extends HttpServlet {
    private  Jdbc jdbc;
    public void init() {
        jdbc=new Jdbc();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String art_id=request.getParameter("art_id");
        try{
           Connection con = jdbc.getConnexion();
           String query="DELETE FROM articles WHERE art_id=?";
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, art_id);
           int recordNum = ps.executeUpdate();
           if(recordNum>0){
               response.sendRedirect("listArticle");
           }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void destroy() {

    }
}