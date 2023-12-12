package com.example.web;

import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;

@WebServlet("/editCategory")

public class editCategory extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

        HttpSession session = request.getSession();
        if(session!=null && session.getAttribute("user_id")!=null) {

            String cat_id = StringEscapeUtils.escapeHtml4(request.getParameter("cat_id"));
            String title = StringEscapeUtils.escapeHtml4(request.getParameter("title"));
            String desc = StringEscapeUtils.escapeHtml4(request.getParameter("desc"));
            LocalDateTime date = LocalDateTime.now();
            java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(date);

            try {
                Connection con = jdbc.getConnexion();
                String query = "UPDATE categories SET cat_titre=?, cat_description=?, cat_update_date=? WHERE cat_id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, title);
                ps.setString(2, desc);
                ps.setTimestamp(3, dateTime);
                ps.setString(4, cat_id);

                int recordNum = ps.executeUpdate();

                if (recordNum > 0) {
                    response.sendRedirect("listCategory");
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
