<%-- 
    Document   : Offer
    Created on : Jun 9, 2022, 5:46:02 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pk.dao.MyUtile"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/Dream_Hotel/css/Offer.css"/>
    </head>
    <body>
        <jsp:include page="/jsp/Header.jsp"></jsp:include>
        <%
            Connection con = MyUtile.seConnecter();
            ResultSet rs = con.createStatement().executeQuery("select * from offre join service using(idservice) where datefin >=sysdate");

        %>

  <%while(rs.next()){%>
        <div class="popup" id="popup<%=rs.getInt("idoffre")%>">
            <div class="popup-inner">
                
                <div class="popup__photo">

                    <img src="/Dream_Hotel/pics/<%=rs.getString("img")%>" />
                </div>
                <div class="popup__text">
                    <h1>Get the chance to benefit of<%=rs.getString("title")%></h1>
                    <p>
                        <%=rs.getString("detail")%>
                    </p>
                    <div class="info">
                        <p>code promo : <%=rs.getString("promo")%></p>
                        <p>Numero de telephone : +<%=rs.getString("tele")%></p>
                        <p>Email :<%=rs.getString("email")%></p>
                        <p>Adresse :<%=rs.getString("adresse")%></p>
                    </div>
                </div>
                <a class="popup__close" href="#">X</a>
                
            </div>
        </div><%} rs.close();%>
        <section class="sec2">
            <video
                src="/Dream_Hotel/pics/My Movie.mp4"
                muted
                loop
                autoplay
                ></video>
            <div class="content">
                <h1>Talk of the town</h1>
                <!--<h1> UN MONDE <br> INNOMBRABLES <br>POSSIBILITÉS<br>& DE RÊVES </h1> -->
                <div class="socialdiv">
                    <ul class="social">
                        <li>
                            <a href="#"
                               ><img src="https://i.ibb.co/x7P24fL/facebook.png"
                                  /></a>
                        </li>
                        <li>
                            <a href="#"
                               ><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"
                                  /></a>
                        </li>
                        <li>
                            <a href="#"
                               ><img src="https://i.ibb.co/ySwtH4B/instagram.png"
                                  /></a>
                        </li>
                    </ul>
                    <!--<div class="icon-scroll">
                     <img src="/Users/candely/Desktop/dream hotel/pics/outline_keyboard_arrow_down_white_24dp.png">
                    </div>-->
                </div>
            </div>
        </section>

        <div class="con">
            <h1 class="title">Special Offers</h1>
            <div class="quad"> 
                <% rs = con.createStatement().executeQuery("select * from offre join service using(idservice) where datefin >=sysdate");

while (rs.next()) {
                %>
               
                        
      <figure class="image-block">
        <h1><%=rs.getString("title")%></h1>
        <img src="/Dream_Hotel/pics/<%=rs.getString("img")%>" alt="" />
        <figcaption>
            <a href="#popup<%=rs.getInt("idoffre")%>"> More Info
                <input type="hidden" value="<%=rs.getInt("idoffre")%>" name="id"></a>
                
        </figcaption>
      </figure>
  
    
              
                <%}%>


            </div>
        </div>
        
        <jsp:include page="/jsp/Footer.jsp"></jsp:include>
        <script>
           
        </script>
    </body>


</body>
</html>
