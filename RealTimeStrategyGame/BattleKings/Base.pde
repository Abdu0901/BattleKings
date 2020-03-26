class base {
  PVector pos = new PVector (50, 200);
  int life = 100;

  void update() {
    rectMode(CENTER);
    fill(0, 0, 255);
    rect(pos.x, pos.y, 50, 50);
    fill(255);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(life + "HP", pos.x, pos.y);
  }
}

class enemyBase {
  PVector pos = new PVector (1300, 200);
  int life = 100;

  void update() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);
    fill(255);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(life + "HP", pos.x, pos.y);
  }
}
