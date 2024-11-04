//Maya Jacoben | Data types + Variables | Sept 11
float grade;

void setup() {
  size(400, 150);
  background(20, 200, 250);
}

void draw() {
  background(20, 200, 250);
  //Title info
  textAlign(CENTER);
  fill(0);
  textSize(25);
  text("Grades by Maya Jacobsen", width/2, 40);

  //Reference line
  stroke(10, 10, 127);
  strokeWeight(2);
  line(0, 100, width, 100);

  //Tic Marks
  //line(200,95,200,105);
  for (int i=0; i<width; i+=50) {
    line(i, 95, i, 105);
    fill(0);
    textSize(9);
    text((float)i/width*4, i, 95);
  }

  //Marker
  fill(255);
  ellipse(mouseX, 100, 8, 8);
  textSize(12);
  fill(0);
  text((float)mouseX/width*4, mouseX, 120);

assignGrade((float)mouseX/width*4);

}

void assignGrade(float tgrade) {
  if (tgrade >= 3.51) {
    text("Assign letter grade A.", width/2, 135);
  } else if (tgrade >= 3.00) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade A-.", width/2, 135);
  } else if (tgrade >= 2.84) {
    text ("Assign letter grade B+.", width/2, 135);
  } else if (tgrade >= 2.67) {
    text ("Assign letter grade B.", width/2, 135);
  } else if (tgrade >= 2.50) {
    text ("Assign letter grade B-.", width/2, 135);
  } else if (tgrade >= 2.34 ) {
    text ("Assign letter grade C+.", width/2, 135);
  } else if (tgrade >= 2.17) {
    text ("Assign letter grade C.", width/2, 135);
  } else if (tgrade >= 2.00) {
    text ("Assign letter grade C-.", width/2, 135);
  } else if (tgrade >= 1.66) {
    text ("Assign letter grade D+.", width/2, 135);
  } else if (tgrade >= 1.33) {
    text ("Assign letter grade D.", width/2, 135);
  } else if (tgrade >= 1.0) {
    text ("Assign letter grade D-.", width/2, 135);
  } else { // the catch all, if all others fail, then this is what it will be
    text ("Assign letter grade F.", width/2, 135);
  }
}
