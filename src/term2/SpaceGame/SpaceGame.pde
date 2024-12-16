//Maya Jacobsen | Nov 6 2024 | SpaceGame
import processing.sound.*;
SoundFile laser;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate;
boolean play;

Timer rTime, puTime, lTime;

void setup() {
  size (800, 800);
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false ;
  rockRate = 1000;
  rTime = new Timer(rockRate);//milisecond 1000 for one sec
  rTime.start();
  puTime = new Timer(10000);
  puTime.start();
  laser = new SoundFile(this, "laser3.wav");
  //lTime = new Timer(10000);
  //lTime.start();
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background (20);
    if (frameCount % 1000  == 0) {
      rTime.totalTime-=50;
      level++;
      rockRate-= 50;
    }
    //if (lTime.isFinished()) {
    //  s1.laserCount += 2;
    //}
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }


    //render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type =='h') {
        //health
        s1.health += 5;
        //remove powerup
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type =='a') {
        s1.laserCount += 100;
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type =='t') {
        s1.turretCount++;
        powups.remove(pu);
      }
      //else if () {}
      //ammo
      //turret count
      //heat seeking ammo
      //time
      //remove all enemy obj on screen
      //temp score multiplier
      //alter speed of enemy obj
      //rotating rock for mele damage
      //temp sheild/invinsibility


      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }

    //render lasers and detect rock collide
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rock.diam -= 20;
          if (rock.diam <5) {
            rocks.remove(rock);
          }
          score += 100;
          lasers.remove(laser);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }


    //rock distrubution
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    //rocks rendered + colision detection
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        //deduct 10 points
        score-= 10;
        //deduct 10 health
        s1.health -= 10;
        //delete rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }


    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    // change code to detect when x number of rocks pass
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
}

void keyPressed() {

  if (key  == ' ' && s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;//-- means the same as -= 1 or s1 laserCount = laserCount -1
  } else if (key  == ' ' && s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount-= 2;//-- means the same as -= 1 or s1 laserCount = laserCount -1
  } else if (key  == ' ' && s1.fire() && s1.turretCount >2) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount -= 2;//-- means the same as -= 1 or s1 laserCount = laserCount -1
  }
  if (key  == ' ' && !laser.isPlaying()) {
    laser.play();
  }
}
void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(20);
  text("Score:" + score, 50, 36);
  text("Health:" + s1.health, 160, 36);
  text("Level:" + level, 300, 36);
  text("Ammo:" + s1.laserCount, 420, 36);
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(20);
  text("Welcom to SpaceGame!", width/2, 300);
  textSize(15);
  text("made by Maya Jacobsen", width/2, 320);
  text("Please click to start", width/2, 375);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(40);
  text("Game Over", width/2, 300);
  textSize(30);
  text("Score:" + score, width/2, 340);
  text("Level:" + level, width/2, 375);
  text("", width/2, 390);
}

void ticker() {
}

void mousePressed() {
  if (!laser.isPlaying()) {
    laser.play();
  }
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount-=2;
  } else if (s1.fire() && s1.turretCount >2) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount -=2;
  }
}
