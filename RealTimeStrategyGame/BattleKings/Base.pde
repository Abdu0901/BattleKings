class base {
  PVector pos = new PVector (50, 200);
  
  void update() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);
  }
}

class enemyBase {
  PVector pos = new PVector (50, 600);

  void update() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);
  }
}
