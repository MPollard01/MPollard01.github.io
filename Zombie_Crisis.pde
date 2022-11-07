/* @pjs preload="data/my_background.png, data/level2.png, data/level2.png, data/level3.png, data/level4.png, data/crosshair.png,
data/skeleton-idle_0.png, data/skeleton-idle_1.png, data/skeleton-idle_2.png, data/skeleton-idle_3.png, data/skeleton-idle_4.png,
data/skeleton-idle_5.png, data/skeleton-idle_6.png, data/skeleton-idle_7.png, data/skeleton-idle_8.png, data/skeleton-idle_9.png,
data/skeleton-idle_10.png, data/skeleton-idle_11.png, data/skeleton-idle_12.png, data/skeleton-idle_13.png, data/skeleton-idle_14.png,
data/skeleton-idle_15.png, data/skeleton-idle_16.png, data/skeleton-move_0.png, data/skeleton-move_1.png, data/skeleton-move_2.png, 
data/skeleton-move_3.png, data/skeleton-move_4.png, data/skeleton-move_5.png, data/skeleton-move_6.png, data/skeleton-move_7.png, 
data/skeleton-move_8.png, data/skeleton-move_9.png, data/skeleton-move_10.png, data/skeleton-move_11.png, data/skeleton-move_12.png,
data/skeleton-move_13.png, data/skeleton-move_14.png, data/skeleton-move_15.png, data/skeleton-move_16.png,
data/survivor-idle_rifle_0.png, data/survivor-idle_rifle_1.png, data/survivor-idle_rifle_2.png, data/survivor-idle_rifle_3.png,
data/survivor-idle_rifle_4.png, data/survivor-idle_rifle_5.png, data/survivor-idle_rifle_6.png, data/survivor-idle_rifle_7.png, data/survivor-idle_rifle_8.png, data/survivor-idle_rifle_9.png,
data/survivor-idle_rifle_10.png, data/survivor-idle_rifle_11.png, data/survivor-idle_rifle_12.png, data/survivor-idle_rifle_13.png, data/survivor-idle_rifle_14.png,
data/survivor-idle_rifle_15.png, data/survivor-idle_rifle_16.png, data/survivor-idle_rifle_17.png, data/survivor-idle_rifle_18.png, data/survivor-idle_rifle_19.png, data/survivor-idle_0.png,
data/survivor-move_rifle_0.png, data/survivor-move_rifle_1.png, data/survivor-move_rifle_2.png, data/survivor-move_rifle_3.png,
data/survivor-move_rifle_4.png, data/survivor-move_rifle_5.png, data/survivor-move_rifle_6.png, data/survivor-move_rifle_7.png,
data/survivor-move_rifle_8.png, data/survivor-move_rifle_9.png, data/survivor-move_rifle_10.png, data/survivor-move_rifle_11.png,
data/survivor-move_rifle_12.png, data/survivor-move_rifle_13.png, data/survivor-move_rifle_14.png, data/survivor-move_rifle_15.png,
data/survivor-move_rifle_16.png, data/survivor-move_rifle_17.png, data/survivor-move_rifle_18.png, data/survivor-move_rifle_19.png,
data/survivor-run_0.png, data/survivor-run_1.png, data/survivor-run_2.png, data/survivor-run_3.png, data/survivor-run_4.png,
data/survivor-run_5.png, data/survivor-run_6.png, data/survivor-run_7.png, data/survivor-run_8.png, data/survivor-run_9.png,
data/survivor-run_10.png, data/survivor-run_11.png, data/survivor-run_12.png, data/survivor-run_13.png, data/survivor-run_14.png,
data/survivor-run_15.png, data/survivor-run_16.png, data/survivor-run_17.png, data/survivor-run_18.png, data/survivor-run_19.png,
data/survivor-shoot_rifle_0.png, data/survivor-shoot_rifle_1.png, data/survivor-shoot_rifle_2.png, data/survivor-strafe_left_0.png,
data/survivor-strafe_left_1.png, data/survivor-strafe_left_2.png, data/survivor-strafe_left_3.png, data/survivor-strafe_left_4.png,
data/survivor-strafe_left_5.png,data/survivor-strafe_left_6.png,data/survivor-strafe_left_7.png, data/survivor-strafe_left_8.png,
data/survivor-strafe_left_9.png, data/survivor-strafe_left_10.png, data/survivor-strafe_left_11.png, data/survivor-strafe_left_12.png,
data/survivor-strafe_left_13.png, data/survivor-strafe_left_14.png, data/survivor-strafe_left_15.png, data/survivor-strafe_left_16.png,
data/survivor-strafe_left_17.png, data/survivor-strafe_left_18.png, data/survivor-strafe_left_19.png, data/survivor-strafe_right_0.png,
data/survivor-strafe_right_1.png, data/survivor-strafe_right_2.png, data/survivor-strafe_right_3.png, data/survivor-strafe_right_4.png,
data/survivor-strafe_right_5.png, data/survivor-strafe_right_6.png, data/survivor-strafe_right_7.png, data/survivor-strafe_right_8.png,
data/survivor-strafe_right_9.png, data/survivor-strafe_right_10.png, data/survivor-strafe_right_11.png, data/survivor-strafe_right_12.png,
data/survivor-strafe_right_13.png, data/survivor-strafe_right_14.png, data/survivor-strafe_right_15.png, data/survivor-strafe_right_16.png,
data/survivor-strafe_right_17.png, data/survivor-strafe_right_18.png, data/survivor-strafe_right_19.png,
data/bloodsplats_0.png, data/bloodsplats_1.png, data/bloodsplats_2.png, data/spit.png"; */

