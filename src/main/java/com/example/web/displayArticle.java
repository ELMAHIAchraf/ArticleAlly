package com.example.web;

import java.io.*;
import java.sql.*;

import com.example.web.Beans.Article;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/displayArticle")
public class displayArticle extends HttpServlet {
    private Jdbc jdbc;
    public void init() {
        jdbc = new Jdbc();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String art_id=request.getParameter("art_id");

        try {
            Connection con = jdbc.getConnexion();
            String query ="SELECT art_titre, art_description FROM articles WHERE art_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,art_id);
            ResultSet res = ps.executeQuery();

            if(res.next()){
                String art_titre = res.getString("art_titre");
                String art_description = res.getString("art_description");
                Article article= new Article(art_titre, art_description);
                request.setAttribute("article", article);

                HttpSession session = request.getSession();
                if(session.getAttribute("user_id")!=null) {
                    request.getRequestDispatcher("displayArticleCon.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("displayArticle.jsp").forward(request, response);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void destroy() {

    }
}