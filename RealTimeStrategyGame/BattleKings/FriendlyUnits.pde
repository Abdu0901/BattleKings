//Class FriendlyUnit includes the different FriendlyUnits and their interactions
class FriendlyUnit {
  PVector pos;
  PVector vel;
  int taller = 0;
  boolean InCombat = false;
  boolean TargetsInSight = false;
  boolean EswordTargetted = false;
}

class Fsword extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (MediumSpeed, 0);
  int life = SwordHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKSword.resize(50, 50);
    image(BKSword, 0, 0);
    popMatrix();
  }

  void swordMovement() {
    taller++;
    //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
    if (InCombat == true && taller > VeryFastAttackSpeed) {
      vel.set( 0, 0);
      taller = 0;
      Target.life = Target.life -SwordDamage;
    } //If above is false, FriendlyUnit will move towards enemy base
    else if (InCombat == false && TargetsInSight == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(MediumSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
      Target.pos.x = EnemyBase.pos.x;
      Target.pos.y = EnemyBase.pos.y;
      Target.life = EnemyBase.life;
      TargetSize = BaseSize;
    } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
    if (dist(pos.x, pos.y, Target.pos.x, Target.pos.y)<=TargetSize) {
      InCombat = true;
    }
  }
}

class Fking extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (FastSpeed, 0);
  int life = KingHP;

  void kingMovement() {
    taller++;
    //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
    if (InCombat == true && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize && taller > SlowAttackSpeed) {
      vel.set( 0, 0);
      taller = 0;
      EnemyBase.life = EnemyBase.life -KingDamage;
    } //If above is false, FriendlyUnit will move towards enemy base
    else if (InCombat == false && EswordTargetted == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(FastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
    if (EswordTargetted == false && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
      InCombat = true;
    } 
    //For loop that checks for Eswords
    for (Esword esword : Eswords) { 
      //Checks if King is close to Eswords and changes Pvector accordingly
      if (InCombat == false && EswordTargetted == false && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=200) {
        println("Target Aquired!");
        PVector vel = PVector.sub(esword.pos, pos);
        vel.setMag(FastSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
        EswordTargetted = true;
      }
      if (InCombat == false && EswordTargetted == true && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=UnitSize && taller > SlowAttackSpeed) {
        vel.set( 0, 0);
        taller = 0;
        esword.life = esword.life -KingDamage;
        println("King Engaging ESword!");
      } else {
        InCombat = false;
        EswordTargetted = false;
      }
      if (esword.life == 0) {
         Eswords.remove(this);
      }
    }
  }

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKKing.resize(50, 50);
    image(BKKing, 0, 0);
    popMatrix();
  }
}

class Farcher extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (SlowSpeed, 0);
  int life = ArcherHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKBow.resize(50, 50);
    image(BKBow, 0, 0);
    popMatrix();
  }

  void archerMovement() {
    taller++;
    //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
    if (InCombat == true && taller > MediumAttackSpeed) {
      vel.set( 0, 0);
      taller = 0;
      EnemyBase.life = EnemyBase.life -ArcherDamage;
    } //If above is false, FriendlyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(SlowSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize+BowRange) {
      InCombat = true;
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

class Fhorseman extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (VeryFastSpeed, 0);
  int life = HorseManHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKHorseman.resize(50, 50);
    image(BKHorseman, 0, 0);
    popMatrix();
  }

  void horsemanMovement() {
    taller++;
    //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
    if (InCombat == true && taller > FastAttackSpeed) {
      vel.set(0, 0);      
      taller = 0;
      EnemyBase.life = EnemyBase.life -HorseManDamage;
    } //If above is false, FriendlyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(VeryFastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
      InCombat = true;
    }
  }
}

/*
class arrow extends FriendlyUnit {
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
 }*/
