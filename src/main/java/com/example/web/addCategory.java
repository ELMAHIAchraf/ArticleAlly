package com.example.web;

import java.io.*;
import java.sql.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.time.*;

import org.apache.commons.text.StringEscapeUtils;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/addCategory")

public class addCategory extends HttpServlet {

    private Jdbc jdbc;

    public void init() {
        jdbc = new Jdbc();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("user_id") != null) {

            String title = StringEscapeUtils.escapeHtml4(request.getParameter("title"));
            String desc = StringEscapeUtils.escapeHtml4(request.getParameter("desc"));
            LocalDateTime date = LocalDateTime.now();
            java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(date);

            int user_id = (int) session.getAttribute("user_id");

            try {
                Connection con = jdbc.getConnexion();
                String query = "INSERT INTO categories" +
                        "(cat_titre, cat_description, cat_creation_date, cat_update_date, user_id)" +
                        " VALUES(?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, title);
                ps.setString(2, desc);
                ps.setTimestamp(3, dateTime);
                ps.setTimestamp(4, dateTime);
                ps.setInt(5, user_id);

                int recordNum = ps.executeUpdate();

                if (recordNum > 0) {
                    response.sendRedirect("listCategory");
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("ShowArticle");
        }


    }

    public void destroy() {

    }
}
