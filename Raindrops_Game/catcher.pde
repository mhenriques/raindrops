class Catcher {
  PVector loc;  //declare variable for location of catcher
  int d;   //declare variable for diameter of catcher
  Catcher() {
    loc = new PVector(mouseX, mouseY);  //define location variable
    d = 35;  //define diameter variable
  }
  void move()
  {
    loc.set(mouseX, mouseY);
  }
  void display() {  //display the catcher on the screen
    fill(130, 250, 240);  //define color of catcher
    ellipse(loc.x, loc.y, d, d);  //defines an ellipse that will be the catcher
  }
  void catchDrop(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {  //checks to see if catcher touched raindrops
      drop.loc.set(-width, height*-10);  //moves raindrop off screen
      drop.vel.set(0, 0);  //stops raindrop in that new position
      drop.caught = true;
      score++;  //increase the score by one point
    }
  }
  void miss(Raindrop drop) {
    if (drop.loc.y>=height) {
      lives--;
      drop.caught = true;
      drop.loc.set(width*2, -height);
      drop.vel.set(0, 0);
    } 
    if (lives==0) {
      lose=true;
      start = false;
    }
  }
}
