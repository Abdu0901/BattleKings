//Class for Friendly Base that includes all its attributes
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

//Class for Enemy Base that includes all its attributes
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
