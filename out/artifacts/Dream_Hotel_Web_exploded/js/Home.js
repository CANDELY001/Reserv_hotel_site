/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
//animation
window.addEventListener("scroll", reveal);
function reveal() {
  var reveals = document.querySelector(".reveal");

  var windowheight = window.innerHeight;
  var revealtop = reveals.getBoundingClientRect().top;
  var revealpoint = 150;
  if (window.pageYOffset > 900) {
    reveals.classList.add("active");
  } else {
    reveals.classList.remove("active");
  }
}
//slider image
const slider = document.querySelector(".slider");
const nextBtn = document.querySelector(".next-btn");
const prevBtn = document.querySelector(".prev-btn");
const slides = document.querySelectorAll(".slide");
//const slideIcons = document.querySelectorAll(".slide-icon");
const nbrOfslides = slides.length;
var slideNumber = 0;
nextBtn.addEventListener("click", () => {
  slides.forEach((slide) => {
    slide.classList.remove("active");
  });
  // slideIcons.forEach((slideIcon)=>{
  //   slideIcon.classList.remove("active");
  // });
  slideNumber++;
  if (slideNumber > nbrOfslides - 1) {
    slideNumber = 0;
  }
  slides[slideNumber].classList.add("active");
});
prevBtn.addEventListener("click", () => {
  slides.forEach((slide) => {
    slide.classList.remove("active");
  });
  // slideIcons.forEach((slideIcon)=>{
  //   slideIcon.classList.remove("active");
  // });
  slideNumber--;
  if (slideNumber < 0) {
    slideNumber = nbrOfslides - 1;
  }
  slides[slideNumber].classList.add("active");
  //slideIcons[slideNumber].classList.add("active");
});
//img auto
var playSlider;
var repeater = () => {
  playSlider = setInterval(function () {
    slides.forEach((slide) => {
      slide.classList.remove("active");
    });
    // slideIcons.forEach((slideIcon)=>{
    //   //slideIcon.classList.remove("active");
    // });
    slideNumber++;
    if (slideNumber > nbrOfslides - 1) {
      slideNumber = 0;
    }
    slides[slideNumber].classList.add("active");
    //slideIcons[slideNumber].classList.add("active");
  }, 9000);
};
repeater();
//stop auto
slider.addEventListener("mouseover", () => {
  clearInterval(playSlider);
});
//start auto
slider.addEventListener("mouseout", () => {
  repeater();
});

//slider sec6

const gap = 16;

const carousel = document.getElementById("carousel"),
  content = document.getElementById("content"),
  next = document.getElementById("next"),
  prev = document.getElementById("prev");

next.addEventListener("click", (e) => {
  carousel.scrollBy(width + gap, 0);
  if (carousel.scrollWidth !== 0) {
    prev.style.display = "flex";
  }
  if (content.scrollWidth - width - gap <= carousel.scrollLeft + width) {
    next.style.display = "none";
  }
});
prev.addEventListener("click", (e) => {
  carousel.scrollBy(-(width + gap), 0);
  if (carousel.scrollLeft - width - gap <= 0) {
    prev.style.display = "none";
  }
  if (!content.scrollWidth - width - gap <= carousel.scrollLeft + width) {
    next.style.display = "flex";
  }
});

let width = carousel.offsetWidth;
window.addEventListener("resize", (e) => (width = carousel.offsetWidth));

//teste
var index = 0;
const x = document.querySelectorAll(".element");

var change = () => {
  setInterval(function () {
    x.forEach((slide) => {
      slide.classList.remove("active");
    });
    index++;
    if (index > x.length) {
      index = 0;
    }
    x[index].classList.add("active");
    //slideIcons[slideNumber].classList.add("active");
  }, 3000);
};

window.addEventListener("scroll", change());

