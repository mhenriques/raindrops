class Raindrop {
  PVector loc;
  PVector vel;
  int d;

  Raindrop() {
    loc = new PVector(random(width), d);
    vel = new PVector(0, 2);
    if (vel.y<0) {
      vel.y*=-1;
    }
    d=10;
  }

  void display() {
    ellipse(loc.x, loc.y, d, d);
  } 

  void move() {
    loc.add(vel);
  }
}

