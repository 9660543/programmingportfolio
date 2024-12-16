class Spaceship {
  // Member Variables
  int x, y, w, laserCount, turretCount, health;


  // Constructor
  Spaceship () {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 100;
    turretCount = 1;
    health = 100;
  }
  //Member methods
  void display() {
    strokeWeight(1);
    stroke(80);
    fill(50);
    //thruster
    fill(122, 197, 250);
    rect(x+10, y+15, 10, 10);
    rect(x-20, y+15, 10, 10);
    triangle(x, y-35, x+10, y, x-10, y);

    //turret
    stroke(80);
    line(x+30, y-10, x+30, y+15);
    line(x-30, y-10, x-30, y+15);

    //wing
    fill(2, 5, 173);
    triangle(x, y-15, x+45, y+20, x-45, y+20);
    fill(99);
    triangle(x, y-18, x-6, y-6, x+6, y-6);
    quad(x+11, y-4, x+16, y, x+16, y+20, x+11, y+20);
    quad(x-11, y-4, x-16, y, x-16, y+20, x-11, y+20);

    fill(8, 98, 166);
    triangle(x+45, y+20, x+40, y+30, x+35, y+13);
    triangle(x-45, y+20, x-40, y+30, x-35, y+13);
    quad(x+18, y+1, x+33, y+13, x+35, y+18, x+18, y+18);
    quad(x-18, y+1, x-33, y+13, x-35, y+18, x-18, y+18);
    quad(x+9, y-2, x-9, y-2, x-9, y+18, x+9, y+18);
    fill(0);
    quad(x, y-10, x+8, y+5, x, y+15, x-8, y+5);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
