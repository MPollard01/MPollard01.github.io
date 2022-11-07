class Projects {
  #projects;
  #leftProject = document.querySelector(".project-slider__btn--left");
  #rightProject = document.querySelector(".project-slider__btn--right");
  #dotContainer = document.querySelector(".dots");
  #cards = document.querySelectorAll(".card");

  #currentProject;
  #maxProject;

  constructor(numProjects) {
    this.numProjects = numProjects;
    this.#generateMarkup();
    this.#projects = document.querySelectorAll(".projects");
    this.#currentProject = 0;
    this.#maxProject = this.#projects.length - 1;
    this.#createDots();
    this.#activateDot(0);
    this.goToProjects(0);
    this.#addHandleDots();
    this.#addHandleSlideButtons();
  }

  #addHandleDots() {
    this.#dotContainer.addEventListener("click", (e) => {
      if (e.target.classList.contains("dots__dot")) {
        const { slide } = e.target.dataset;
        this.goToProjects(slide);
        this.#activateDot(slide);
      }
    });
  }

  #addHandleSlideButtons() {
    this.#leftProject.addEventListener("click", this.prevProject.bind(this));
    this.#rightProject.addEventListener("click", this.nextProject.bind(this));
  }

  #createDots() {
    this.#dotContainer.innerHTML = "";
    this.#projects.forEach((_, i) => {
      this.#dotContainer.insertAdjacentHTML(
        "beforeend",
        `<button class="dots__dot" data-slide="${i}"></button>`
      );
    });
  }

  #activateDot(slide) {
    document
      .querySelectorAll(".dots__dot")
      .forEach((dot) => dot.classList.remove("dots__dot--active"));

    document
      .querySelector(`.dots__dot[data-slide="${slide}"]`)
      .classList.add("dots__dot--active");
  }

  goToProjects(slide) {
    this.#projects.forEach(
      (s, i) => (s.style.transform = `translateX(${350 * (i - slide)}%)`)
    );
  }

  nextProject() {
    if (this.#currentProject === this.#maxProject) this.#currentProject = 0;
    else this.#currentProject++;
    this.#activateDot(this.#currentProject);
    this.goToProjects(this.#currentProject);
  }

  prevProject() {
    if (this.#currentProject === 0) this.#currentProject = this.#maxProject;
    else this.#currentProject--;
    this.goToProjects(this.#currentProject);
    this.#activateDot(this.#currentProject);
  }

  getProject(numProject) {
    return this.#projects[numProject];
  }

  size() {
    return this.numProjects;
  }

  #generateMarkup() {
    if (!this.numProjects) return;

    document.querySelectorAll(".projects").forEach((p) => p.remove());

    this.#getMarkup(this.numProjects);
  }

  #getMarkup(num) {
    const slider = document.querySelector(".project-slider");
    let proj = document.createElement("div");
    proj.className = "projects";
    slider.appendChild(proj);

    this.#cards.forEach((c, i) => {
      proj.appendChild(c);
      if ((i + 1) % num === 0 && i + 1 !== this.#cards.length) {
        proj = document.createElement("div");
        proj.className = "projects";
        slider.appendChild(proj);
      }
    });
  }
}

export default Projects;
