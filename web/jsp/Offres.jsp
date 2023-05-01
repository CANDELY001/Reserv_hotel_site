<%-- 
    Document   : Offres
    Created on : Jun 13, 2022, 9:19:49 PM
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
    </head>
    <body>
        <jsp:include page="/jsp/Header2.jsp"></jsp:include> 
         <div class="container">
                <table class="table">
                    <thead >
                        <tr style="text-align: center">
                    <ul class="navbar-nav">
                          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Choose service
        </a>
                             
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <%
                        Connection con = MyUtile.seConnecter();
                        ResultSet rs = con.createStatement().executeQuery("select * from service");
                        while(rs.next()){
                              %>
            <a class="dropdown-item" href="/Dream_Hotel/jsp/Offres.jsp?idservice=<%=rs.getInt("idservice")%>"><%=rs.getString("libelle")%></a> 
         <%} rs.close();%>
       
        
        </div>
      </li>
                    </ul>
                        </tr>
                        <tr>
                            <th scope="col">Picture</th>
                            <th scope="col">Title</th>
                            <th scope="col">Details</th>
                            <th scope="col">Date start</th>
                            <th scope="col">Date finish</th>
                            <th scope="col">Code promo</th>
                         

                        </tr>
                    </thead>

                    <%
                        String req="select * from offre join service using(idservice) ";
                        if(request.getParameter("idservice")!=null){
                        req+="where idservice="+Integer.parseInt(request.getParameter("idservice"));
                        }
                        rs = con.createStatement().executeQuery(req);
                        while (rs.next()) {
                    %>
                    <tr>
                        <th ><img src="/Dream_Hotel/pics/<%=rs.getString("img")%>" alt="..." class="rounded" style="width: 200px; height: 200px"></th>
                        <td style="vertical-align: middle; font-size: large; font-weight: bold"><%=rs.getString("title")%></td>
                    
                        <td  style="vertical-align: middle"><%=rs.getString("detail")%></td>
                        <td  style="vertical-align: middle"><%=rs.getDate("datedebut")%></td>
                        <td  style="vertical-align: middle"><%=rs.getDate("datefin")%> </td>
                        <td  style="vertical-align: middle" >
                           <%=rs.getString("promo")%>
                           </td>
                           <td  style="vertical-align: middle" >
                               
                           <img data-toggle="modal" data-target="#deletemodal<%=rs.getInt("idoffre")%>" src="/Dream_Hotel/chambres/trash-bin.png" style="width: 30px;height: 30px">
                             
                           </td>
                    </tr>
                    <%} rs.close();%>

                </tbody>
            </table>

        </div>
                    <%rs = con.createStatement().executeQuery("select * from offre");
                        while (rs.next()) {
                    %>
 <div class="modal fade" id="deletemodal<%=rs.getInt("idoffre")%>" tabindex="-1"  role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure want to delete this offre forever?</p>
      </div>
      <div class="modal-footer">
          <a href="/Dream_Hotel/deleteoffre?id=<%=rs.getInt("idoffre")%>" type="button" class="btn btn-danger">Yes</a>
        <a  href="#" type="button" class="btn btn-success" data-dismiss="modal">No</a>
      </div>
    </div>
  </div>
</div>
  <%}%>
          <jsp:include page="/jsp/Footer.jsp"></jsp:include> 
    </body>
</html>
