<%-- 
    Document   : Addroom
    Created on : Jun 12, 2022, 9:56:31 PM
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
            <div class="container" style="width: 80%; margin: auto">
                <form action="/Dream_Hotel/addroom" method="post" enctype="multipart/form-data"  >
                
          
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Title</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="Title" name="title">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Prix</label>
      <input type="number" class="form-control" id="inputPassword4" placeholder="Prix" name="prix">
    </div>
  </div>
 
  <div class="form-group">
    <label for="inputAddress2">Description</label>
    <input type="textarea" class="form-control" id="inputAddress2" placeholder="Description" name="description">
  </div>
             
  <div class="form-row">
   
    <div class="form-group col-md-4">
      <label for="inputState">Type</label>
      <select id="inputState" class="form-control" name="typech">
        <option selected>Choose...</option>
        <%
                    Connection con=MyUtile.seConnecter();
                    ResultSet rs=con.createStatement().executeQuery("select * from typechambre");
                    while(rs.next()){
                    %>   <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                <%}
                rs.close();%>
      </select>
    </div> 
      <div class="form-group col-md-4">
      <label for="inputCity">Number of bed</label>
      <input type="number" class="form-control" id="inputCity" name="nbrlit">
    </div>
    <div class="form-group col-md-4">
     <label for="inputState">Type of bed</label>
     <select id="inputState" class="form-control" name="typelit">
        <option selected>Choose...</option>
    <%  rs=con.createStatement().executeQuery("select * from typelit");
                    while(rs.next()){
                    %>   <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                <%}
                rs.close();%>
      </select>  </div>
  </div>
   <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">Offres :</legend>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="breakfast" id="gridRadios1" value="1" >
          <label class="form-check-label" for="gridRadios1">
           Breakfast
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="parking" id="gridRadios2" value="1">
          <label class="form-check-label" for="gridRadios2">
            Parking
          </label>
        </div>
        
      </div>
    </div>
  </fieldset>
                 <div class="custom-file col-form-label">
            
                        <input type="file" name="img" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile">Choose an image...</label>
                        <div class="invalid-feedback">You should insert an image</div><br/><br>
                    </div>
  <button type="submit" class="btn btn-primary btn-block">Add room</button>
</form>
       </div>     
           <jsp:include page="/jsp/Footer.jsp"></jsp:include> 
    </body>
</html>
