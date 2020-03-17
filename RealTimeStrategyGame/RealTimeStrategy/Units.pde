class Unit {
  PVector pos;
  PVector vel;
}

class sword extends Unit {

  void update() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void swordMovement() {
    this.pos.add(this.vel);
  }
}

class king extends Unit {

  void update() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void kingMovement() {
  }
}

class archer extends Unit {

  void update() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void archerMovement() {
  }
}
class horse extends Unit {

  void update() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void horseMovement() {
  }
}
