class base {
  PVector pos = new PVector (50, 200);
  
  void update() {
    rectMode(CENTER);
    fill(0, 0, 255);
    rect(pos.x, pos.y, 50, 50);
  }
}

class enemyBase {
  PVector pos = new PVector (1300, 200);

  void update() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);
  }
}
