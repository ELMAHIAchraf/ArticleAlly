<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/signup.css">
    <title>singup</title>
    <style>
        #loginCon{
            width: 30%;
            border-radius: 7px;
            border: 1.5px solid #b0b0b0;
            display: flex;
            align-items: center;
            flex-direction: column;
            margin: auto;
            margin-top: 100px;
        }
        #titleCont{
            background-color: #f7f7f7;
            width: 100%;
            height: 67px;
            border-bottom: 1.5px solid #b0b0b0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
        .inp{
            width: 350px;
            height: 37px;
            margin-bottom: 15px;
            font-size: 15px;
            border-radius: 5px;
            outline-color: #cdeaff;
            border-width: 1.5px;
            border-color: #65656554;
        }
        .inp:focus{
            box-shadow: 0px 0px 0px 4px #8fcefcc3;
        }
        #subButt{
            border-radius: 4px;
            font-size: 15.5px;
            border: none;
            width: 360px;
            height: 37px;
            color: white;
            background-color: #212529;
            margin-bottom: 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="navBar.jsp" %>
<div id="loginCon">
    <div id="titleCont">
        <h2>Enregistrer l'utilisateur</h2>
    </div>
    <form action="Signup" method="Post">
        <input type="text" class="inp" name="name" placeholder="Name">
        <br><input type="email" class="inp" name="email" placeholder="Email">
        <br><input type="password" class="inp" name="pwd" placeholder="Password">
        <br><input type="submit" id="subButt" name="sub" value="S'inscrire">
    </form>
</div>
</body>
</html>