final int MENU=0;
final int PLAYING=1;
final int GAMEOVER=2;
final int STAGE1=3;
final int STAGE2=4;
final int STAGE3=5;
final int BOSS=6;
final int END =7;

int gameMode = MENU;
int zomCount = 0;
int score = 0;
float timeInterval = 2000;
float timeCheck;
float spitTimeInterval = 1000;
float spitTimeCheck;
float down =0;
float up =0;
float left =0;
float right =0;
boolean shoot = false;
boolean move = false;
boolean isIdle = true;
boolean strafeLeft = false;
boolean strafeRight = false;
boolean endLevel = false;
boolean nextArea = false;
boolean endLevel2 = false;
PImage level1,level2,level3,level4;
PImage crosshair;

PImage[] idleZombie = new PImage[20];
PImage[] moveZombie = new PImage[20];
//PImage[] attack = new PImage[9];
ArrayList <Projectile> bullets;
ArrayList <Zombie> zombies;
ArrayList <Blood> blood;
ArrayList <Spit> spits;

Sprite p1;
BossZombie bZ;


void setup(){
  size(1000,650);
  if (gameMode == MENU)
  {
    cursor();
    menu();
  
  }
  
 
  
  level1 = requestImage("data/my_background.png");
  level1.resize(width,height);
  level2 = requestImage("data/level2.png");
  level2.resize(width,height);
  level3 = requestImage("data/level3.png");
  level3.resize(width,height);
  level4 = requestImage("data/level4.png");
  level4.resize(width,height);
  crosshair = requestImage("data/crosshair.png");
  crosshair.resize(20,20);
  loadZombies();
  stage1();
  
  
}
void stage1()
{
  score =0;
  
  endLevel = false;
  nextArea = false;
  p1 = new Player(90,100);
  zombies = new ArrayList();
  blood = new ArrayList();
  zombies.add(new Zombie(800,300));
  zombies.add(new Zombie(800,200));
  zombies.add(new Zombie(840,200));
  zombies.add(new Zombie(800,250));
  zombies.add(new Zombie(840,250));
  zombies.add(new Zombie(910,560));
  zombies.add(new Zombie(377,577));
  bullets = new ArrayList();

}
void stage2()
{
  p1 = new Player(190,200);
  blood.clear();
  zombies.add(new Zombie(863,530));
  zombies.add(new Zombie(820,560));
  zombies.add(new Zombie(920,180));
  zombies.add(new Zombie(920,210));
  zombies.add(new Zombie(920,250));
  zombies.add(new Zombie(920,300));
  zombies.add(new Zombie(860,180));
  zombies.add(new Zombie(860,210));
  zombies.add(new Zombie(860,250));
  zombies.add(new Zombie(860,300));
  zombies.add(new Zombie(710,430));
  zombies.add(new Zombie(670,450));
  zombies.add(new Zombie(680,490));
  zombies.add(new Zombie(600,560));
  zombies.add(new Zombie(620,500));
  
}
void stage3()
{
  p1 = new Player(510,320);
  blood.clear();
  
}
void boss()
{
  loadZombies();
  spits = new ArrayList();
  p1 = new Player(510,320);
  bZ = new BossZombie(900,530);
  blood.clear();
}
void draw(){
  switch (gameMode){
    case PLAYING:
      image(level1,width/2,height/2);
      noCursor();
      handleBlood();
      p1.render();
      p1.update();
      p1.bounds1();
      p1.hitCheck();
      textSize(14);
      fill(200,0,0);
      text("Life: " +p1.life,60,40);
      handleZombies();
      zombieSpacing();
      handleBullets();
      image(crosshair,mouseX,mouseY);
      endOfLevel();
      break;
    case STAGE2:
      image(level2,width/2,height/2);
      handleBlood();
      p1.render();
      p1.update();
      p1.hitCheck();
      p1.bounds2();
      handleZombies();
      zombieSpacing();
      textSize(14);
      fill(200,0,0);
      text("Life: " +p1.life,60,40);
      handleBullets();
      image(crosshair,mouseX,mouseY);
      break;
    case STAGE3:
      image(level3,width/2,height/2);
      handleBlood();
      p1.render();
      p1.update();
      p1.hitCheck();
      p1.bounds3();
      handleZombies();
      zombieSpacing();
      textSize(14);
      fill(200,0,0);
      text("Life: " +p1.life,60,40);
      handleBullets();
      image(crosshair,mouseX,mouseY);
      break;
    case BOSS:
      image(level4,width/2,height/2);
      handleBlood();
      p1.render();
      p1.update();
      p1.hitCheck();
      p1.spitCheck();
      p1.bounds4();
      bZ.update();
      bZ.bounds4();
      handleSpit();
      textSize(14);
      fill(200,0,0);
      text("Life: " +p1.life,60,40);
      handleBullets();
      image(crosshair,mouseX,mouseY);
      if (bZ.life<=0)
      {
        
        gameMode = END;
        
        background(0);
        textSize(20);
        fill(220,0,0);
        text("You killed all the zombies\nand defeated the zombie King\nCongratulations\n Your score is: " + score + "\n\nRight click to return to menu",350,250);
       
      }
      break;
  }
   
if (p1.life <=0)
  {
    cursor();
    gameMode = GAMEOVER;
    background(0);
    textSize(50);
    fill(220,0,0);
    text("GAME OVER",350,250);
    textSize(32);
    text("Contiue",420,325);
    textSize(26);
    text("Yes",450,375);
    text("No",455,450);
   // hit.stop();
  }
  
  textSize(14);
      fill(0);
      text("Score: " +score,500,40);
}
void loadZombies ()
{
  for (int i = 0; i < 17; i++){
      idleZombie[i] = requestImage("data/skeleton-idle_"+i+".png");
      idleZombie[i].resize(50,50);
      moveZombie[i] = requestImage("data/skeleton-move_"+i+".png");
      moveZombie[i].resize(60,60);
    }
    
}
void menu()
{
  background(0);
  textSize(60);
  fill(0,200,0);
  text("Zombie Crisis",300,100);
  textSize(32);
  fill(0,100,0);
  text("Start Game",400,300);
  textSize(20);
  text("Controls: W = forward   S = back\n               Move the mouse aimer to rotate the player\n               Click start game to begin",100,500);
}
void keyPressed(){
  move = true;
  if (key == 'w')
    {
      isIdle = false;
        up = 1;
    }
    if (key == 's')
    {
      isIdle = false;
      down = 0.5;
    }
    if (key == 'a')
    {
      strafeLeft = true;
      
      left = 0.7;
    }
    if (key == 'd')
    {
      strafeRight = true;
      
      right = 0.7;
    }
}
void keyReleased(){
  if (key == 'w')
    {
      isIdle = true;
      up = 0;
    }
    if (key == 'a')
    {
      isIdle = true;
      strafeLeft = false;
      left = 0;
    }
    if (key == 's') 
    {
      isIdle = true;
      down = 0;
    }
    if (key == 'd')
    {
      isIdle = true;
      strafeRight = false;
      right = 0;
    } 
}
void mousePressed(){
  if(gameMode == PLAYING || gameMode == STAGE2 || gameMode == STAGE3 || gameMode == BOSS){
  if (mouseButton == LEFT){
    shoot = true;
    Projectile temp = new Bullet(p1.x,p1.y,p1.directionX,p1.directionY,p1.rotation);
    bullets.add(temp);
    //gun.play();
  }
  }
  if (dist(mouseX,mouseY,450,300)<100 && gameMode == MENU){
    if(mouseButton == LEFT) gameMode = PLAYING;
  }
  if (dist(mouseX,mouseY,455,375)<50 && gameMode == GAMEOVER){
    if(mouseButton == LEFT) {
      stage1();
      gameMode = PLAYING; 
    }
  }
   if (dist(mouseX,mouseY,460,450)<50 && gameMode == GAMEOVER){
    if(mouseButton == LEFT) {
      exit();
    }
   }
   
   if (gameMode == END) {
     if (mouseButton == RIGHT){
        gameMode = MENU;
        
        setup();
     }
   }
  
}

