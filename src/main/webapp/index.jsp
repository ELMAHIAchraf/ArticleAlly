<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>home</title>
    <link rel="stylesheet" href="CSS/index.css">
    <style>

        h1{
            margin-top: 80px;
            margin-left: 80px;
        }
        hr{
            width: 90%;
            margin-top: -10px;
        }
        .articlesCont{
            width: 90%;
            gap: 30px;
            margin-left: 75px;
            display: grid;
            grid-template-columns: 33% 33% 33%;

        }
        .articleDiv{
            width: 87%;
        }
        .articleName{
            font-family: 'IBM Plex Sans Arabic', sans-serif;
        }
        .articleDesc{
            font-family: 'IBM Plex Sans Arabic', sans-serif;
            color: rgb(34, 34, 34);
            font-size: 14px;
        }
        .articleDescCreat{
            font-family: 'IBM Plex Sans Arabic', sans-serif;
            font-weight: 600;
            font-size: 14px;
        }
        a{
            font-family: 'IBM Plex Sans Arabic', sans-serif;
            color: rgb(75, 75, 252);
        }
    </style>
</head>
<body>
<%@ include file="navBar.jsp" %>

<h1>Tous les articles</h1>
<hr>

<div class="articlesCont">
    <c:forEach var="article" items="${articles}">
        <div class="articleDiv">
            <h2 class="articleName">${article.getTitre()}</h2>
            <p class="articleDesc">${article.getDesc()}</p>
            <p class="articleDescCreat">Créé par: ${article.getCreator()}</p>
            <p class="articleDescCreat">Categorie: ${article.getCategory()}</p>
            <a href="displayArticle?art_id=${article.getId()}">Afficher</a>
        </div>
    </c:forEach>
</div>
</body>
</html>