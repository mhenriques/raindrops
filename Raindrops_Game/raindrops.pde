class Raindrop {
  PVector loc;
  PVector vel;
  int d;

  Raindrop() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0,2);
    if (vel.y<0) {
      vel.y*=-1;
    }
    d=5;
  }

  void display() {
    for (int x=0; x<50; x+=1) {
      noStroke();
      ellipse(loc.x, loc.y, d, d);
    }
  } 

  void move() {
    loc.add(vel);

    if (loc.x-d/2>width) {
      loc.x=-d/2;
    } 

    if (loc.x+d/2<0) {
      loc.x=width + d/2;
    }

    if (loc.y-d/2>height) {
      loc.y=-d/2;
    }

    if (loc.y+d/2<0) {
      loc.y=height+d/2;
    }
  }

  void ChangeSize() {
    if (keyPressed) {
      if (key=='d') {
        d=int(random(1, 10));
      }
    }
  }
}
