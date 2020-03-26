class Unit {
  PVector pos;
  PVector vel;
}

class sword extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (2, 0);

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKSword.resize(50, 50);
    image(BKSword, -25, -25);
    popMatrix();
  }

  void swordMovement() {
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
    }
    pos.add(this.vel);
  }
}

class king extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (10, 0);

  void kingMovement() {
    PVector vel = PVector.sub(EnemyBase.pos, pos);
    vel.setMag(2.5);
    pos.add(vel);
  }

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKKing.resize(50, 50);
    image(BKKing, -25, -25);
    popMatrix();
  }
}

class archer extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (10, 0);

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKBow.resize(50, 50);
    image(BKBow, -25, -25);
    popMatrix();
  }

  void archerMovement() {
    pos.add(this.vel);
  }
}

class horseman extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (15, 0);


  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKHorseman.resize(50, 50);
    image(BKHorseman, -25, -25);
    popMatrix();
  }

  void horsemanMovement() {
    pos.add(this.vel);
  }
}
