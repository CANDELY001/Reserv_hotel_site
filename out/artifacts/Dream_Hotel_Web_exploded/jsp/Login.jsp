<%-- 
    Document   : Login
    Created on : Jun 5, 2022, 1:48:56 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                   <link rel="stylesheet" href="/Dream_Hotel/css/Login.css"/>

    </head>
    <body>
    <header >
        <div class="menu1">
          <div class="navi-item">
            <a class="aleft" href="/Dream_Hotel/Accueil.jsp"><img src="/Dream_Hotel/pics/arrow_back_white_48dp.svg" alt=""></a>
            
          </div>
          </div>
    </header>
    <!--<img src="/Users/candely/Desktop/dream hotel/pics/MM 2040-1.jpeg" class="bg">-->

<section class="forms-section">
    <!--<h1 class="section-title"></h1>--> 
         <a href="Home.html"><img src="/Dream_Hotel/pics/LogoMakr-3UNcX6.png"></a>
    <div class="forms">
      <div class="form-wrapper <%=(request.getAttribute("up")==null)?"is-active":""%>">
        <button type="button" class="switcher switcher-login">
            Connexion
          <span class="underline"></span>
        </button>
          <form class="form form-login" action="/Dream_Hotel/LoginServlet" method="post">
          <fieldset>
              
            <legend>Svp, enter votre email and mot de passe pour connecter.</legend>
           
            <div class="input-block">
              <label for="login-email">E-mail</label>
              <input id="login-email" type="email" name="email" required>
            </div>
            <div class="input-block">
              <label for="login-password">Mot de passe</label>
              <input id="login-password" type="password" name="mdp" required>
            </div>
            
              
              <input id="rememberme" name="rememberme" type="checkbox" >
              <label for="rememberme"  class="remembertxt">Remember-me</label>
           <%
                  if(request.getAttribute("msg")!=null){
                  %>
                  <p style="color: red; font-size: 16px; font-style: italic"><%=request.getAttribute("msg")%></p>
                  <%
                  }
              %>
          </fieldset>
          <button type="submit" class="btn-login">Connexion</button>
        </form>
      </div>
         
      <div class="form-wrapper <%=(request.getAttribute("up")!=null)?"is-active":""%>">
          <button type="button" class="switcher switcher-signup  " >
           Sign in
          <span class="underline"></span>
        </button>
          <form class="form form-signup" action="/Dream_Hotel/SigninServlet" method="POST">
          <fieldset>
            <legend>Svp, enter votre email, mot de passe et mot de passe confirmé pour S'inscrire.</legend>
            <div class="input-block">
              <label for="signup-name">Username</label>
              <input id="signup-name" type="text" name="user" required>
            </div>
            <div class="input-block">
              <label for="signup-email">E-mail</label>
              <input id="signup-email" type="email" name="mail" required>
            </div>
            <div class="input-block">
              <label for="signup-password">Mot de passe</label>
              <input id="signup-password" type="password" name="pss1" required>
            </div>
            <div class="input-block">
              <label for="signup-password-confirm">Confirme mot de passe</label>
              <input id="signup-password-confirm" type="password" name="pss2" required>
            </div>
              
           <%
                  if(request.getAttribute("up")!=null){
                  %>
                  <p style="color: red; font-size: 16px; font-style: italic"><%=request.getAttribute("up")%></p>
                  <%
                  }
              %>
          </fieldset>
          <button type="submit" class="btn-signup">Continue</button>
        </form>
      </div>
    </div>
  </section>

<script>
    const switchers = [...document.querySelectorAll('.switcher')];

switchers.forEach(item => {
	item.addEventListener('click', function() {
		switchers.forEach(item => item.parentElement.classList.remove('is-active'));
		this.parentElement.classList.add('is-active');
	});
});
 

</script>
    </body>
</html>
