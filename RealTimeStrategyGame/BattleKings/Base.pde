class base {
  PVector pos = new PVector (100, height/2);
  int life = 100;

  void update() {
    rectMode(CENTER);
    fill(0, 0, 255);
    rect(pos.x, pos.y, 200, 200);
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(life + "HP", pos.x, pos.y);
  }
}

class enemyBase {
  PVector pos = new PVector (1300, height/2);
  int life = 100;

  void update() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(pos.x, pos.y, 200, 200);
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(life + "HP", pos.x, pos.y);
  }
}
