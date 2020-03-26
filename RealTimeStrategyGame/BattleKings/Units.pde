//Class Unit includes the different units and their interactions
class Unit {
  PVector pos;
  PVector vel;
}

class sword extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (2, 0);
  int taller = 0;

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
    taller++;
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.add(vel);
    }
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
    pos.add(this.vel);

    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=20 && taller > 9) {
      taller = 0;
      EnemyBase.life = EnemyBase.life -1;
    }
  }
}

class king extends Unit {
  PVector pos = new PVector (50, 350);
  PVector vel = new PVector (10, 0);

  void kingMovement() {

    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.add(vel);
    }
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
    pos.add(this.vel);
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
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
      /*      PVector vel = PVector.sub(EnemyBase.pos, pos);
       vel.setMag(2.5);
       pos.add(vel);  */

      //   add(arrow);
    }
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
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
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.add(vel);
    }
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
    pos.add(this.vel);
  }
}

class arrow extends Unit {
  //  PVector pos = new PVector (archer.pos.x, archer.pos.y);
  PVector vel = new PVector (15, 0);


  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }

  void arrowMovement() {
    PVector vel = PVector.sub(EnemyBase.pos, pos);
    vel.setMag(2.5);
    pos.add(vel);
    pos.add(this.vel);
  }
}
