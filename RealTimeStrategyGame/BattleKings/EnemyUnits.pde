//Class EnemyUnit includes the different EnemyUnits and their interactions
class EnemyUnit {
  PVector pos;
  PVector vel;
  int taller = 0;
  boolean FbaseTargetted = false;
  boolean FswordTargetted = false;
  boolean FkingTargetted = false;
  boolean FhorseTargetted = false;
  boolean FarcherTargetted = false;
  boolean UnitIsAlive = false;
}

class Esword extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (MediumSpeed, 0);
  int life = SwordHP;

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKSword.resize(50, 50);
      image(BKSword, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = DeadPosX;
      pos.y = DeadPosY;
      UnitIsAlive = false;
    }
  }

  void EswordMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (FbaseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > VeryFastAttackSpeed) {
          taller = 0;
          FriendBase.life = FriendBase.life -SwordDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted) {
        PVector vel = PVector.sub(FriendBase.pos, pos);
        vel.setMag(MediumSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, FbaseTargetted becomes true and FriendlyUnit damages the base
      if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        FbaseTargetted = true;
      } 
      //For loop that checks for Fswords
      for (Fsword fsword : Fswords) { 
        //Checks if King is close to Fswords and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=200) {
          PVector vel = PVector.sub(fsword.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FswordTargetted = true;
        }
        if (!FbaseTargetted && FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            fsword.life = fsword.life -SwordDamage;
          }
        } else {
          FswordTargetted = false;
        }
      }
      //For loop that checks for Fkings
      for (Fking fking : Fkings) { 
        //Checks if King is close to Fkings and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=200) {
          PVector vel = PVector.sub(fking.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FkingTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            fking.life = fking.life -SwordDamage;
          }
        } else {
          FkingTargetted = false;
        }
      }
      //For loop that checks for Farchers
      for (Farcher farcher : Farchers) { 
        //Checks if King is close to Farchers and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=200) {
          PVector vel = PVector.sub(farcher.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FarcherTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            farcher.life = farcher.life -SwordDamage;
          }
        } else {
          FarcherTargetted = false;
        }
      }
      //For loop that checks for Fhorseman
      for (Fhorseman fhorseman : Fhorsemen) { 
        //Checks if King is close to Fhorseman and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=200) {
          PVector vel = PVector.sub(fhorseman.pos, pos);
          vel.setMag(MediumSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FhorseTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > VeryFastAttackSpeed) {
            taller = 0;
            fhorseman.life = fhorseman.life -SwordDamage;
          }
        } else {
          FhorseTargetted = false;
        }
      }
    }
  }
}

class Eking extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (FastSpeed, 0);
  int life = KingHP;

  void EkingMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (FbaseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > SlowAttackSpeed) {
          taller = 0;
          FriendBase.life = FriendBase.life -KingDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted) {
        PVector vel = PVector.sub(FriendBase.pos, pos);
        vel.setMag(FastSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, FbaseTargetted becomes true and FriendlyUnit damages the base
      if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        FbaseTargetted = true;
      } 
      //For loop that checks for Fswords
      for (Fsword fsword : Fswords) { 
        //Checks if King is close to Fswords and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=200) {
          PVector vel = PVector.sub(fsword.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FswordTargetted = true;
        }
        if (!FbaseTargetted && FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            fsword.life = fsword.life -KingDamage;
          }
        } else {
          FswordTargetted = false;
        }
      }
      //For loop that checks for Fkings
      for (Fking fking : Fkings) { 
        //Checks if King is close to Fkings and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=200) {
          PVector vel = PVector.sub(fking.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FkingTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            fking.life = fking.life -KingDamage;
          }
        } else {
          FkingTargetted = false;
        }
      }
      //For loop that checks for Farchers
      for (Farcher farcher : Farchers) { 
        //Checks if King is close to Farchers and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=200) {
          PVector vel = PVector.sub(farcher.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FarcherTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            farcher.life = farcher.life -KingDamage;
          }
        } else {
          FarcherTargetted = false;
        }
      }
      //For loop that checks for Fhorseman
      for (Fhorseman fhorseman : Fhorsemen) { 
        //Checks if King is close to Fhorseman and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=200) {
          PVector vel = PVector.sub(fhorseman.pos, pos);
          vel.setMag(FastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FhorseTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            fhorseman.life = fhorseman.life -KingDamage;
          }
        } else {
          FhorseTargetted = false;
        }
      }
    }
  }

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKKing.resize(50, 50);
      image(BKKing, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = DeadPosX;
      pos.y = DeadPosY;
      UnitIsAlive = false;
    }
  }
}