void handleBullets()
{
  for (int i =0; i< bullets.size(); i++){
  
    Projectile temp = bullets.get(i);
    temp.render();
    temp.update();

  if (temp.wallHit())
      bullets.remove(i);
  
  }
 
}
void handleSpit()
{
  for(Spit acid : spits)
  {
    acid.render();
    acid.update();
  }
  
  Spit acid = new Spit(bZ.x,bZ.y,bZ.directionX,bZ.directionY,bZ.rotation);
  if (millis() > spitTimeCheck + spitTimeInterval)
  {
    spitTimeCheck = millis();
    spits.add(acid);
  }
}
void handleBlood()
{
  for (Blood splats : blood)
  {
    splats.render();
  }
}
void handleZombies()
{
  // handles zombie behaviour and moving to next level
  
  for (int i = 0; i < zombies.size(); i++) {
    Zombie zombie = (Zombie) zombies.get(i);
    zombie.render();
    zombie.hitCheck();
    if (gameMode == PLAYING)
    zombie.bounds1();
    else if (gameMode == STAGE2)
    zombie.bounds2();
    else if (gameMode == STAGE3)
    zombie.bounds3();
  }
  if (zombies.size() <=0 && !endLevel)
  {
    endLevel = true;
     for (int i=0; i<10; i++)
    {
      zombies.add(new Zombie(90,100));
      zombies.add(new Zombie(930,93));
    }
  }
  else if (endLevel && zombies.size() <=0)
  {
    nextArea = true;
    
  }
  
  
  if (gameMode == STAGE2 && !endLevel2 && zombies.size() < 14){
    zomCount ++;
    zombies.add(new Zombie(925,120));
    zombies.add(new Zombie(925,510));
    if (zomCount >= 10)
    zombies.add(new Zombie(190,200));
  }
  
  if (zomCount >= 15 && gameMode == STAGE2){
      endLevel2 = true;
      if (zombies.size() <=0){
      textSize(40);
    fill(0);
    text("Move To level 3", 350, 400);
    fill(0);
    triangle(920, 140, 930, 120, 940, 140);
    fill(0);
    rect(925, 140, 10, 30);
    if (dist(p1.x,p1.y,930,90)<20)
    {
      stage3();
      gameMode = STAGE3;
      endLevel2 = false;
      zomCount =0;
    }
   }
  }
  
  if (gameMode == STAGE3 && millis() > timeCheck + timeInterval && zomCount <10){
    timeCheck = millis();
    zombies.add(new Zombie(82,98));
    zombies.add(new Zombie(72,550));
    zombies.add(new Zombie(920,540));
    zombies.add(new Zombie(930,90));
    zomCount++;
  }
    if (zombies.size() <=0 && gameMode == STAGE3){
    textSize(40);
    fill(0);
    text("Move To level 4", 350, 400);
    fill(0);
    triangle(920, 140, 930, 120, 940, 140);
    fill(0);
    rect(925, 140, 10, 30);
    if (dist(p1.x,p1.y,930,90)<20)
    {
      boss();
      gameMode = BOSS;
      zomCount =0;
    }
   }
  
}
void zombieSpacing()
{
  for (int i=0; i < zombies.size(); i++)
  {
    for(int j=i+1; j<zombies.size(); j++){
    Zombie a = zombies.get(i);
    Zombie b = zombies.get(j);
      if (dist(a.x,a.y,b.x,b.y)<20)
      {
        b.x = constrain(b.x,a.x+20,width);
        b.y += 10;
        b.speed = 2;
      }
    }
  }
}
void endOfLevel()
{
  if (nextArea)
  {
    textSize(40);
    fill(0);
    text("Move To level 2", 350, 400);
    fill(0);
    triangle(920, 140, 930, 120, 940, 140);
    fill(0);
    rect(925, 140, 10, 30);
    if (dist(p1.x,p1.y,930,90)<20)
    {
      stage2();
      gameMode = STAGE2;
      nextArea = false;
    }
  }
}

