/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
      // Get the modal
    var modal = document.getElementById('id01');
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
    var gallery = document.querySelector('.gallery');
    var galleryItems = document.querySelectorAll('.gallery-item');
    var numOfItems = gallery.children.length;
    var itemWidth = 23; // percent: as set in css
    
    var featured = document.querySelector('.featured-item');
    
    var leftBtn = document.querySelector('.move-btn.left');
    var rightBtn = document.querySelector('.move-btn.right');
    var leftInterval;
    var rightInterval;
    
    var scrollRate = 0.2;
    var left;
    
    function selectItem(e) {
        if (e.target.classList.contains('active')) return;
        
        featured.style.backgroundImage = e.target.style.backgroundImage;
        
        for (var i = 0; i < galleryItems.length; i++) {
            if (galleryItems[i].classList.contains('active'))
                galleryItems[i].classList.remove('active');
        }
        
        e.target.classList.add('active');
    }
    
    function galleryWrapLeft() {
        var first = gallery.children[0];
        gallery.removeChild(first);
        gallery.style.left = -itemWidth + '%';
        gallery.appendChild(first);
        gallery.style.left = '0%';
    }
    
    function galleryWrapRight() {
        var last = gallery.children[gallery.children.length - 1];
        gallery.removeChild(last);
        gallery.insertBefore(last, gallery.children[0]);
        gallery.style.left = '-23%';
    }
    
    function moveLeft() {
        left = left || 0;
    
        leftInterval = setInterval(function() {
            gallery.style.left = left + '%';
    
            if (left > -itemWidth) {
                left -= scrollRate;
            } else {
                left = 0;
                galleryWrapLeft();
            }
        }, 1);
    }
    
    function moveRight() {
        //Make sure there is element to the leftd
        if (left > -itemWidth && left < 0) {
            left = left  - itemWidth;
            
            var last = gallery.children[gallery.children.length - 1];
            gallery.removeChild(last);
            gallery.style.left = left + '%';
            gallery.insertBefore(last, gallery.children[0]);	
        }
        
        left = left || 0;
    
        leftInterval = setInterval(function() {
            gallery.style.left = left + '%';
    
            if (left < 0) {
                left += scrollRate;
            } else {
                left = -itemWidth;
                galleryWrapRight();
            }
        }, 1);
    }
    
    function stopMovement() {
        clearInterval(leftInterval);
        clearInterval(rightInterval);
    }
    
    leftBtn.addEventListener('mouseenter', moveLeft);
    leftBtn.addEventListener('mouseleave', stopMovement);
    rightBtn.addEventListener('mouseenter', moveRight);
    rightBtn.addEventListener('mouseleave', stopMovement);
    
    
    //Start this baby up
    (function init() {
        var images = document.querySelectorAll(".gallery-item");
        
        //Set Initial Featured Image
        featured.style.backgroundImage =  images[0].style.backgroundImage;
        
        //Set Images for Gallery and Add Event Listeners
        for (var i = 0; i < galleryItems.length; i++) {
            galleryItems[i].style.backgroundImage = images[i].style.backgroundImage;
            galleryItems[i].addEventListener('click', selectItem);
        }
    })();
    //sticky menu
var bar = document.querySelector(".booking_info");
window.onscroll = function () {
  // pageYOffset or scrollY
  if (window.scrollY > 600) {
    bar.classList.add("sticky");
  } else {
    bar.classList.remove("sticky");
  }
};








