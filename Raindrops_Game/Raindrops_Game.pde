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
  textSize(20);
}

void draw() {
  background(20, 115, 250);
  for (int i = 0; i < index; i++) {
    r[i].display();  //utilizes the function display in the raindrop class
    r[i].move();  //utilizes the function move in the raindrop class
    catcher.catchDrop(r[i]);  //utilizes the funtion catchDrop that 
  } 
  catcher.display();  //utilizes the display function
  catcher.update();  
  currentTime = millis();  //define currentTime to the elapsed time in milliseconds since program began
  timeChange = currentTime - oldTime;  //define timeChange
  if (timeChange >= 2000) {
    if (index<r.length) {  //
      index++;  //allows only one raindrop to fall at a time
    }
    oldTime=currentTime;  //resets the oldTime to currentTime
  }
  text(" "+score, width*.9, height*.9);  //displays score on screen in bottom right hand corner
}

