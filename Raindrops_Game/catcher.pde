class Catcher {
  PVector loc;  //declare variable for location of catcher
  int d;   //declare variable for diameter of catcher

  Catcher() {
    loc = new PVector(mouseX, mouseY);  //define location variable
    d = 35;  //define diameter variable
  }

  void display() {  //display the catcher on the screen
    fill(130, 250, 240);  //define color of catcher
    ellipse(loc.x, loc.y, d, d);  //defines an ellipse that will be the catcher
  }

  void catchDrop(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {  //checks to see if catcher touched raindrops
      drop.loc.set(-width, height*10);  //moves raindrop off screen
      drop.vel.set(0, 0);  //stops raindrop in that new position
      score++;  //increase the score by one point
    }
  }
}

