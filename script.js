import Projects from "./projects.js";

// Elements
const nav = document.querySelector(".nav-bar");
const navLink = document.querySelector(".nav__links");
const btnScrollTo = document.querySelector(".btn-scroll");
const section1 = document.querySelector("#section--1");
const overlay = document.querySelector(".overlay");
const projects = document.querySelector(".project-slider");
const sliders = document.querySelectorAll(".slider");
const closeBtn = document.querySelector(".close-btn");
const navBtn = document.querySelector(".mobile-nav-toggle");

// menu fade animation

const handleHover = function (e) {
  if (e.target.classList.contains("links")) {
    const link = e.target;
    const siblings = link.closest(".nav-bar").querySelectorAll(".links");

    siblings.forEach((el) => {
      if (el !== link) el.style.opacity = this;
    });
  }
};

navLink.addEventListener("mouseover", handleHover.bind(0.5));
navLink.addEventListener("mouseout", handleHover.bind(1));

// close menu on link click

navLink.addEventListener("click", function () {
  const visibility = navLink.getAttribute("data-visible");

  if (visibility === "true") {
    navLink.setAttribute("data-visible", false);
    navBtn.setAttribute("aria-expanded", false);
    navBtn.style.position = "absolute";
  }
});

// Menu scroll

document.querySelector(".nav__links").addEventListener("click", function (e) {
  e.preventDefault();
  // matching strategy
  if (e.target.classList.contains("links")) {
    const id = e.target.getAttribute("href");
    document.querySelector(id).scrollIntoView({ behavior: "smooth" });
  }
});

// nav menu button
navBtn.addEventListener("click", () => {
  const visibility = navLink.getAttribute("data-visible");

  if (visibility === "false") {
    navLink.setAttribute("data-visible", true);
    navBtn.setAttribute("aria-expanded", true);
    navBtn.style.position = "fixed";
  } else {
    navLink.setAttribute("data-visible", false);
    navBtn.setAttribute("aria-expanded", false);
    navBtn.style.position = "absolute";
  }
});

// scroll button

btnScrollTo.addEventListener("click", function (e) {
  e.preventDefault();
  section1.scrollIntoView({ behavior: "smooth" });
});

// Sticky nav

const header = document.querySelector(".container");
const navHeight = nav.getBoundingClientRect().height;
const headerHeight = header.getBoundingClientRect().height;
const checkpoint = headerHeight - navHeight;

window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.documentElement.scrollTop > headerHeight) {
    nav.classList.add("sticky");
    nav.style.top = "0";
  } else {
    nav.style.top = "-50px";
  }

  if (document.documentElement.scrollTop < checkpoint) {
    nav.classList.remove("sticky");
  }
}

// reveal sections
const allSections = document.querySelectorAll(".section");

const revealSection = function (entries, observer) {
  const [entry] = entries;
  if (!entry.isIntersecting) return;

  entry.target.classList.remove("section--hidden");
  observer.unobserve(entry.target);
};

const sectionObserver = new IntersectionObserver(revealSection, {
  root: null,
  threshold: 0.15,
});
allSections.forEach(function (section) {
  sectionObserver.observe(section);
  section.classList.add("section--hidden");
});

let currentSlide = 0;
const maxSlide = sliders.length - 1;

// slider

// const btnLeft = document.querySelector(".slider__btn--left");
// const btnRight = document.querySelector(".slider__btn--right");

const goToSlide = function (slide, animated = true) {
  sliders.forEach((s, i) => {
    animated
      ? (s.style.transition = "transform 1s")
      : (s.style.transition = "none");
    s.style.transform = `translateX(${130 * (i - slide)}%)`;
  });
  overlay.scrollTop = 0;
};

// initialise slider
(function () {
  goToSlide(0);
})();

const nextSlide = function () {
  if (currentSlide === maxSlide) currentSlide = 0;
  else currentSlide++;
  goToSlide(currentSlide);
};

const prevSlide = function () {
  if (currentSlide === 0) currentSlide = maxSlide;
  else currentSlide--;
  goToSlide(currentSlide);
};

// btnRight.addEventListener("click", nextSlide);
// btnLeft.addEventListener("click", prevSlide);

// slide with arrow keys
document.addEventListener("keydown", function (e) {
  if (e.key === "ArrowLeft") prevSlide();
  if (e.key === "ArrowRight") nextSlide();
});

// Content modal

const openModal = function (e) {
  const cardBtn = e.target.closest(".card-info");
  const card = e.target.closest(".card");

  if (!cardBtn) return;
  currentSlide = card.dataset.proj - 1;

  sliders.forEach((s) => s.classList.add("slider--modal"));

  // btnLeft.classList.add("left__btn--modal");
  // btnRight.classList.add("right__btn--modal");

  overlay.classList.remove("hidden");
  goToSlide(currentSlide, false);
  document.body.classList.add("no-scroll");
};

const closeModal = function (e) {
  const s = e.target.closest(".slider");
  const btn = e.target.closest(".close-btn");

  if (s && !btn) return;

  sliders.forEach((s) => s.classList.remove("slider--modal"));

  // btnLeft.classList.remove("left__btn--modal");
  // btnRight.classList.remove("right__btn--modal");

  overlay.classList.add("hidden");
  document.body.classList.remove("no-scroll");
};

projects.addEventListener("click", openModal);
//overlay.addEventListener("click", closeModal);
closeBtn.addEventListener("click", closeModal);

let project = new Projects();

const checkWindowSize = function () {
  if (window.innerWidth <= 720) {
    if (project.size() !== 1) project = new Projects(1);
  } else if (window.innerWidth <= 1015) {
    if (project.size() !== 2) project = new Projects(2);
  } else if (window.innerWidth <= 1325 && project.size() !== 3) {
    project = new Projects(3);
  } else if (window.innerWidth > 1325 && project.size() !== 4) {
    project = new Projects(4);
  }
};

window.addEventListener("resize", checkWindowSize);
window.addEventListener("load", checkWindowSize);

// mobile swipe

let touchstartX = 0;
let touchendX = 0;

function checkDirection() {
  if (touchendX < touchstartX) project.prevProject();
  if (touchendX > touchstartX) project.nextProject();
}

projects.addEventListener("touchstart", (e) => {
  touchstartX = e.changedTouches[0].screenX;
});

projects.addEventListener("touchend", (e) => {
  touchendX = e.changedTouches[0].screenX;
  checkDirection();
});
