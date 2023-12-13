<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add category</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="CSS/listCategory.css">
    <style>
        body{
            margin: 0;
            font-family: 'IBM Plex Sans Arabic', sans-serif;
        }
        #addCat{
            background-color: #198754;
            color: white;
            width: 160px;
            height: 40px;
            border-radius: 4px;
            border: none;
            font-size: 15px;
            margin-left: 254px;
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
            width: 170px;
        }
        th:nth-of-type(3){
            width: 120px;
        }
        th:nth-of-type(4),th:nth-of-type(5){
            width:180px;
        }
        th:nth-of-type(6){
            width: 103px;
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
<%@ include file="navBarCon.jsp"%>
<div>
<button id="addCat" onclick="redirectTo('addCategory.jsp')">Ajouter une catégorie</button>

<table border="1">
    <tr>
        <th>Titre</th>
        <th>Description</th>
        <th>Créé par</th>
        <th>Créé à</th>
        <th>Mise à jour à</th>
        <th>Action</th>
    </tr>
    <c:choose >
        <c:when test="${!empty categories}">
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.getName()}</td>
                    <td>${category.getDescription()}</td>
                    <td>${category.getUser_name()}</td>
                    <td>${category.getCat_creation_date()}</td>
                    <td>${category.getCat_update_date()}</td>
                    <td>
                        <a href="GetToEditCategory?cat_id=${category.getId()}">Edit</a>
                        <form action="DeleteCategory" method="Post">
                            <input type="hidden" name="cat_id" value="${category.getId()}">&ensp;
                            <input id="subButt" type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </c:otherwise>
    </c:choose>
</table>

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