class Sprite
{
  float x;
  float y;
  float speed=1.5;
  float angle;
  int edge = 20;
  int size = 50;
  int inner = edge + size;
  float rotation = 0.0;
  float directionX = 0;
  float directionY = 1;
  int frame =0;
  int life =100;
  
  Sprite(float x, float y)
  {
    this.x=x;
    this.y=y;
  }
  
  void render()
  {
    
      pushMatrix();
      translate(x, y);
      rotate(radians(rotation));
  }
  
  void update(){
    
  }
  
  void facing(float otherX, float otherY)
  {
    rotation = degrees(atan2(otherY-y, otherX-x)); // calculates the angle of rotation in degrees
    directionX = cos(radians(rotation)); // calculates the cosine of the angle so that x is relative to the direction the player is facing
    directionY = sin(radians(rotation)); // calculates the sine of the angle so that y is relative to the direction the player is facing
  }
  
   void bounds1()
   {
    // sets boundry for surrounding walls
    
  
  // surrounding wall
  x = constrain(x, inner, width - inner);
  y = constrain(y, inner, height - inner);


   // long wall
   if (x + size >=750  && y + size >= 70 && y <= 325){ // right side
      x = constrain(x,740,width);
    }
   if (x + size >= 665  && x <740 && y + size >= 70 && y <= 325){ // left side
      x = constrain(x,0,670);
    }
   if (dist(x,y,700,345)<30){ // bottom side of pillar
      y = constrain(y,345,height);
    }
   
   // pillar #1
    if (dist(x,y,450,205)<30){ //left side of pillar
      x = constrain(x,0,450);
    }
    if (dist(x,y,495,150)<30){ // top side of pillar
      y = constrain(y,0,150);
    }
    if (dist(x,y,550,205)<30){ // right side pillar
      x = constrain(x,540,width);
    }
    if (dist(x,y,495,250)<30){ // bottom side of pillar
      y = constrain(y,250,height);
    }
    
    //pillar #2
    
    if (dist(x,y,370,490)<30){ // top side of pillar
      y = constrain(y,0,475);
    }
    if (dist(x,y,320,520)<30){ // left side of pillar
      x = constrain(x,0,320);
    }
    if (dist(x,y,360,560)<30){ // bottom side of pillar
      y = constrain(y,570,height);
    }
    if (dist(x,y,430,530)<30){ // right side of pillar
      x = constrain(x,420,width);
    }
      
  }  
  void bounds2()
  {
      
     x = constrain(x, inner, width - inner);
     y = constrain(y, inner, height - inner);


   // long wall
   if (dist(x,y,340,255)<50) // right side
      x = constrain(x,0,340);
    
   if (x >=345 && x <600 && y >= 220 && y <260) // top side
     y = constrain (y,0,220);
   
   if (x >345 && x<600 && y >290) // bottom side
     y = constrain (y,295,height);
     
   if (x >580 && x <655 && y >150 && y <350) // top right wall
     x = constrain (x,0,580);
   
   if (dist(x,y,615,360)<50)
     y = constrain (y,360,height);
     
   if (dist(x,y,615,150)<50)
     y = constrain (y,0,150);
     
   if (x >655 && y >150 && y <360)
     x = constrain (x,660,width);
     
   // far right wall
   
   if (dist(x,y,755,445)<50)
     x = constrain (x,0,755);
     
   if (x >760 && y >480)
     y = constrain (y,485,height); // bottom side
     
   if (x >760 && y >405 && y <445)
     y = constrain (y,0,410); // top side
   
  }
   void bounds3()
  {
     x = constrain(x, inner, width - inner);
     y = constrain(y, inner, height - inner);
  }
  
