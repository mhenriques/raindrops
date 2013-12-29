/*The object of the game is to collect 20 raindrops by touching the falling white circles with the aqua circle that follows your mouse. Doing so will give you points. 
 Points are recorded on the score in the bottom right hand corner. Once your score reaches 5 points the speed at which the raindrops are falling at will be doubled. 
 The same will happen when your score reaches 10 points and then again at 15 points. When the score reaches 20 you have won the game!*/

int score;  //declare variable score
int currentTime;  //declare variable currentTime
int oldTime;   //declare variable oldTime 
int timeChange = currentTime - oldTime;  //declare variable timeChange
int index;  //declare variable index
int n = 50;  //declare variable n and define it to the number of raindrops you would like in the array
int winScore = 20;  /*declare variable winScore and define it to the number of points needed to win the game (must be smaller than value of variable n)*/
int lives = 3;
int rectx = width/2;
int recty = height/2;
int rectw = 100;
int recth = 100;
boolean start = false;
boolean lose = false;
boolean win = false;
Raindrop[] r = new Raindrop[n];  //creates an array of using the Raindrop class
Catcher catcher;  //declares the variable catcher as the catcher class

void setup() {
  size(500, 500);  //defines the size of the display screen
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();  //starts the raindrop array
  } 
  catcher = new Catcher();
  textSize(20);  //sets the textSize to 20 pixels
}

void draw() {
  background(0, 30, 190);

  if (start==false && lose==false && win==false) {
    background(0, 30, 190);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text("F THE RAINDROPS", width/2, 100);
    rectMode(CENTER);
    rect(rectx, recty, rectw, recth);
    text("stupid", width/2, height/2);
  }
  if (start==true && lose==false && win==false) {
    background(0, 30, 190);
    for (int i = 0; i < index; i++) {
      r[i].display();  //the raindrop will be displayed
      r[i].move();  //the raindrop will move
      r[i].speedChange();  //the raindrop will double its speed after 5, 10, and 15 points
      catcher.display();
      catcher.catchDrop(r[i]);  //the catcher will "catch" the raindrop and the raindrop will disappear

      if (r[i].loc.y>=height) {
        lives=-1;
        r[i].loc.set(width*2, -height);
        r[i].vel.set(0, 0);
      } 
      currentTime = millis();  //define currentTime to the elapsed time (in milliseconds) since program began
      if (timeChange >= 2000) {
        if (index<r.length) { 
          index++;  //allows only one raindrop to fall at a time every 2 seconds
          oldTime=currentTime;  //resets the oldTime to currentTime
        }
      }
    }
    text("Lives: "+lives, width*.7, 50); 
    text("Score: "+score, width*.4, 50);  //displays score on bottom right hand corner
  }

  if (score>=winScore) {
    win=true;
  }
  if (start==true && lose==false && win==true) {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(75);
    text("YOU WIN!!", width/2, 150);
    rectMode(CENTER);
    rect(rectx, recty, rectw, recth);
    textSize(10);
    text("play again", width/2, height/2);
  }
  if (lives<=0) {
    lose=true;
  }
  if (start==true && lose==true && win==false) {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(75);
    text("YOU LOSE :(", width/2, 150);
    rectMode(CENTER);
    rect(rectx, recty, rectw, recth);
    textSize(10);
    text("try again", width/2, height/2);
  }
}

void mousePressed() {
  if (start==false && lose==false && win==false && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {
    start=true;
  }
  if (start==true && lose==false && win==true&&mouseX<rectx+rectw/2&&mouseX>rectx-rectw/2&& mouseY<recty+recth/2 && mouseY>recty-recth/2) {
    score=0;
    lives=3;
    win=false;
  }

  if (start==true && lose==true&& win==false && mouseX<rectx+rectw/2 && mouseX>rectx-rectw/2 && mouseY<recty+recth/2 && mouseY>recty-recth/2) {
    lives=3;
    score=0;
    lose=false;
  }
}

