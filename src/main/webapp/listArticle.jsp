<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add article</title>
    <link rel="stylesheet" href="CSS/listArticle.css">
    <style>
        body{
            margin: 0;
            font-family: 'IBM Plex Sans Arabic', sans-serif;
        }
        #addArticle{
            background-color: #198754;
            color: white;
            width: 140px;
            height: 40px;
            border-radius: 4px;
            border: none;
            font-size: 15px;
            margin-left: 102px;
            margin-top: 100px;
            cursor: pointer;
        }
        form{
            display: inline-block;
        }
        #subButt{
            background-color: transparent;
            border: none;
            text-decoration: underline;
            color: #3c87f7;
            font-size: 16px;
        }
        table{
            border-collapse: collapse;
            margin:auto;
        }
        th{
            background-color: #0d6efd;
            border-color:white;
            color: white;
            padding: 13px 10px;
            text-align: left;
        }
        th:nth-of-type(1){
            width:150px;
        }
        th:nth-of-type(2){
            width: 350px;
        }
        th:nth-of-type(3){
            width: 130px;
        }
        th:nth-of-type(4),th:nth-of-type(5){
            width:150px;
        }
        td{
            border-color: #cccccc;
            padding: 10px;
        }
        a{
            color: #3c87f7;
        }
    </style>
</head>
<body>
<%@ include file="navBarCon.jsp" %>
<div id="cont">
    <button id="addArticle" onclick="redirectTo('GetCategories')">Ajouter un article</button>
    <table border="1">
        <tr>
            <th>Titre</th>
            <th>Description</th>
            <th>Categorie</th>
            <th>Créé par</th>
            <th>Créé à</th>
            <th>Mise à jour à</th>
            <th>Action</th>
        </tr>
        <c:forEach var="article" items="${articles}">
            <tr>
                <td>${article.getTitre()}</td>
                <td>${article.getDesc()}</td>
                <td>${article.getCategory()}</td>
                <td>${article.getCreator()}</td>
                <td>${article.getCreationDate()}</td>
                <td>${article.getUpdateDate()}</td>
                <td>
                    <a href="GetToEditArticle?art_id=${article.getId()}">Edit</a>&ensp;
                    <form action="DeleteArticle" method="Post">
                        <input type="hidden" name="art_id" value="${article.getId()}">&ensp;
                        <input id="subButt" type="submit" value="Delete">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    tr=document.getElementsByTagName('tr');
    for (let i = 0; i < tr.length; i++) {
        if(i%2==0){
            tr[i].style.backgroundColor='white';
        }else{
            tr[i].style.backgroundColor='#f2f2f2';
        }
    }
    function  redirectTo(path){
        window.location.replace(path);
    }
</script>
</body>
</html>