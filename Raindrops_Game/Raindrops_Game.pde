
int score;
int currentTime;
int oldTime;
int timeChange;
int index = 0;
Raindrop[] r = new Raindrop[100];
Catcher catcher;

void setup() {
  size(500, 700);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
  } 
  catcher = new Catcher();
}

void draw() {
  background(20, 115, 250);
  for (int i = 0; i < index; i++) {
    r[i].display();
    r[i].move();
    catcher.catchDrop(r[i]);
  } 
  catcher.display();
  catcher.update();
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange >= 2000) {
    if (index<r.length) {
      index++;
    }
    oldTime=currentTime;
  }
  text(" "+score, width*.9, height*.9);
}

