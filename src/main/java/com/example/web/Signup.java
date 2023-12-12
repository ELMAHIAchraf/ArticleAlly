package com.example.web;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/Signup")

public class Signup extends HttpServlet{

    private Jdbc jdbc;
    public void init(){
        jdbc=new Jdbc();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

        String name = StringEscapeUtils.escapeHtml4(request.getParameter("name"));
        String email = StringEscapeUtils.escapeHtml4(request.getParameter("email"));
        String pwd = BCrypt.hashpw(StringEscapeUtils.escapeHtml4(request.getParameter("pwd")), BCrypt.gensalt(12));

        try{
            Connection con = jdbc.getConnexion();
            String query="INSERT INTO users(user_name, user_email, user_pwd) VALUES(?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);


            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, pwd);

            int recordNum = pst.executeUpdate();

            if(recordNum > 0){
                ResultSet genKeys = pst.getGeneratedKeys();
                if(genKeys.next()){
                    int user_id=genKeys.getInt(1);
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", user_id);
                    response.sendRedirect("ShowArticleCon");
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }


    }
    public void destroy(){

    }
}
