class Unit {
  PVector pos;
  PVector vel;

  void update() {
    pushMatrix();
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

class sword extends Unit {
  PVector pos = new PVector (500, 500);
  PVector vel = new PVector (10, 0);

  void swordMovement() {
    pos.add(this.vel);
  }
}

class king extends Unit {

  void kingMovement() {
  }
}

class archer extends Unit {

  void archerMovement() {
  }
}

class horseman extends Unit {

  void horsemanMovement() {
  }
}
