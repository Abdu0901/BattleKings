//Class FriendlyUnit includes the different FriendlyUnits and their interactions
class FriendlyUnit {
  PVector pos;
  PVector vel;
  int taller = 0;
  boolean EbaseTargetted = false;
  boolean EswordTargetted = false;
  boolean EkingTargetted = false;
  boolean EhorseTargetted = false;
  boolean EarcherTargetted = false;
  boolean UnitIsAlive = false;
}

class Fsword extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (MediumSpeed, 0);
  int life = SwordHP;

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKSword.resize(50, 50);
      image(BKSword, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = -30;
      pos.y = -30;
      UnitIsAlive = false;
    }
  }

  void swordMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (EbaseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > VeryFastAttackSpeed) {
          taller = 0;
          EnemyBase.life = EnemyBase.life -SwordDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted) {
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(MediumSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, EbaseTargetted becomes true and FriendlyUnit damages the base
      if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        EbaseTargetted = true;
      } 
      //For loop that checks for Eswords
      for (Esword esword : Eswords) { 
        //Checks if King is close to Eswords and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=200) {
          PVector vel = PVector.sub(esword.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EswordTargetted = true;
        }
        if (!EbaseTargetted && EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            esword.life = esword.life -SwordDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ekings
      for (Eking eking : Ekings) { 
        //Checks if King is close to Ekings and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=200) {
          PVector vel = PVector.sub(eking.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EkingTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            eking.life = eking.life -SwordDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Earchers
      for (Earcher earcher : Earchers) { 
        //Checks if King is close to Earchers and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=200) {
          PVector vel = PVector.sub(earcher.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EarcherTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            earcher.life = earcher.life -SwordDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ehorseman
      for (Ehorseman ehorseman : Ehorsemen) { 
        //Checks if King is close to Ehorseman and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=200) {
          PVector vel = PVector.sub(ehorseman.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EhorseTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            ehorseman.life = ehorseman.life -SwordDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
    }
  }
}

class Fking extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (FastSpeed, 0);
  int life = KingHP;

  void kingMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (EbaseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > SlowAttackSpeed) {
          taller = 0;
          EnemyBase.life = EnemyBase.life -KingDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted) {
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(FastSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, EbaseTargetted becomes true and FriendlyUnit damages the base
      if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        EbaseTargetted = true;
      } 
      //For loop that checks for Eswords
      for (Esword esword : Eswords) { 
        //Checks if King is close to Eswords and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=200) {
          PVector vel = PVector.sub(esword.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EswordTargetted = true;
        }
        if (!EbaseTargetted && EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            esword.life = esword.life -KingDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ekings
      for (Eking eking : Ekings) { 
        //Checks if King is close to Ekings and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=200) {
          PVector vel = PVector.sub(eking.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EkingTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            eking.life = eking.life -KingDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Earchers
      for (Earcher earcher : Earchers) { 
        //Checks if King is close to Earchers and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=200) {
          PVector vel = PVector.sub(earcher.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EarcherTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            earcher.life = earcher.life -KingDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ehorseman
      for (Ehorseman ehorseman : Ehorsemen) { 
        //Checks if King is close to Ehorseman and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=200) {
          PVector vel = PVector.sub(ehorseman.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EhorseTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            ehorseman.life = ehorseman.life -KingDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
    }
  }

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKKing.resize(50, 50);
      image(BKKing, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = -30;
      pos.y = -30;
      UnitIsAlive = false;
    }
  }
}

class Farcher extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (SlowSpeed, 0);
  int life = ArcherHP;

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKBow.resize(50, 50);
      image(BKBow, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = -30;
      pos.y = -30;
      UnitIsAlive = false;
    }
  }

  void archerMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (EbaseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize+BowRange) {
        vel.set(0, 0);
        if (taller > SlowAttackSpeed) {
          taller = 0;
          EnemyBase.life = EnemyBase.life -ArcherDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted) {
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(SlowSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, EbaseTargetted becomes true and FriendlyUnit damages the base
      if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize+BowRange) {
        EbaseTargetted = true;
      } 
      //For loop that checks for Eswords
      for (Esword esword : Eswords) { 
        //Checks if King is close to Eswords and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=200) {
          PVector vel = PVector.sub(esword.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EswordTargetted = true;
        }
        if (!EbaseTargetted && EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            esword.life = esword.life -ArcherDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ekings
      for (Eking eking : Ekings) { 
        //Checks if King is close to Ekings and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=200) {
          PVector vel = PVector.sub(eking.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EkingTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            eking.life = eking.life -ArcherDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Earchers
      for (Earcher earcher : Earchers) { 
        //Checks if King is close to Earchers and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=200) {
          PVector vel = PVector.sub(earcher.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EarcherTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            earcher.life = earcher.life -ArcherDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ehorseman
      for (Ehorseman ehorseman : Ehorsemen) { 
        //Checks if King is close to Ehorseman and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=200) {
          PVector vel = PVector.sub(ehorseman.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EhorseTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            ehorseman.life = ehorseman.life -ArcherDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
    }
  }
}

class Fhorseman extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (VeryFastSpeed, 0);
  int life = HorseManHP;

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKHorseman.resize(50, 50);
      image(BKHorseman, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = -30;
      pos.y = -30;
      UnitIsAlive = false;
    }
  }

  void horsemanMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (EbaseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > FastAttackSpeed) {
          taller = 0;
          EnemyBase.life = EnemyBase.life -HorseManDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted) {
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(VeryFastSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, EbaseTargetted becomes true and FriendlyUnit damages the base
      if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        EbaseTargetted = true;
      } 
      //For loop that checks for Eswords
      for (Esword esword : Eswords) { 
        //Checks if King is close to Eswords and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=200) {
          PVector vel = PVector.sub(esword.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EswordTargetted = true;
        }
        if (!EbaseTargetted && EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            esword.life = esword.life -HorseManDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ekings
      for (Eking eking : Ekings) { 
        //Checks if King is close to Ekings and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=200) {
          PVector vel = PVector.sub(eking.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EkingTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            eking.life = eking.life -HorseManDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Earchers
      for (Earcher earcher : Earchers) { 
        //Checks if King is close to Earchers and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=200) {
          PVector vel = PVector.sub(earcher.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EarcherTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            earcher.life = earcher.life -HorseManDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
      //For loop that checks for Ehorseman
      for (Ehorseman ehorseman : Ehorsemen) { 
        //Checks if King is close to Ehorseman and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=200) {
          PVector vel = PVector.sub(ehorseman.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EhorseTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            ehorseman.life = ehorseman.life -HorseManDamage;
          }
        } else {
          EbaseTargetted = false;
          EswordTargetted = false;
          EkingTargetted = false;
          EarcherTargetted = false;
          EhorseTargetted = false;
        }
      }
    }
  }
}
