<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        body{
            margin: 0;
            font-family: 'IBM Plex Sans Arabic', sans-serif;
        }
        #nav{
            display: flex;
            align-items: center;
            background-color: #e3f2fd;
        }
        .navButt{
            background-color: transparent;
            border: none;
            position: fixed;
            right: 10px;
            color: rgb(104, 104, 104);
            font-size: 14px;
            cursor: pointer;
        }
        #navButt2{
            right: 90px;
        }
        #navTxt{
            margin-left: 10px;
            text-decoration: none;
            color: black;
            padding-top: 16px;
            padding-bottom: 16px;
        }
    </style>
</head>
<body>
    <div id="nav">
        <a href="ShowArticle" id="navTxt">EST</a>
        <button class="navButt" onclick="redirectTo('login.jsp')">S'identifier</button>
        <button class="navButt" id="navButt2" onclick="redirectTo('signup.jsp')">S'inscrire</button>
    </div>
    <script>
        function redirectTo(page){
            window.location.replace(page)
        }
    </script>
</body>
</html>