class Ballon {
  constructor() {
    this.x = random(width);
    this.y = random(height);
    this.r = 25;
    this.vx = 0;
    this.vy = 0;

    this.col = color(random(255), random(255), random(255));
    this.popped = false;
  }

  blowAway() {
    if (!this.popped) {
      //calculate the blow away force
      let d = dist(this.x, this.y, mouseX, mouseY);
      let force = d < height / 2 ? -10 / (d * d) : 0;
      //apply the force to the existing velocity
      this.vx += force * (mouseX - this.x);
      this.vy += force * (mouseY - this.y);
    }
    //also add some friction to take energy out of the system
    this.vx *= 0.95;
    this.vy *= 0.95; //update the position
    this.x += this.vx;
    this.y += this.vy;
  }

  checkBounds() {
    //make balloon wrap to the other side of the canvas
    if (this.x < 0) this.x = width;
    if (this.x > width) this.x = 0;
    if (this.y < 0) this.y = height;
    if (this.y > height) this.y = 0;
  }

  checkToPop() {
    if (!this.popped && dist(this.x, this.y, mouseX, mouseY) < this.r) {
      this.popped = true;
      let currScore = +document.getElementById("score").innerHTML;
      currScore++;
      document.getElementById("score").innerHTML = currScore;
      this.col = color(156);
      popSfx.play();
    }
  }
}

let baloons = [];
const NUM_baloons = 10;
let popSfx;

const resetBtn = document.querySelector("#reset-btn");

resetBtn.addEventListener("click", function () {
  document.getElementById("score").innerHTML = 0;
  baloons = [];
  for (let i = 0; i < NUM_baloons; i++) {
    baloons[i] = new Ballon();
  }
});

function preload() {
  popSfx = loadSound("assets/pop.mp3");
}

function setup() {
  let canvas = createCanvas(640, 480);
  canvas.parent("gameContainer");
  for (let i = 0; i < NUM_baloons; i++) {
    baloons[i] = new Ballon();
  }
}

function draw() {
  background(135, 206, 235);

  for (let i = 0; i < baloons.length; i++) {
    fill(baloons[i].col);
    circle(baloons[i].x, baloons[i].y, baloons[i].r);
    baloons[i].blowAway();
    baloons[i].checkBounds();
    baloons[i].checkToPop();
    if (baloons[i].popped) baloons.splice(i, 1);
  }
}
