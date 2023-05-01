<%-- 
    Document   : Favoris
    Created on : Jun 12, 2022, 5:17:58 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pk.dao.MyUtile"%>
<%@page import="java.sql.Connection"%>
<%@page import="pk.Models.Visiteur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/Dream_Hotel/css/Favoris.css"/>
        <script
            src="https://kit.fontawesome.com/f6dcf461c1.js" crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <jsp:include page="/jsp/Header.jsp"></jsp:include>
        <%
         if(session.getAttribute("v")==null){
             request.setAttribute("msg", "This page required the authentification");
             request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
             }%>
            <section class="sec2">
                <video src="/Dream_Hotel/pics/My Movie.mp4" muted loop autoplay></video>
                <div class="content">
                    <h1>
                        Every great design <br />begins with <br />an even better story. 
                        
                    </h1>
                   <!--  <h1> UN MONDE <br> INNOMBRABLES <br>POSSIBILITÉS<br>& DE RÊVES </h1> -->
                    <div class="socialdiv">
                        <ul class="social">
                            <li>
                                <a href="#"
                                   ><img src="https://i.ibb.co/x7P24fL/facebook.png"
                                      /></a>
                            </li>
                            <li>
                                <a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png" /></a>
                            </li>
                            <li>
                                <a href="#"
                                   ><img src="https://i.ibb.co/ySwtH4B/instagram.png"
                                      /></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <section class="sec3">
                <div class="wrap">
                    <%
                        Visiteur v=null;
                        if(request.getSession().getAttribute("v")!=null){
                        v=(Visiteur)request.getSession().getAttribute("v");
                        }
                        Connection con=MyUtile.seConnecter();
                        ResultSet rs=con.createStatement().executeQuery("select * from saved join chambre using(idch) where pseudo like '"+v.getPseudo()+"'");
                        while(rs.next()){
                    %> 
                    <div class="blog-post">
                        <div
                            class="blog-post_img"

                            >
                            <img src="/Dream_Hotel/chambres/<%=rs.getString("img")%>" alt="" />
                        </div>
                        <div class="blog-post_info">
                            <div class="blog-post_date"></div>
                            <h1 class="blog-post_title"><%=rs.getString("title")%></h1>
                            <p class="blog-post_text">
                                <%=rs.getString("description")%>
                            </p>
                            <div class="starts">
                                <span class="hint-star star">
                                    <i class="fa fa-star" aria-hidden="true" style="color:gold"></i>
                                    <i class="fa fa-star" aria-hidden="true" style="color:gold"></i>
                                    <i class="fa fa-star" aria-hidden="true" style="color:gold"></i>
                                    <i class="fa fa-star" aria-hidden="true" style="color:gold"></i>
                                    <i class="fa fa-star-o" aria-hidden="true" style="color:gold"></i>
                                </span>
                            </div>
                            <a href="/Dream_Hotel/jsp/checkout.jsp" class="blog-post_cta">Book now</a>

                                                    <div class="property-social-icons">

<i id="<%=rs.getString("idch")%>" class="fas fa-heart" style="font-size: 30px;" onclick="jadore('<%=rs.getString("idch")%>')"></i>

</div
                        </div>
                    </div>
                </div><%}%>
            </section>

        <jsp:include page="/jsp/Footer.jsp"></jsp:include>
        <script>
            var m = 0;

            function jadore(e) {
                if (m == 0) {
                    document.getElementById(e).style.color = "gainsboro";
                    m++;
                } else {
                    document.getElementById(e).style.color = "red";
                    m = 0;
                }



            }
        </script>
    </body>
</html>
