class Unit {
  PVector pos;
  PVector vel;
}

class sword extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (10, 0);

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void swordMovement() {
    pos.add(this.vel);
  }
}

class king extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (2, 0);

  void kingMovement() {
    pos.add(this.vel);
  }

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

class archer extends Unit {

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void archerMovement() {
  }
}

class horseman extends Unit {


  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void horsemanMovement() {
  }
}
