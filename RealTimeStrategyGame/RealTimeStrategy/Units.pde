class Unit {
  PVector pos;
  PVector vel;

  void update() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

class sword extends Unit {

  void swordMovement() {
    this.pos.add(this.vel);
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
