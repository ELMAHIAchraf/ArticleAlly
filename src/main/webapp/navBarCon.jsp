<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="CSS/navBarCon.css">
    <title>Document</title>
    <style>
        #nav{
            display: flex;
            align-items: center;
            background-color: #e3f2fd;
        }
        .navButt{
            position: fixed;
            background-color: transparent;
            border: none;
            color: rgb(104, 104, 104);
            font-size: 14px;
        }

        #dropDown1, #dropDown2{
            margin-left: 10px;
            cursor: pointer;
        }
        #articlesDD1, #articlesDD2{
            display: none;
            border: 1px solid #b0b0b0;
            border-radius: 4px;
            margin-left: 50px;
            width: 135px;
            height: 50px;
            flex-direction: column;
            align-items: center;
            margin-top: -5px;
            background-color: white;
            position: fixed;
        }
        #articlesDD2{
            margin-left: 120px;
            width: 170px;

        }
        #articlesDD1 > div, #articlesDD2 > div{
            height: 25px;
            width: 100%;
            text-align: center;
            padding-top: 3px;
            z-index: 10;
        }
        #articlesDD1 > div:hover, #articlesDD2 > div:hover{
            background-color: rgb(233, 233, 233);
            cursor: pointer;
        }
        #navButt1, #navButt2{
            color: rgb(104, 104, 104);
            font-size: 14px;
        }
        #navButt2{
            left: 120px;
        }
        #navButt3{
            right: 10px;
            margin-top: -10px;
            cursor: pointer;
        }
        #navTxt{
            margin-left: 10px;
            text-decoration: none;
            color: black;
            padding-top: 16px;
            padding-bottom: 16px;
            cursor: pointer;
        }
        .bordDiv{
            border-bottom:solid 1px #b0b0b0;
        }
    </style>
</head>
<body>
    <div id="nav">
        <a href="ShowArticle" id="navTxt">EST</a>

        <div id="dropDown1" onclick="dropDown('articlesDD1')">
            <div id="navButt1">Articles <i class="fa-solid fa-caret-down"></i></div>
        </div>

        <div id="dropDown2" onclick="dropDown('articlesDD2')">
            <div id="navButt2">Catégories <i class="fa-solid fa-caret-down"></i></div>
        </div>
        <form action="Logout" method="Post">
            <input type="submit" class="navButt" id="navButt3" value="Déconnexion">
        </form>
    </div>
    <div id="articlesDD1">
        <div  class="bordDiv" onclick="redirectTo('listArticle')">Tous les articles</div>
        <div onclick="redirectTo('GetCategories')">Ajouter un article</div>
    </div>
    <div id="articlesDD2">
        <div class="bordDiv" onclick="redirectTo('listCategory')">Tous les catégorie</div>
        <div onclick="redirectTo('addCategory.jsp')">Ajouter une catégorie</div>
    </div>
    <script>
        let i=0;
        let oldId=""
        function dropDown(id){
            if(oldId!=id){
                i=0;
            }
            oldId=id;
            if(i%2==0){
                document.getElementById("articlesDD1").style.display='none'
                document.getElementById("articlesDD2").style.display='none'
                document.getElementById(id).style.display='flex'
            }else{
                document.getElementById(id).style.display='none'
            }
            i++;
        }
        function redirectTo(page){
            window.location.replace(page)
        }
    </script>
</body>
</html>

