//Maya Jacobsen ||Temp Converter| 27 Sept 2024

void setup() {

  size(400, 200);
}

void draw() {

  if(mouseX<=20){
    background (0,0,255);
  }else if(mouseX<= 50){
   background(20,0,240);
  }else if(mouseX<= 80){
   background(40,0,220);
  }else if(mouseX<= 120){
   background(60,0,200);
  }else if(mouseX<= 150){
   background(80,0,180);
  }else if(mouseX<= 180){
   background(100,0,160);
  }else if(mouseX<= 210){
   background(120,0,140);
  }else if(mouseX<= 240){
   background(140,0,120);
  }else if(mouseX<= 270){
   background(160,0,100);
  }else if(mouseX<= 300){
   background(180,0,80);
  }else if(mouseX<= 330){
   background(200,0,60);
  }else if(mouseX<= 360){
   background(220,0,40);
  }else if(mouseX<= 390){
   background(240,0,20);
  }else if(mouseX<= 420){
   background(255,0,0);
  }

  // Display your name and app title

  line(0, 150, width, 150);

  for (int i=0; i<width+1; i=i+50) {

    line(i, 145, i, 155);

    textAlign(CENTER);

    text(i, i, 165);
    
    ellipse(mouseX,150,5,5);
  }


  text("Cel: " + farToCel(mouseX), width/2, 100);
  text("Far:" + celToFar(mouseX), width/2, 80);


  // TODO: add far info

  // TODO: change the number line to display -200 to 200

  println("MouseX:" + mouseX + " : " + farToCel(mouseX));
}


float farToCel(float tempFar) {

  // formula to calc cel conv

  tempFar = (tempFar-32) * (5.0/9.0);

  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = (tempCel* 9.0/5.0)+(32);
  return tempCel;
}