class Earcher extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (SlowSpeed, 0);
  int life = ArcherHP;

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKBow.resize(50, 50);
      image(BKBow, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = DeadPosX;
      pos.y = DeadPosY;
      UnitIsAlive = false;
    }
  }

  void EarcherMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (FbaseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize+BowRange) {
        vel.set(0, 0);
        if (taller > SlowAttackSpeed) {
          taller = 0;
          FriendBase.life = FriendBase.life -ArcherDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted) {
        PVector vel = PVector.sub(FriendBase.pos, pos);
        vel.setMag(SlowSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, FbaseTargetted becomes true and FriendlyUnit damages the base
      if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize+BowRange) {
        FbaseTargetted = true;
      } 
      //For loop that checks for Fswords
      for (Fsword fsword : Fswords) { 
        //Checks if King is close to Fswords and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=200) {
          PVector vel = PVector.sub(fsword.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FswordTargetted = true;
        }
        if (!FbaseTargetted && FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            fsword.life = fsword.life -ArcherDamage;
          }
        } else {
          FswordTargetted = false;
        }
      }
      //For loop that checks for Fkings
      for (Fking fking : Fkings) { 
        //Checks if King is close to Fkings and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=200) {
          PVector vel = PVector.sub(fking.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FkingTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            fking.life = fking.life -ArcherDamage;
          }
        } else {
          FkingTargetted = false;
        }
      }
      //For loop that checks for Farchers
      for (Farcher farcher : Farchers) { 
        //Checks if King is close to Farchers and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=200) {
          PVector vel = PVector.sub(farcher.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FarcherTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            farcher.life = farcher.life -ArcherDamage;
          }
        } else {
          FarcherTargetted = false;
        }
      }
      //For loop that checks for Fhorseman
      for (Fhorseman fhorseman : Fhorsemen) { 
        //Checks if King is close to Fhorseman and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=200) {
          PVector vel = PVector.sub(fhorseman.pos, pos);
          vel.setMag(SlowSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FhorseTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=UnitSize+BowRange) {
          vel.set( 0, 0);
          if (taller > SlowAttackSpeed) {
            taller = 0;
            fhorseman.life = fhorseman.life -ArcherDamage;
          }
        } else {
          FhorseTargetted = false;
        }
      }
    }
  }
}

class Ehorseman extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (VeryFastSpeed, 0);
  int life = HorseManHP;

  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKHorseman.resize(50, 50);
      image(BKHorseman, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    } else if (life < 1) {
      pos.x = DeadPosX;
      pos.y = DeadPosY;
      UnitIsAlive = false;
    }
  }

  void EhorsemanMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (FbaseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > FastAttackSpeed) {
          taller = 0;
          FriendBase.life = FriendBase.life -HorseManDamage;
        }
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted) {
        PVector vel = PVector.sub(FriendBase.pos, pos);
        vel.setMag(VeryFastSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, FbaseTargetted becomes true and FriendlyUnit damages the base
      if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        FbaseTargetted = true;
      } 
      //For loop that checks for Fswords
      for (Fsword fsword : Fswords) { 
        //Checks if King is close to Fswords and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=200) {
          PVector vel = PVector.sub(fsword.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FswordTargetted = true;
        }
        if (!FbaseTargetted && FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            fsword.life = fsword.life -HorseManDamage;
          }
        } else {
          FswordTargetted = false;
        }
      }
      //For loop that checks for Fkings
      for (Fking fking : Fkings) { 
        //Checks if King is close to Fkings and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=200) {
          PVector vel = PVector.sub(fking.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FkingTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            fking.life = fking.life -HorseManDamage;
          }
        } else {
          FkingTargetted = false;
        }
      }
      //For loop that checks for Farchers
      for (Farcher farcher : Farchers) { 
        //Checks if King is close to Farchers and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=200) {
          PVector vel = PVector.sub(farcher.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FarcherTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            farcher.life = farcher.life -HorseManDamage;
          }
        } else {
          FarcherTargetted = false;
        }
      }
      //For loop that checks for Fhorseman
      for (Fhorseman fhorseman : Fhorsemen) { 
        //Checks if King is close to Fhorseman and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=200) {
          PVector vel = PVector.sub(fhorseman.pos, pos);
          vel.setMag(VeryFastSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FhorseTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=UnitSize) {
          vel.set( 0, 0);
          if (taller > FastAttackSpeed) {
            taller = 0;
            fhorseman.life = fhorseman.life -HorseManDamage;
          }
        } else {
          FhorseTargetted = false;
        }
      }
    }
  }
}
