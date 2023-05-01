<%-- 
    Document   : checkout
    Created on : Jun 15, 2022, 4:29:06 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
          <link
      rel="stylesheet"
      href="/Dream_Hotel/css/checkout.css"
    />
    </head>
    <body>
         <%if(session.getAttribute("v")==null){
             request.setAttribute("msg", "This page required the authentification");
             request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
             }%>
        <header >
        <div class="menu1">
          <div class="navi-item">
            <a class="aleft" href="/Dream_Hotel/jsp/ChambreandTarif.jsp"><img src="/Dream_Hotel/pics/arrow_back_white_48dp.svg" alt=""></a>
            
          </div>
          </div>
    </header>
                 <div class='con1'>
         <div class="row">
      <div class="col-75">
        <div class="container">
            <form action="/Dream_Hotel/checkout?idch=<%=request.getParameter("idch")%>&montant=<%=request.getParameter("motant")%>" method="post">
          
                <div class="row">
              <div class="col-50">
                <h3>Your infos</h3>
                    <div class="row">
                    <div class="col-50" style="display: inline; width: 50%">
                 <label for="fname"><i class="fa fa-clock-o"></i> Date start</label>
                <input
                  type="date"
                  id="fname"
                  name="dated"
                  required=""
                  /></div>
                     <div class="col-50"style="display: inline;width: 50%">
                <label for="email"><i class="fa fa-clock-o"></i> Date finish</label>
                <input
                  type="date"
                  id="email"
                  name="datef"
                  required=""
                /></div>
                </div>
                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                <input
                  type="text"
                  id="fname"
                  name="fullname"
                  placeholder="John M. Doe"
                />
                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                <input
                  type="text"
                  id="email"
                  name="email"
                  placeholder="john@example.com"
                />
                  <label for="tel"><i class="fa fa-envelope"></i> Telephone</label>
                <input
                  type="text"
                  id="tel"
                  name="Tel"
                  placeholder="0600000000"
                />
                <label for="adr"
                  ><i class="fa fa-address-card-o"></i> Address</label
                >
                <input
                  type="text"
                  id="adr"
                  name="addresse"
                  placeholder="542 W. 15th Street"
                />
                <label for="city"><i class="fa fa-institution"></i> City</label>
                <input
                  type="text"
                  id="city"
                  name="ville"
                  placeholder="New York"
                />

                <div class="row">
                  <div class="col-50">
                    <label for="state">State</label>
                    <input
                      type="text"
                      id="state"
                      name="state"
                      placeholder="NY"
                    />
                  </div>
                  <div class="col-50">
                    <label for="zip">Zip</label>
                    <input
                      type="text"
                      id="zip"
                      name="zip"
                      placeholder="10001"
                    />
                  </div>
                    
                </div>
              </div>

              <div class="col-50">
                <h3>Payment</h3>
                <input
                  type="radio"
                  value="1"
                  name="pay"
                  id="card"
                  checked
                  onclick="verif()"
                />
                <label id="radio" for="fname">Accepted Cards :</label>

                <div class="icon-container">
                  <i class="fa fa-cc-visa" style="color: navy"></i>
                  <i class="fa fa-cc-amex" style="color: blue"></i>
                  <i class="fa fa-cc-mastercard" style="color: red"></i>
                  <i class="fa fa-cc-discover" style="color: orange"></i>
                </div>
                <input
                  type="radio"
                  value="2"
                  name="pay"
                  id="paypal"
                  onclick="verif()"
                />
                Paypal :
                <div class="icon-container">
                  <i class="fa fa-cc-paypal" style="color: navy"></i>
                </div>
                <div id="divcard">
                  <label for="cname">Name on Card</label>
                  <input
                    type="text"
                    id="cname"
                    name="cardname"
                    placeholder="John More Doe"
                    required="" />
                  <label for="ccnum">Credit card number</label>
                  <input
                    type="text"
                    id="ccnum"
                    name="cardnumber"
                    placeholder="1111-2222-3333-4444"
                required=""  />
                  <label for="expmonth">Exp Month</label>
                  <input
                    type="text"
                    id="expmonth"
                    name="expmonth"
                    placeholder="September"
                 required="" />
                  <div class="row">
                    <div class="col-50">
                      <label for="expyear">Exp Year</label>
                      <input
                        type="text"
                        id="expyear"
                        name="expyear"
                        placeholder="2018"
                     required="" />
                    </div>
                    <div class="col-50">
                      <label for="cvv">CVV</label>
                      <input
                        type="text"
                        id="cvv"
                        name="cvv"
                        placeholder="352"
                     required="" />
                    </div>
                  </div>
                </div>
                <div id="divpaypal">
                    <div class="paypalall"><label for="cname">Email</label>
                  <input
                    type="text"
                    name="emailpaypal"
                    placeholder="Email"
              />
                  <label for="ccnum">Mot de passe</label>
                  <input
                    type="text"
                    name="mdppaypal"
                    placeholder="Votre mot de passe"
               /></div>
                </div>
              </div>
            </div>
           
            <input type="submit" value="Continue to checkout" class="btn" />
          </form>
        </div>
      </div>
      <div class="col-25"></div>
    </div> </div>
        <jsp:include page="/jsp/Footer.jsp"></jsp:include>
  
    <script>
      function verif() {
        var paypal = document.getElementById("paypal");
        var card = document.getElementById("card");
        var div1 = document.getElementById("divcard");
        var div2 = document.getElementById("divpaypal");
       
        if (paypal.checked) {
          div1.style.display = "none";
          div2.style.display = "block";
        
        } else if (card.checked) {
          div1.style.display = "block";
          div2.style.display = "none";
        }
      }
    </script>
      
    </body>
</html>
