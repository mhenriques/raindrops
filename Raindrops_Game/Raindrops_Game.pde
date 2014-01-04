/*The game is called "Survive the Desert". You're stranded in the desert. It's been four days and you think you see small raindrops falling. 
Collect all the raindrops for the chance to survive another day. The object of the game is to collect 20 raindrops by touching the falling rain droplets 
with the canteen that follows your mouse. Doing so will give you points. Points are recorded as indicated by the score. Once your score reaches 
increments of 5 points the speed at which the raindrops are falling will be doubled. When you fail to catch a falling raindrop (aka the raindrop reaches 
the bottom of the screen a life is lost. If you lose 3 lives the game is over and you have lost. You failed to collect enough water and thus became dehydrated
and passed out. When the score reaches 20 you have collected enough water to survive another day!*/

//declare variables
int score;  
int currentTime;  
int oldTime;   
int timeChange = currentTime - oldTime; 
int index = 1;  
int n = 50;  
int winScore = 20; 
int lives = 3;
int rectx;
int recty;
int rectw = 200;
int recth = 100;
boolean start;
boolean lose;
boolean win;
PImage desert;
PImage sky;

Raindrop[] r = new Raindrop[n];  //creates an array using the Raindrop class
Catcher catcher;  //declares the variable catcher as the catcher class

void setup() {
  start = false;  //define variables
  lose = false;
  win = false;
  desert = loadImage("DesertScene.jpg");
  size(desert.width, desert.height);
  sky = loadImage("sky.png");
  rectx = width/2;
  recty = height/2 +100;
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();  //starts the raindrop array
  } 
  catcher = new Catcher();
 
}
void draw() { 
  if (start==false) {  //start screen
    background(desert);  //defines background picture
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("Survive in the Desert", width/2, 100);  //title of game
    rectMode(CENTER);
    rect(rectx, recty, rectw, recth);  //start button
    textSize(20);
    text("You're stranded in the desert.", width/2, 175);  //background story of the game
    text("It's been four days and you think you see small raindrops falling.", width/2, 200);
    text("Collect all the raindrops for the chance to survive another day.", width/2, 225);
    fill(0, 30, 190);
    text("click to start", rectx, recty-10); 
    text("collecting water", rectx, recty+10);
  }
  else if (start==true && lose==false) {  //playing screen
    background(desert);
    for (int i = 0; i < index; i++) {
      r[i].display();  //the raindrop will be displayed
      r[i].move();  //the raindrop will move
      r[i].speedChange();  //the raindrop will double its speed after 5, 10, and 15 points
      catcher.catchDrop(r[i]);  //if the catcher catches the raindrop score increases and 
      catcher.miss(r[i]);  //if the catcher misses the raindrop 
    }
    catcher.display();
    catcher.move();
    currentTime = millis();  //define currentTime to the elapsed time (in milliseconds) since program began
    if (timeChange <= millis()) {
      if (index<r.length) { 
        index++;  //allows only one raindrop to fall at a time everecty 2 seconds
        timeChange+=2000;
        oldTime=currentTime;  //resets the oldTime to currentTime
      }
    }
    textSize(20);
    text("Lives: "+lives, width*.7, 50); 
    text("Score: "+score, width*.4, 50);  //displays score on bottom right hand corner
  }
  if (score==winScore) {
    win=true;
    if (win==true) {
      start = false;
      background(desert);
      fill(0);
      textAlign(CENTER);
      textSize(30);
      text("You have survived the day!", width/2, 150);
      fill(255);
      rect(rectx, recty, rectw, recth);  //restart button
      textSize(20);
      fill(0,30,190);
      text("still thirsty?",rectx, recty-10);
      text("play again!", rectx,recty+10);
    }
  }
  if (lose==true) {  //makes the lose screen
    background(sky);
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("you became severely dehydrated and passed out.", width/2, 150);
    fill(255);
    rect(rectx, recty, rectw, recth);  //restart button 
    textSize(20);
    fill(0,30,190);
    text("good luck surviving.",rectx, recty-10); 
    text("try again?", rectx, recty+10);
  }
}
void mousePressed() {
  if (start==false && lose==false && win==false && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {  //if the mouse is clicked on the box on the start screen the game will start
    start=true;
    timeChange = millis()+2000;
  }
  if (start==false && lose==false && win==true && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {  //if the mouse is clicked on the box on the win screen the game is restarted
    timeChange = millis()+2000;
    win=false;
    start=true;
    lose=false;
    score=0;
    lives=3;
  }
  if (start==false && lose==true && win==false && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {  //if the mouse is clicked on the box on the lose screen the game is restarted
    timeChange = millis()+2000;
    start=true;
    lose=false;
    lives=3;
    score=0;
  }
}

