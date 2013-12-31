class Catcher {
  PVector loc;  //declare variables
  int d;   
  PImage canteen;

  Catcher() {
    loc = new PVector(mouseX, mouseY);  //define location variable
    d = 45;  //define catcher size
    canteen = loadImage("canteen.jpg");
  }
  void move()
  {
    loc.set(mouseX, mouseY);
  }
  void display() {  //display the catcher on the screen
    image(canteen,loc.x, loc.y, d, d); 
  }
  void catchDrop(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {  //checks to see if catcher touched raindrops
      drop.loc.set(-width, height*-10);  //moves raindrop off screen
      drop.vel.set(0, 0);  //stops raindrop in that new position
      drop.caught = true;
      score++;  //increase the score by one point
    }
  }
  void miss(Raindrop drop) {  //if the canteen misses a raindrop a life is lost and the raindrop is moved to a location off the screen
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