  void bounds4()
  {
   
     x = constrain(x, inner, width - inner);
     y = constrain(y, inner, height - inner);
     
     // top left pillar
      if (dist(x,y,364,197)<30) // top side of pillar
      y = constrain(y,0,200);
      
      if (dist(x,y,326,230)<30) // left side of pillar
      x = constrain(x,0,326);
    
      if (dist(x,y,400,240)<30) // right side of pillar
      x = constrain(x,400,width);
      
      if (dist(x,y,361,275)<30) // bottom side of pillar
      y = constrain(y,275,height);
      
       // top right pillar
      if (dist(x,y,696,195)<30) // top side of pillar
      y = constrain(y,0,195);
      
      if (dist(x,y,662,237)<30) // left side of pillar
      x = constrain(x,0,662);
    
      if (dist(x,y,733,240)<30) // right side of pillar
      x = constrain(x,733,width);
      
      if (dist(x,y,693,257)<30) // bottom side of pillar
      y = constrain(y,275,height);
      
       // bottom left pillar
      if (dist(x,y,364,428)<30) // top side of pillar
      y = constrain(y,0,428);
      
      if (dist(x,y,334,470)<30) // left side of pillar
      x = constrain(x,0,334);
    
      if (dist(x,y,400,472)<30) // right side of pillar
      x = constrain(x,400,width);
      
      if (dist(x,y,363,509)<30) // bottom side of pillar
      y = constrain(y,509,height);
      
       // bottom right pillar
      if (dist(x,y,700,436)<30) // top side of pillar
      y = constrain(y,0,436);
      
      if (dist(x,y,667,480)<30) // left side of pillar
      x = constrain(x,0,667);
    
      if (dist(x,y,737,480)<30) // right side of pillar
      x = constrain(x,737,width);
      
      if (dist(x,y,698,518)<30) // bottom side of pillar
      y = constrain(y,518,height);
    
     
  }
    void hitCheck()
 {
   
   for (int i =0; i< zombies.size(); i++){
     Zombie z = (Zombie) zombies.get(i);
   if (dist(z.x,z.y,p1.x,p1.y)<30)
     {
     
      p1.life --;
       
     }
   }
   
   if (gameMode == BOSS){
     if (dist(bZ.x,bZ.y,p1.x,p1.y)<35)
       {
       
         p1.life --;
       
       }
     }
 }
 void spitCheck()
 {
   for (int i =0; i< spits.size(); i++){
     Spit spit = (Spit) spits.get(i);
   if (dist(spit.x,spit.y,this.x,this.y)<20)
     {
       p1.life -= 10;
       spits.remove(spit);
       blood.add(new Blood(this.x,this.y));
       
     }
   }
 }
}

