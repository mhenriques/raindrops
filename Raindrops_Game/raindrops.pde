class Raindrop {
  PVector loc;  //declare variable for location
  PVector vel;  //declare variable for speed
  int d;   //declare variable for ellipse diameter
  int initialv = 2;   //declare variable for the initial velocity of the raindrop in the y direction
  PImage droplet;
  
  Raindrop() {
    loc = new PVector(random(width), d);  //define variable of location
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
    loc.add(vel);  //the raindrops will move downward
  }

  void speedChange () {
    int secondv = 2*initialv;    //declare the second velocity the raindrop will run at (twice the speed as before)
    if (score>=5) {
      vel.y=secondv;   //when the score reaches 5 points, the speed of the raindrop will double
    }
    int thirdv = 2*secondv;    //declare the third velocity the raindrop will run at (twice the speed as before)
    if (score>=10) {
      vel.y=thirdv;  //when the score reaches 10 points, the speed of the raindrop will double
    }
    int fourthv = 2*thirdv;    //declare the fourth velocity the raindrop will run at (twice the speed as before)
    if (score>=15) {
      vel.y = fourthv;  //when the score reaches 15 points, the speed of the raindrop will double
    }
  }
}

