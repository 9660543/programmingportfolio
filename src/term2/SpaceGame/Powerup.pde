class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage c1;

  // Constructor
  Powerup () {
    x = int(random(width));
    y = -100;
    diam = int(random(20, 100));
    speed = int(random(1, 5));
    c1 = loadImage("crate2.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'h';
    } else if (rand == 1) {
      type = 'a';
    } else if (rand == 2) {
      type = 't';
    } 
  }
  //Member methods
  void display() {
    if (type == 'h') {
      fill(0,255,0);
    }else if (type == 'a') {
      fill(255,0,0);
    }else if (type == 't') {
      fill(0,0,255);
    }else if (type == 's') {
      fill(20);
    }

    //ellipse(x, y, diam, diam);
    imageMode(CENTER);
    c1.resize(diam, diam);
    image (c1, x, y);
  }


  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