class Player extends Sprite{
  //members
  int numFrames=20;
  PImage feet;
  PImage[] idle = new PImage[numFrames];
  PImage[] move = new PImage[numFrames];
  PImage[] run = new PImage[numFrames];
  PImage[] stfLeft = new PImage[numFrames];
  PImage[] stfRight = new PImage[numFrames];
  PImage[] shoot = new PImage[3];

  float speed = 3;
  int life = 100;
  
  Player(float x, float y){
    super(x,y);
    feet=loadImage("data/survivor-idle_0.png");
    feet.resize(30,30);
    for (int i = 0; i < numFrames; i++){
      idle[i] = loadImage("data/survivor-idle_rifle_"+i+".png");
      idle[i].resize(50,50);
      move[i] = loadImage("data/survivor-move_rifle_"+i+".png");
      move[i].resize(50,50);
      run[i] = loadImage("data/survivor-run_"+i+".png");
      run[i].resize(30,30);
      stfLeft[i] = loadImage("data/survivor-strafe_left_"+i+".png");
      stfLeft[i].resize(30,30);
      stfRight[i] = loadImage("data/survivor-strafe_right_"+i+".png");
      stfRight[i].resize(30,30);
    }
   for (int i = 0; i < shoot.length; i++){
     shoot[i] = loadImage("data/survivor-shoot_rifle_"+i+".png");
     shoot[i].resize(50,50);
   }
  }
  void render(){
 
      imageMode(CENTER);
      super.render();
   
      if(strafeLeft == true){
        strafeLeft();
      }
      else if(strafeRight == true){
        strafeRight();
      }
      else if(isIdle == true){
        idle();
      }
      else if(isIdle == false){
        move();
      }
      
      popMatrix();
    
  }
  void idle(){
    frame = (frame +1) % numFrames; // cycles through frames
      image(feet,0,0);
      image(idle[(frame) % numFrames],0,0); // 0,0 because thats the point of origin for rotation
  }
  void move(){
    frame = (frame +1) % numFrames;
      image(run[(frame) % numFrames],0,0);
      image(move[(frame) % numFrames],0,0);
  }
  void strafeLeft(){
    frame = (frame +1) % numFrames;
      image(stfLeft[(frame) % numFrames],0,0);
      image(move[(frame) % numFrames],0,0);
  }
  void strafeRight(){
    frame = (frame +1) % numFrames;
      image(stfRight[(frame) % numFrames],0,0);
      image(move[(frame) % numFrames],0,0);
  }
  
