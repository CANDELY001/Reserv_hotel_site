<%-- 
    Document   : Header2
    Created on : Jun 12, 2022, 9:04:26 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><div class="logo">
                    <a href="#"><img src="/Dream_Hotel/pics/LogoMakr-3UNcX6.png" /></a>
                </div></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/Dream_Hotel/jsp/Accueil2.jsp">Accueil <span class="sr-only">(current)</span></a>
      </li>
  
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Settings room
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="/Dream_Hotel/jsp/Rooms.jsp">See all rooms</a> 
            <a class="dropdown-item" href="/Dream_Hotel/jsp/Addroom.jsp">Add room</a>
       
        
        </div>
      </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Settings offre
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="/Dream_Hotel/jsp/Offres.jsp">See all offre</a> 
            <a class="dropdown-item" href="/Dream_Hotel/jsp/Addoffre.jsp">Add offre</a>
        
      
        </div>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="/Dream_Hotel/LogoutServlet">Log out</a>
      </li>
    </ul>
  </div>
</nav>
    </body>
</html>
