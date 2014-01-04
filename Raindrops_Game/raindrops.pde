class Raindrop {
  //declare and define variables (some)
  PVector loc;  
  PVector vel;  
  int d;   
  int initialv = 2;  
  PImage droplet;
  boolean caught = false;
  
  Raindrop() {
    loc = new PVector(random(d/2, width-(d/2)), d);  //define variable of location
    vel = new PVector(0, initialv);  //define variable for velocity with initialv variable
    droplet = loadImage("droplet.png");
    if (vel.y<0) {
      vel.y*=-1;  //set direction of speed downward
    }
    d=20;  //define size of the raindrop
  }
  void display() {  //displays the raindrops
    image (droplet, loc.x, loc.y, d+5, d);
  } 
  void move() {
    if (!caught)
    {
      loc.add(vel);  //the raindrops will move downward if they are not caught
    }
  }
  void speedChange () {
    textSize(20);  //define "Level" text size
    int secondv = 2*initialv;    //declare the second velocity the raindrop will run at (twice the speed as before)
    if (score<5) {
      text("Level 1", width*.2, 50);
    }
    if (score>=5 && score < 10) {
      vel.y=secondv;   //when the score reaches 5 points, the speed of the raindrop will double
      text("Level 2", width*.2, 50);
    }
    int thirdv = 2*secondv;    //declare the third velocity the raindrop will run at (twice the speed as before)
    if (score>=10 && score < 15) {
      vel.y=thirdv;  //when the score reaches 10 points, the speed of the raindrop will double
      text("Level 3", width*.2, 50);
    }
    int fourthv = 2*thirdv;    //declare the fourth velocity the raindrop will run at (twice the speed as before)
    if (score>=15) {
      vel.y = fourthv;  //when the score reaches 15 points, the speed of the raindrop will double
      text("Level 4", width*.2, 50);
    }
  }
}
