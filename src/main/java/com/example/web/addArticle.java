package com.example.web;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.time.*;
import org.apache.commons.text.StringEscapeUtils;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/addArticle")

public class addArticle extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {

            String title = StringEscapeUtils.escapeHtml4(request.getParameter("title"));
            String desc = StringEscapeUtils.escapeHtml4(request.getParameter("desc"));
            String cat = StringEscapeUtils.escapeHtml4(request.getParameter("cat"));
            LocalDateTime date = LocalDateTime.now();
            java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(date);

            int user_id = (int) session.getAttribute("user_id");

            try {
                Connection con = jdbc.getConnexion();
                String query = "INSERT INTO articles" +
                        "(art_titre, art_description, art_creation_date, art_update_date, cat_id, user_id)" +
                        " VALUES(?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, title);
                ps.setString(2, desc);
                ps.setTimestamp(3, dateTime);
                ps.setTimestamp(4, dateTime);
                ps.setString(5, cat);
                ps.setInt(6, user_id);

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
