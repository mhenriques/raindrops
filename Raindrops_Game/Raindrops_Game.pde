/*The object of the game is to collect 20 raindrops by touching the falling white circles with the aqua circle that follows your mouse. Doing so will give you points. 
 Points are recorded on the score in the bottom right hand corner. Once your score reaches 5 points the speed at which the raindrops are falling at will be doubled. 
 The same will happen when your score reaches 10 points and then again at 15 points. When the score reaches 20 you have won the game!*/


int score;  //declare variable score
int currentTime;  //declare variable currentTime
int oldTime;   //declare variable oldTime 
int timeChange = currentTime - oldTime;  //declare variable timeChange
int index = 1;  //declare variable index
int n = 50;  //declare variable n and define it to the number of raindrops you would like in the array
int winScore = 20;  /*declare variable winScore and define it to the number of points needed to win the game (must be smaller than value of variable n)*/
int lives = 3;
int rectx;
int recty;
int rectw = 200;
int recth = 100;
boolean start;
boolean lose;
boolean win;
PImage desert;

Raindrop[] r = new Raindrop[n];  //creates an array of using the Raindrop class
Catcher catcher;  //declares the variable catcher as the catcher class
void setup() {
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();  //starts the raindrop array
  } 
  catcher = new Catcher();
  textSize(20);  //sets the textSize to 20 pixels
  start = false;
  lose = false;
  win = false;
  desert = loadImage("DesertScene.jpg");
  size(desert.width, desert.height);
  rectx = width/2;
  recty = height/2 +100;
}
void draw() {
  if (start==false) {
    background(desert);
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("Survive in the Desert", width/2, 100);
    rectMode(CENTER);
    rect(rectx, recty, rectw, recth);
    textSize(20);
    text("You're stranded in the desert.", width/2, 175);
    text("It's been four days and you think you see small raindrops falling.", width/2, 200);
    text("Collect all the raindrops for the chance to survive", width/2, 225);
    fill(0, 30, 190);
    text("click to start", rectx, recty-10);
    text("collecting water", rectx, recty+10);
  }
  else if (start==true && lose==false) {
    background(0, 30, 190);
    for (int i = 0; i < index; i++) {
      r[i].display();  //the raindrop will be displayed
      r[i].move();  //the raindrop will move
      r[i].speedChange();  //the raindrop will double its speed after 5, 10, and 15 points
      catcher.catchDrop(r[i]);  //the catcher will "catch" the raindrop and the raindrop will disappear
      catcher.miss(r[i]);
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
      background(255);
      fill(0);
      textAlign(CENTER);
      textSize(75);
      text("YOU WIN!!", width/2, 150);
      rect(rectx, recty, rectw, recth);
      textSize(10);
      text("play again", width/2, height/2);
    }
  }
  if (lose==true) {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(75);
    text("YOU LOSE ", width/2, 150);
    rect(rectx, recty, rectw, recth);
    textSize(10);
    text("trecty again", width/2, height/2);
  }
}
void mousePressed() {
  if (start==false && lose==false && win==false && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {
    start=true;
    timeChange = millis()+2000;
  }
  if (start==false && lose==false && win==true &&mouseX<rectx+rectw/2&&mouseX>rectx-rectw/2&& mouseY<recty+recth/2 && mouseY>recty-recth/2) {
    timeChange = millis()+2000;
    win=false;
    start=true;
    lose=false;
    score=0;
    lives=3;
  }
  if (start==false && lose==true && win==false && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {
    timeChange = millis()+2000;
    start=true;
    lose=false;
    lives=3;
    score=0;
  }
}

