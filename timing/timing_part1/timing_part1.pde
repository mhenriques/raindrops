color c = color(0);

void setup(){
 size(600,600);
 textSize(100);
 textAlign(CENTER); 
}

void draw(){
 background(c);
 if(frameCount%100==0){
  c=color(random(255),random(255),random(255));
 } 
 text(frameCount,width/2,height/2);
}
