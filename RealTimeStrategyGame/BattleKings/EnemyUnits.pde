//Class EnemyUnit includes the different EnemyUnits and their interactions
class EnemyUnit {
  PVector pos = new PVector (0,0);
  PVector vel;
  int taller = 0;
  boolean InCombat = false;
  int life;
}

class Esword extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (MediumSpeed, 0);
  life = SwordHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKSword.resize(50, 50);
    image(BKSword, 0, 0);
    popMatrix();
  }

  void EswordMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, EnemyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(MediumSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, InCombat becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=120 && taller > VeryFastAttackSpeed) {
      InCombat = true;
      taller = 0;
      FriendBase.life = FriendBase.life -SwordDamage;
    }
  }
}

class Eking extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (FastSpeed, 0);
  life = KingHP;

  void EkingMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, EnemyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(FastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, InCombat becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=120 && taller > SlowAttackSpeed) {
      InCombat = true;
      taller = 0;
      FriendBase.life = FriendBase.life -KingDamage;
    }
  }

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKKing.resize(50, 50);
    image(BKKing, 0, 0);
    popMatrix();
  }
}

class Earcher extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (SlowSpeed, 0);
  life = ArcherHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKBow.resize(50, 50);
    image(BKBow, 0, 0);
    popMatrix();
  }

  void EarcherMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, EnemyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(SlowSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, InCombat becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=300 && taller > MediumAttackSpeed) {
      InCombat = true;
      taller = 0;
      FriendBase.life = FriendBase.life -ArcherDamage;
    }
    /*
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=200) {
     PVector vel = PVector.sub(FriendBase.pos, pos);
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

class Ehorseman extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (VeryFastSpeed, 0);
  life = HorseManHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    BKHorseman.resize(50, 50);
    image(BKHorseman, 0, 0);
    popMatrix();
  }

  void EhorsemanMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (InCombat == true) {
      vel.set(0, 0);
    } //If above is false, EnemyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(VeryFastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, InCombat becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=120 && taller > FastAttackSpeed) {
      InCombat = true;
      taller = 0;
      FriendBase.life = FriendBase.life -HorseManDamage;
    }
  }
}
/*
class arrow extends EnemyUnit {
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
 PVector vel = PVector.sub(FriendBase.pos, pos);
 vel.setMag(2.5);
 pos.add(vel);
 pos.add(this.vel);
 }
 }*/
