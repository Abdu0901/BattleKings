//Class Unit includes the different units and their interactions
class Unit {
  PVector pos;
  PVector vel;
  int taller = 0;
  boolean InCombat = false;
}

class sword extends Unit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (3, 0);

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKSword.resize(50, 50);
    image(BKSword, -25, -25);
    popMatrix();
  }

  void swordMovement() {
    taller++;
    //Checks if unit is in combat, if true, stops the unit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, unit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      this.pos.add(this.vel);
    } //If unit is close to enemy base, InCombat becomes true and unit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=120 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyBase.life = EnemyBase.life -1;
    }
  }
}

class king extends Unit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (5, 0);
  void kingMovement() {
    taller++;
    //Checks if unit is in combat, if true, stops the unit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, unit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      this.pos.add(this.vel);
    } //If unit is close to enemy base, InCombat becomes true and unit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=120 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyBase.life = EnemyBase.life -1;
    }
  }

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKKing.resize(50, 50);
    image(BKKing, -25, -25);
    popMatrix();
  }
}

class archer extends Unit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (5, 0);

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKBow.resize(50, 50);
    image(BKBow, -25, -25);
    popMatrix();
  }

  void archerMovement() {
    taller++;
    //Checks if unit is in combat, if true, stops the unit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, unit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      this.pos.add(this.vel);
    } //If unit is close to enemy base, InCombat becomes true and unit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=300 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyBase.life = EnemyBase.life -1;
    }
    /*
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
     PVector vel = PVector.sub(EnemyBase.pos, pos);
     vel.setMag(2.5);
     pos.add(vel);

     //   add(arrow);
     }
     pos.x = constrain(pos.x, 0, width);
     pos.y = constrain(pos.y, 0, height);
     pos.add(this.vel);
     */
  }
}

class horseman extends Unit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (10, 0);

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKHorseman.resize(50, 50);
    image(BKHorseman, -25, -25);
    popMatrix();
  }

  void horsemanMovement() {
    taller++;
    //Checks if unit is in combat, if true, stops the unit from moving
    if (InCombat == true) {
      vel.set(0, 0);
    } //If above is false, unit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(2.5);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      this.pos.add(this.vel);
    } //If unit is close to enemy base, InCombat becomes true and unit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=120 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyBase.life = EnemyBase.life -1;
    }
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
