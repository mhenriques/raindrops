/*The object of the game is to collect 20 raindrops by touching
the falling white circles with the aqua circle that follows your
mouse. Doing so will give you points. Points are recorded on the 
score in the bottom right hand corner. Once your score reaches 
5 points the speed at which the raindrops are falling at will 
be doubled. The same will happen when your score reaches 10 
points and then again at 15 points. When the score reaches 20 
you have won the game!*/

int score;  //declare variable score
int currentTime;  //declare variable currentTime
int oldTime;   //declare variable oldTime 
int timeChange;  //declare variable timeChange
int index;  //declare variable index
int n = 50;  //declare variable n and define it to the number of raindrops you would like in the array
int winScore = 20;  /*declare variable winScore and define it to the number of points 
                    needed to win the game (must be smaller than value of variable n)*/
Raindrop[] r = new Raindrop[n];  //creates an array of using the Raindrop class
Catcher catcher;  //declares the variable catcher as the catcher class

void setup() {
  size(500, 500);  //defines the size of the display screen
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();  //starts the raindrop array
  } 
  catcher = new Catcher();
  textSize(20);  //sets the textSize to 20 pixels
}

void draw() {
  background(0, 30, 190);  //sets the background to a shade of blue
  for (int i = 0; i < index; i++) {
    r[i].display();  //the raindrop will be displayed
    r[i].move();  //the raindrop will move
    r[i].speedChange();  //the raindrop will double its speed after 5, 10, and 15 points
    catcher.catchDrop(r[i]);  //the catcher will "catch" the raindrop and the raindrop will disappear
  } 
  catcher.display();  //the catcher is displayed
  catcher.update();  //the catcher is updated
  currentTime = millis();  //define currentTime to the elapsed time (in milliseconds) since program began
  timeChange = currentTime - oldTime;  //define timeChange
  if (timeChange >= 2000) {
    if (index<r.length) { 
      index++;  //allows only one raindrop to fall at a time every 2 seconds
    }
    oldTime=currentTime;  //resets the oldTime to currentTime
  }
  text(" "+score, width*.9, height*.9);  //displays score on bottom right hand corner
  if (score>=winScore) {
    background(0); //changes the background color to black
    textSize(75);  //makes the text size bigger
    text("YOU WIN!!!", 75, height/2);  //writes "YOU WIN!!!" on the display screen
  }
}