  void update()
  {
    facing(mouseX, mouseY); // player rotates towards cursor
    
     // moves the player forwards and backwards relative to the direction the player is facing
    x += (up - down) * directionX * speed;
    y += (up - down) * directionY * speed;
    if(strafeRight == true || strafeLeft == true){
       x += (left - right) * directionY * speed;
       y += (left - right) * directionX * speed;
    }
  }
 

}

class Zombie extends Sprite{
  //members
  int numFrames=17;
  float speed=1.5;
  float life = 100;
  
  Zombie(float x, float y){
    super(x,y);
    
  }
  void render()
  {
    
      super.render();
      if (move || shoot)
    {
      move();
      
    } else idle();
    
    popMatrix();
   }
  
  void idle()
  {
   frame = (frame +1) % numFrames;
      image(idleZombie[(frame) % numFrames],0,0);
  }
  void move()
  {
   frame = (frame +1) % numFrames;
      image(moveZombie[(frame) % numFrames],0,0);
  }
  
 
  void movement()
  {
    facing(p1.x,p1.y);
      // calculates the angle from the zombie to the player
      angle = atan2(p1.y-this.y, p1.x-this.x);
      // moves zombie along the x and y axis 
      x = cos(angle)*speed+this.x;
      y = sin(angle)*speed+this.y;
  }
  void bounds1()
  {
      
    
    if (move || shoot)
    {
      movement();

    } 
  

   // long wall
   if (x + size >=740 && x <=750 && y + size >= 70 && y <= 325){ // right side
      x = constrain(x,740,width);
      facing(750,height);
      angle = atan2(height-this.y, 750-this.x);
      x = cos(angle)*speed+this.x;
      y = sin(angle)*speed+this.y;
      if (y > 325)
      {
        movement();
      }
    }
   if (x + size >= 720  && x <=740 && y + size >= 70 && y <= 325){ // left side
      x = constrain(x,0,670);
       facing(660,height);
      angle = atan2(height-this.y, 660-this.x);
      x = cos(angle)*speed+this.x;
      y = sin(angle)*speed+this.y;
      if (y > 325)
      {
        movement();
      }
    }
   if (dist(x,y,700,345)<50){ // bottom side of pillar
      y = constrain(y,345,height);
    }
   
   // pillar #1
    if (dist(x,y,485,205)<50){ //left side of pillar
      x = constrain(x,0,485);
     facing(460,0);
      angle = atan2(0-this.y, 460-this.x);
      x = cos(angle)*speed+this.x;
      y = sin(angle)*speed+this.y;
      if (y > 210)
      {
        movement();
      }
    }
   
   super.bounds1();
  }
  
