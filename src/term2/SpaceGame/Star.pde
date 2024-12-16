class Star {
  // Member Variables
  int x, y, diam, speed;
  //PImage st1;

  // Constructor
  Star () {
    x = int(random(width));
    y = -10;
    diam = int(random(1, 4));
    speed = int(random(1, 5));
    //st1 = loadImage("star1.png");
  }
  //Member methods
  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
    //imageMode(CENTER);
    //st1.resize(diam, diam);
    //image (st1, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }
}
