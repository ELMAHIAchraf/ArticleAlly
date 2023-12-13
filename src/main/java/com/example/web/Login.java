package com.example.web;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/Login")

public class Login extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

        String email = StringEscapeUtils.escapeHtml4(request.getParameter("email"));
        String pwd = StringEscapeUtils.escapeHtml4(request.getParameter("pwd"));

        try{
            if(!email.isEmpty() && !pwd.isEmpty()) {
                Connection con = jdbc.getConnexion();
                String query = "SELECT * FROM users WHERE user_email=?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, email);
                ResultSet res = pst.executeQuery();

                if (res.next()) {
                    String storedPwd = res.getString("user_pwd");
                    int user_id = res.getInt("user_id");

                    if (BCrypt.checkpw(pwd, storedPwd)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("user_id", user_id);
                        response.sendRedirect("");
                    } else {
                        request.setAttribute("error", "Email or password are incorrect");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            }else{
                request.setAttribute("error", "Enter your email and password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
             }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void destroy(){

    }
}
