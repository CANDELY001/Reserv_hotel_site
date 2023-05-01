<%-- 
    Document   : Rooms
    Created on : Jun 12, 2022, 10:17:59 PM
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
        <link rel="stylesheet" src="/Dream_Hotel/css/Rooms.jsp"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    </head>
    <body>
        <jsp:include page="/jsp/Header2.jsp"></jsp:include>
            <div class="container">
                <table class="table">
                    <thead >
                        <tr>
                            <th scope="col">Picture</th>
                            <th scope="col">Title</th>
                            <th scope="col">Description</th>
                            <th scope="col">nbrlit</th>
                            <th scope="col">Type</th>
                            <th scope="col">prix</th>
                            <th scope="col"></th>

                        </tr>
                    </thead>

                    <tbody> <%
                        Connection con = MyUtile.seConnecter();
                        ResultSet rs = con.createStatement().executeQuery("select * from chambre");
                        while (rs.next()) {
                    %>
                    <tr>
                        <th ><img src="/Dream_Hotel/chambres/<%=rs.getString("img")%>" alt="..." class="rounded" style="width: 200px; height: 200px"></th>
                        <td style="vertical-align: middle; font-size: large; font-weight: bold"><%=rs.getString("title")%></td>
                        <td  style="vertical-align: middle; "><%=rs.getString("description")%></td>
                        <td  style="vertical-align: middle"><%=rs.getString("nbrlit")%></td>
                        <td  style="vertical-align: middle"><%=rs.getString("type")%></td>
                        <td  style="vertical-align: middle"><%=rs.getString("prix")%> DH</td>
                        <td  style="vertical-align: middle" >
                               
                           <img data-toggle="modal" data-target="#deletemodal<%=rs.getInt("idch")%>" src="/Dream_Hotel/chambres/trash-bin.png" style="width: 30px;height: 30px">
                             
                           </td>
                    </tr>
                    <%} rs.close();%>

                </tbody>
            </table>

        </div>
                    <%rs = con.createStatement().executeQuery("select * from chambre");
                        while (rs.next()) {
                    %>
 <div class="modal fade" id="deletemodal<%=rs.getInt("idch")%>" tabindex="-1"  role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure want to delete this room forever?</p>
      </div>
      <div class="modal-footer">
          <a href="/Dream_Hotel/Deleteroom?id=<%=rs.getInt("idch")%>" type="button" class="btn btn-danger">Yes</a>
        <a  href="#" type="button" class="btn btn-success" data-dismiss="modal">No</a>
      </div>
    </div>
  </div>
</div>
  <%}%>
          <jsp:include page="/jsp/Footer.jsp"></jsp:include>  
    </body>
</html>
