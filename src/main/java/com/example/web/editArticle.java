package com.example.web;

import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;

@WebServlet("/editArticle")

public class editArticle extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {
            String art_id = StringEscapeUtils.escapeHtml4(request.getParameter("art_id"));
            String title = StringEscapeUtils.escapeHtml4(request.getParameter("title"));
            String desc = StringEscapeUtils.escapeHtml4(request.getParameter("desc"));
            String cat = StringEscapeUtils.escapeHtml4(request.getParameter("cat"));
            LocalDateTime date = LocalDateTime.now();
            java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(date);


            try {
                Connection con = jdbc.getConnexion();
                String query = "UPDATE articles SET art_titre=?, art_description=?, cat_id=?, art_update_date=? WHERE art_id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, title);
                ps.setString(2, desc);
                ps.setString(3, cat);
                ps.setTimestamp(4, dateTime);
                ps.setString(5, art_id);

                int recordNum = ps.executeUpdate();

                if (recordNum > 0) {
                    response.sendRedirect("listArticle");
                }


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
