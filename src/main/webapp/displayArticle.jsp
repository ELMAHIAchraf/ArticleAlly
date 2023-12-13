<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="CSS/displayArticle.css">
    <style>
        body {
            margin: 0;
            font-family: 'IBM Plex Sans Arabic', sans-serif;
        }
        #cont{
            margin-top: 10px;
            padding: 50px;
        }
    </style>
</head>
<body>
    <c:choose>
        <c:when test="${connected==1}">
            <%@include file="navBarCon.jsp"%>
        </c:when>
        <c:otherwise>
            <%@include file="navBar.jsp"%>
        </c:otherwise>
    </c:choose>
    <div id="cont">
        <h1>${article.getTitre()}</h1>
        <p>${article.getDesc()}</p>
    </div>
</body>
</html>
