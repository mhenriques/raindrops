int n=200;
Raindrop[] r1=new Raindrop[n];
Catcher circle;
void setup() {
  size(600, 600);
  for (int i=0; i<n; i++) {
    r1[i]=new Raindrop();
  } 
  circle= new Catcher();
}

void draw() {
  background(0, 50, 100);
  fill(255);
  circle.display();
  for (int i=0; i<n; i++) {
    r1[i].display();
    r1[i].move();
    r1[i].ChangeSize();
  }
}

