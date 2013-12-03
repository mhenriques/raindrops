int oldTime = 0;
int currentTime = 0;
int c = color(0);
int d = 50;
int circle = color(255);

void setup() {
  size(500, 500);
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(c);
  fill(circle);
  ellipse(mouseX, mouseY, d, d);
  currentTime=millis();
  text(millis()/1000, width/2, height/2);
  println("currentTime: " + currentTime + "\noldTime: " + oldTime);
  if (currentTime-oldTime > 2000) {
    c=color(random(255), random(255), random(255));
    circle = color(random(255), random(255), random(255));
    oldTime=currentTime;
  }
}

