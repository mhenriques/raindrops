class Raindrop {
  PVector loc;  //declare variable for location
  PVector vel;  //declare variable for speed
  int d;   //declare variable for ellipse diameter
  int initialv = 2;   //declare variable for the initial velocity of the raindrop in the y direction
  PImage droplet;
  boolean caught = false;
  
  Raindrop() {
    loc = new PVector(random(d/2, width-(d/2)), d);  //define variable of location
    vel = new PVector(0, initialv);  //define variable for velocity with initialv variable
    droplet = loadImage("droplet.png");
    if (vel.y<0) {
      vel.y*=-1;  //set direction of speed downward
    }
    d=20;  //define variable for diameter of circle
  }
  void display() {
    fill(255);  //define color of raindrops
    image (droplet, loc.x, loc.y, d+5, d);  //the raindrops will be white circles
  } 
  void move() {
    if (!caught)
    {
      loc.add(vel);  //the raindrops will move downward
    }
  }
  void speedChange () {
    textSize(20);
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