  void bounds2()
  {
    
    if (move || shoot)
    {
      movement();

    } 
    
   super.bounds2();
     
  }
  
  void bounds3()
  {
    
    if (move || shoot)
    {
      movement();

    } 
    
    super.bounds3();
  }
  
  void hitCheck()
 {
   
   for (int i =0; i< bullets.size(); i++){
     Projectile bullet = (Projectile) bullets.get(i);
   if (dist(bullet.x,bullet.y,this.x,this.y)<20)
     {
       //zombieShot.play();
       zombies.remove(this);
       bullets.remove(bullet);
       blood.add(new Blood(this.x,this.y));
       score+=10;
     }
   }
 }
  
}

class Projectile
{
  float x;
  float y;
  float directionX;
  float directionY;
  float speed = 10;
  float rotation;
  
  Projectile(float x, float y, float directionX, float directionY, float rotation){
    this.x=x;
    this.y=y;
    this.directionX = directionX;
    this.directionY = directionY;
    this.rotation = rotation;
  }
  
   void update()
  {
    rotation = degrees(atan2(directionY, directionX));
    y += directionY * speed;
    x += directionX * speed;
    
  }
  
  void render()
  {
    noStroke();
    fill(40,40,40);
    ellipse(this.x,this.y,5,5);
   
  }
  boolean wallHit(){
    return false;
  }
}

class Spit extends Projectile{
  //members
  
 float speed =7;
  PImage spit;
  
  Spit(float x, float y, float directionX, float directionY, float rotation){
    super(x,y,directionX,directionY,rotation);
    spit = loadImage("data/spit.png");
    spit.resize(60,60);
  }
  void render()
  {
    image(spit,x,y);
  }
  
  
}

class Bullet extends Projectile{
  //members
  float speed =10;
  final color WALL = color(142,123,89);
  
  Bullet(float x, float y, float directionX, float directionY, float rotation){
    super(x,y,directionX,directionY,rotation);
  }
  
 
 boolean wallHit()
 {
   
   
   color testcol = get((int)x,(int)y);
   if (testcol == WALL)
     {
       return true;
     }
   
   return false;
  
 }

}

class BossZombie extends Zombie{
  //members
  
  float life = 100;
  float MAX_HEALTH = 100;
  float rectWidth = 60;
  
  BossZombie(float x, float y){
    super(x,y);
    for (int i = 0; i < 17; i++){
      idleZombie[i] = loadImage("data/skeleton-idle_"+i+".png");
      idleZombie[i].resize(100,100);
      moveZombie[i] = loadImage("data/skeleton-move_"+i+".png");
      moveZombie[i].resize(110,110);
    }
  
  }
  
  
  void hitCheck()
 {
   
   for (int i =0; i< bullets.size(); i++){
     Bullet bullet = (Bullet) bullets.get(i);
   if (dist(bullet.x,bullet.y,this.x,this.y)<20)
     {
       //zombieShot.play();
       life -=5;
       bullets.remove(bullet);
       blood.add(new Blood(this.x,this.y));
       
     }
   }
 }
 void update()
 {
   // Draw bar
  noStroke();
  fill(236, 240, 241);
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth =  rectWidth *(life / MAX_HEALTH);
  rect(x,y-50, rectWidth, 10);
  
  
    // Change color
  if (life > 60) {
    fill(46, 204, 113);
  } else if (life > 30) {
    fill(230, 126, 34);
  } else {
    fill(231, 76, 60);
  }
  
  rect(x,y-50, drawWidth, 10);
 
  
   render();
   super.movement();
   hitCheck();
   
 }
}

class Blood{
  float x;
  float y;
  int counter =0;
  PImage[] blood = new PImage[3];
  
  Blood (float x, float y){
    this.x = x;
    this.y = y;
    for (int i = 0; i < 3; i++){
      blood[i] = loadImage("data/bloodsplats_"+i+".png");
      blood[i].resize(50,50);
    }
  }
  void render()
  {
     if (counter>=0 && counter<=2){
        image(blood[0],x,y);
      }
     else if (counter>=2 && counter<=4)
     {
       image(blood[1],x,y);
     }
      else image(blood[2],x,y);
      
      counter ++;
    
  }
}
