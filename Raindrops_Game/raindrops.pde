class Raindrop {
  PVector loc;
  PVector vel;
  int d;
  int initialv = 2;

  Raindrop() {
    loc = new PVector(random(width), d);
    vel = new PVector(0, initialv);
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

  void speedChange () {
    int secondv = 2*initialv;
    if (score>=5) {
      vel.y=secondv;
    }
    int thirdv = 2*secondv;
    if (score>=10) {
      vel.y=thirdv;
    }
    int fourthv = 2*thirdv;
    if (score>=20) {
      vel.y = fourthv;
    }
  }
}

