<%-- 
    Document   : error
    Created on : Jun 16, 2022, 11:37:01 PM
    Author     : HP
--%>
<%@ page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   </head>
<style>
html{
font-family: arial;
}
.container{
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
}

.title h1{
width: 400px;
height: 200px;
text-align: center;
line-height: 200px;
font-size: 48px;
}
.title{
border: 3px solid #002752;
margin-bottom: 30px;
}
.msg{
margin-bottom: 30px;
}
button{
background-color: #000;
color: #fff;
width: 400px;
height: 70px;
position: absolute;
bottom: 0;
right: 440px;
font-size: 18px;
}
button:hover{
background-color: #fff;
color: #000;
}
</style>
<body>
<div class="container">
<div class="logo"><a href="//acceuil.jsp"><img src="/Dream_Hotel/pics/LogoMakr-3UNcX6.png"/></a></div>
<div class="title"><h1>404</h1></div>
<div class="msg"><h3>PAGE NOT FOUND</h3></div>
<div class="btn"><button onclick="window.location.href='//Accueil.jsp'">GO BACK HOME</button></div>
</div>

    </body>
</html>
