//Abdullah, Jens and Magnus DDU. RealTime Strategy Game

void setup() {
  size(1400, 700);
}

void draw() {
  background(0);
}

class sword {
  PVector swordPos;
  PVector swordVel;
  
    void update() {
    pushMatrix();
    translate(swordPos.x, swordPos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(0, 0, 50, 50);
    popMatrix();
  }

  void swordMovement() {

  }
}
