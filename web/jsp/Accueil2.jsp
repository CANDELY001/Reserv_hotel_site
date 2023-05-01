<%-- 
    Document   : Accueil2
    Created on : Jun 12, 2022, 8:57:38 PM
    Author     : HP
--%>

<%@page import="pk.Models.chambre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pk.dao.MyUtile"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
               <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    </head>
    <body>
          <jsp:include page="/jsp/Header2.jsp"></jsp:include>
          <div class="container">
              
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
   
   <%
         ArrayList<chambre> rooms = new ArrayList<>();
       Connection con=MyUtile.seConnecter();
       ResultSet rs=con.createStatement().executeQuery("select * from chambre");
       int i = 0;
       while(rs.next()){
       rooms.add(new chambre(rs.getInt("idch"),rs.getString("img"),rs.getString("title")));
       }
       for(chambre room:rooms){
   %> <div class="carousel-item <%=(i==0)?"active":""%> ">
       <img src="/Dream_Hotel/chambres/<%=room.getImg()%>" alt="sliide1" style="width: 100%; height: 600px">
  <div class="carousel-caption d-none d-md-block">
    <h5><%=room.getTitle()%></h5>
   

  </div></div>
    <%i++;
        }%>
   
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
              
          </div>
         <jsp:include page="/jsp/Footer.jsp"></jsp:include>
    </body>
</html>
