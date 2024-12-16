class Laser {
  // Member Variables
  int x, y, w, h, speed;
  //pImage l1;

  // Constructor
  Laser (int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 5;
    //l1 = loadImage();
  }
  //Member methods
  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    //l1 Image(l1,x,y);
    noStroke();
    rect(x, y, w, h, 3);
  }

  void move() {
    y -=speed;
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
