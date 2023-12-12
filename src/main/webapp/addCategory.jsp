<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add category</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="CSS/editCategory.css">
    <style>
        body{
            margin: 0;
            font-family: 'IBM Plex Sans Arabic', sans-serif;
        }
        #loginCon{
            width: 30%;
            border-radius: 7px;
            display: flex;
            align-items: center;
            flex-direction: column;
            margin: auto;
            margin-top: 100px;
        }
        .inp{
            width: 450px;
            height: 37px;
            margin-bottom: 15px;
            font-size: 15px;
            border-radius: 5px;
            outline-color: #cdeaff;
            border-width: 1.5px;
            border-color: #65656554;
        }
        #textAr{
            height: 120px;
        }
        .inp:focus{
            box-shadow: 0px 0px 0px 4px #8fcefcc3;
        }
        #subButt{
            border-radius: 4px;
            font-size: 15.5px;
            border: none;
            width: 120px;
            height: 37px;
            color: white;
            background-color: #0c6dfd;
            margin-bottom: 15px;
            cursor: pointer;

        }
        p{
            margin-top: -7px;
            margin-bottom: 5px;
        }
        h1{
            margin-left: -130px;
        }
    </style>
</head>
<body>
<%@ include file="navBarCon.jsp" %>
<div id="loginCon">
    <h1>Ajouter une categorie</h1>
    <form action="addCategory" method="Post">
        <p>Titre</p>
        <input type="text" class="inp" name="title">
        <p>Description</p>
        <textarea name="desc" class="inp" id="textAr"></textarea>
        <br><input type="submit" id="subButt" name="sub" value="Sauvegarder">
    </form>

</body>
</html>

