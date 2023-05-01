<%-- 
    Document   : About
    Created on : Jun 7, 2022, 4:40:53 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="/Dream_Hotel/css/About.css">
    </head>
    <body>
       <div classs="wrap">
       <header >
            <div class="menu1">
              <div class="navi-item">
                <a class="aleft" href="/Dream_Hotel/Accueil.jsp"><img src="/Dream_Hotel/pics/arrow_back_white_48dp.svg" alt=""></a>
                
              </div>
             <div class="logo">
                <a href="#"><img src="/Dream_Hotel/pics/LogoMakr-3UNcX6.png"></a>
              </div>
             
               
               </header>
              
          <article>
            <figure>
              <img src='https://unsplash.it/450/800?image=948' alt />
            </figure>
            <section>
                <div>
                  <h1>DREAM HOTEL</h1>
                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                </div>
            </section>
            
            <figure>
              <img src='/Dream_Hotel/pics/reception.jpeg' alt />
            </figure>
            <section>
              <div>
                <h2>DREAM HOTEL</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
              </div>
            </section>
            
            <figure>
              <img src='/Dream_Hotel/pics/about3.jpeg' alt />
            </figure>
            <section>
              <div>
                <h2>DREAM HOTEL</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
              </div>
            </section>
            
            <figure>
              <img src='/Dream_Hotel/pics/1ba782014771240879164ce04f0e0b09.jpeg' alt />
            </figure>
            <section>
              <div>
                <h2>DREAM HOTEL</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
              </div>
            </section>
            
            <figure>
              <img src='/Dream_Hotel/pics/916f337876d51cc0b8ade420b9620709.jpeg' alt />
            </figure>
            <section>
              <div>
                <h2>DREAM HOTEL</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
              </div>
            </section>
            
            <figure>
              <img src='/Dream_Hotel/pics/about2.jpeg' alt />
            </figure>
            <section>
              <div>
                <h2>DREAM HOTEL</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
              </div>
            </section>
            
            <figure>
              <img src='/Dream_Hotel/pics/abb111ed27173a54ab71dbc7dde0ec10.jpeg' alt />
            </figure>
            <section>
              <div>
                <h2>DREAM HOTEL</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
              </div>
            </section>
           
          </article>
          </div>
          </body>
        </div>
        
 <script src="/Dream_Hotel/js/jquery-3.4.1.min.js"></script>
              <script src="/Dream_Hotel/js/jquery-3.4.1.slim.min.js"></script>
  <script type="text/javascript">


//scrolmenu
  var navbar = document.querySelector('header');
  
  window.onscroll = function() {
  
    // pageYOffset or scrollY
    if (window.scrollY> 0) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  }
  


var windowHeight = $(window).height();
var $slides = $('.slide');

function init() {
	$('body').css('height', ($slides.length * 100) + '%');
  
	$slides.each(function(index) {
    $(this).css({
      'z-index': index,
      'top': (index * 100) + '%'
    });
  });
  
	var $scrollingSlide = $('.slide--scrolling').last();
  var scrollingSlideIndex = $('.slide').index($scrollingSlide);
  $(window).scrollTop((scrollingSlideIndex - 1) * windowHeight);
}

function adjustPositions() {
	var scrollPosition = $(window).scrollTop();
	var scrollingSlide = Math.floor(scrollPosition / windowHeight) + 1;
  var $scrollingSlide = $('#slide-' + scrollingSlide);
  $scrollingSlide.prevAll('.slide').removeClass('slide--scrolling').addClass('slide--locked');
  $scrollingSlide.removeClass('slide--locked').addClass('slide--scrolling');
  $scrollingSlide.nextAll('.slide').removeClass('slide--locked').removeClass('slide--scrolling');
}

$(document).ready(function() {
	init();
});

$(window).scroll(function () {
  adjustPositions();
});
</script>    
    </body>
</html>
