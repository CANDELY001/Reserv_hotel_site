<%-- 
    Document   : Addoffre
    Created on : Jun 13, 2022, 9:19:38 PM
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
                <form action="/Dream_Hotel/addoffre" method="post" enctype="multipart/form-data"  >
                
          
 
    <div class="form-group">
      <label >Title</label>
      <input type="text" class="form-control"  placeholder="Title" name="title">
    </div>
   
 
  <div class="form-group">
    <label >Detail</label>
    <input type="textarea" class="form-control"  placeholder="Detail" name="detail">
  </div>
             
  <div class="form-row">
   
    <div class="form-group col-md-6">
      <label for="inputState">Service</label>
      <select  class="form-control" name="idservice">
        <option selected>Choose...</option>
        <%
                    Connection con=MyUtile.seConnecter();
                    ResultSet rs=con.createStatement().executeQuery("select * from service");
                    while(rs.next()){
                    %>   <option value="<%=rs.getInt("idservice")%>"><%=rs.getString(2)%></option>
                <%}
                rs.close();%>
      </select>
    </div> 
      <div class="form-group col-md-6">
      <label for="inputCity">Promo</label>
      <input type="number" class="form-control" id="inputCity" name="promo">
    </div>
    
  </div>
 
    

                 <div class="custom-file col-form-label">
            
                        <input type="file" name="img" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile">Choose an image...</label>
                        <div class="invalid-feedback">You should insert an image</div><br/><br>
                    </div>
  <button type="submit" class="btn btn-primary btn-block">Add Offre</button>
</form>
       </div>     
           <jsp:include page="/jsp/Footer.jsp"></jsp:include> 
    </body>
</html>
