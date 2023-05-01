<%-- 
    Document   : Header
    Created on : Jun 2, 2022, 9:22:00 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pk.dao.MyUtile"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pk.Models.Cryptage"%>
<%@page import="pk.Models.Visiteur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
            />
        <link rel="stylesheet" href="/Dream_Hotel/css/Header.css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <button
            onclick="topFunction()"
            id="myBtn"
            class="icon-scroll"
            title="Go to top"
            >
            <span class="material-symbols-outlined" id="goup"> arrow_upward </span>
        </button>
        <header>
            <div class="menu">
                <div class="navi-item">
                    <a class="aleft" href="/Dream_Hotel/Accueil.jsp">HOME</a>
                    <a href="/Dream_Hotel/jsp/ChambreandTarif.jsp">ROOMS & TARIFS</a>
                    <a href="/Dream_Hotel/jsp/Favoris.jsp"
                       ><img
                            id="favimg"
                            src="/Dream_Hotel/pics/outline_favorite_border_white_24dp.png"
                            />FAVORIS</a
                    >
                </div>
                <div class="logo">
                    <a href="#"><img src="/Dream_Hotel/pics/LogoMakr-3UNcX6.png" /></a>
                </div>

                <div class="navi-item2">
                    <a href="/Dream_Hotel/jsp/Offer.jsp">OFFRES</a>
                    <a href="/Dream_Hotel/jsp/location.jsp">LOCALISATION</a>
                    <% Visiteur v = null;
                        Connection con = MyUtile.seConnecter();
                        Cookie[] cks = request.getCookies();
                        if (cks.length > 0) {
                            for (Cookie ck : cks) {
                                if (ck != null && ck.getName().equals("auth")) {
                                    String login = Cryptage.decrypt(ck.getValue().split("/")[0]);
                                    String mdp = Cryptage.decrypt(ck.getValue().split("/")[1]);

                                    PreparedStatement ps = con.prepareStatement("select * from visiteur where email=? and mdp=?");
                                    ps.setString(1, login);
                                    ps.setString(2, mdp);
                                    ResultSet rs = ps.executeQuery();
                                    if (rs.next()) {
                                        HttpSession se = request.getSession();
                                        se.setAttribute("v", new Visiteur(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4)));
                                    }
                                }
                            }
                        }
                        con.close();
                        if (session.getAttribute("v") != null) {
                            v = (Visiteur) session.getAttribute("v");
                        }
                        if (v == null) {
                    %>
                    <a href="/Dream_Hotel/jsp/Login.jsp">CONTACT-US</a>
                </div>
                      </div>
                    <%} else if(v.getEtate().equals("null")){%>
                      </div>
                        </div>
                    <div class="dropdown">
                        <a class=" dropbtn"><i class='fa fa-user' style='font-size:14px'> <%=v.getPseudo()%></i></a>
                        <div class="dropdown-content">
                             <a  href="#popup">Manage Account</a>
                           <a  href="#popup2">Payement details</a>
                            <a  href="/Dream_Hotel/LogoutServlet">log out</a>
                        </div>
                    </div>

                    
                    <%  }

                    %> 

               
          

            <span
                style="font-size: 30px; cursor: pointer"
                id="menubtn"
                onclick="openNav()"
                >&#9776;
            </span>
            <div id="myNav" class="overlay">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"
                   >&times;</a
                >
                <div class="overlay-content">
                    <ul>
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">ROOMS & TARIFS</a></li>
                        <li><a href="#">FAVORIS</a></li>
                        <li><a href="#">OFFRES</a></li>
                        <li><a href="/Dream_Hotel/jsp/location.jsp">LOCALISATION</a></li>

                        <li><a href="../Login.jsp">CONTACT-US</a></li>


                    </ul>
                </div>
            </div>
        </header>

    </body>
</html>
