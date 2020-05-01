//Class EnemyUnit includes the different EnemyUnits and their interactions
class EnemyUnit {
  int life = 20;
  int taller = 0;
  int UnitRange = MeleeRange;
  PImage UnitImage = BKSword;
  boolean FbaseTargetted = false;
  boolean FswordTargetted = false;
  boolean FkingTargetted = false;
  boolean FhorseTargetted = false;
  boolean FarcherTargetted = false;
  boolean UnitIsAlive = false;
  PVector FTempTarget = new PVector (FriendBase.pos.x, FriendBase.pos.y);
  int UnitDamage;
  int AttackSpeed;
  int MovementSpeed;
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (MovementSpeed, 0);
  
  //Function to draw the unit and its health on screen
  void update() {
    if (life > 1) {
      UnitIsAlive = true;
      pushMatrix();
      translate(pos.x, pos.y);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      rotate(atan2(pos.y - FTempTarget.y, pos.x - FTempTarget.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      UnitImage.resize(50, 50);
      image(UnitImage, 0, 0);
      popMatrix();
    } else if (life < 1) {
      pos.x = DeadPosX;
      pos.y = DeadPosY;
      UnitIsAlive = false;
    }
  }
  
  //Function that controls the Unit's movement and allows it to hurt the enemy units and base
  void EMovement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if Unit is in combat, if true, Unit attacks target and stops it from moving
      if (FbaseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > AttackSpeed) {
          taller = 0;
          FriendBase.life = FriendBase.life -UnitDamage;
        }
      } //If above is false, Unit will move towards enemy base
      else if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted) {
        FTempTarget = FriendBase.pos;
        PVector vel = PVector.sub(FriendBase.pos, pos);
        vel.setMag(MovementSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If Unit is close to base it becomes its target
      if (!FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize + UnitRange) {
        FbaseTargetted = true;
      } 
      //For loop that checks for Eswords
      for (Fsword fsword : Fswords) { 
        //Checks if Unit is close to Eswords and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=DetectionRange) {
          FTempTarget = fsword.pos;
          PVector vel = PVector.sub(fsword.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FswordTargetted = true;
        }
        if (!FbaseTargetted && FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fsword.pos.x, fsword.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            fsword.life = fsword.life -UnitDamage;
          }
        } else {
          FswordTargetted = false;
        }
      }
      //For loop that checks for Ekings
      for (Fking fking : Fkings) { 
        //Checks if Unit is close to Ekings and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=DetectionRange) {
          FTempTarget = fking.pos;
          PVector vel = PVector.sub(fking.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FkingTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fking.pos.x, fking.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            fking.life = fking.life -UnitDamage;
          }
        } else {
          FkingTargetted = false;
        }
      }
      //For loop that checks for Earchers
      for (Farcher farcher : Farchers) { 
        //Checks if Unit is close to Earchers and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=DetectionRange) {
          FTempTarget = farcher.pos;
          PVector vel = PVector.sub(farcher.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FarcherTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, farcher.pos.x, farcher.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            farcher.life = farcher.life -UnitDamage;
          }
        } else {
          FarcherTargetted = false;
        }
      }
      //For loop that checks for Ehorseman
      for (Fhorseman fhorseman : Fhorsemen) { 
        //Checks if Unit is close to Ehorseman and changes Pvector accordingly
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && !FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=DetectionRange) {
          FTempTarget = fhorseman.pos;
          PVector vel = PVector.sub(fhorseman.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          FhorseTargetted = true;
        }
        if (!FbaseTargetted && !FswordTargetted && !FkingTargetted && !FarcherTargetted && FhorseTargetted && dist(pos.x, pos.y, fhorseman.pos.x, fhorseman.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            fhorseman.life = fhorseman.life -UnitDamage;
          }
        } else {
          FhorseTargetted = false;
        }
      }
    }
  }
}

//Class Enemy Sword
class Esword extends EnemyUnit {
  Esword(int SwordHP, PImage BKESword, int SwordDamage, int VeryFastAttackSpeed, int MediumSpeed) {
    this.life = SwordHP;
    this.UnitImage = BKESword;
    this.UnitDamage = SwordDamage;
    this.AttackSpeed = VeryFastAttackSpeed;
    this.MovementSpeed = MediumSpeed;
  }
}

//Class Enemy King
class Eking extends EnemyUnit {
  Eking(int KingHP, PImage BKEKing, int KingDamage, int SlowAttackSpeed, int FastSpeed) {
    this.life = KingHP;
    this.UnitImage = BKEKing;
    this.UnitDamage = KingDamage;
    this.AttackSpeed = SlowAttackSpeed;
    this.MovementSpeed = FastSpeed;
  }
}

//Class Enemy Archer
class Earcher extends EnemyUnit {
  Earcher(int ArcherHP, PImage BKEBow, int ArcherDamage, int SlowAttackSpeed, int SlowSpeed, int BowRange) {
    this.life = ArcherHP;
    this.UnitImage = BKEBow;
    this.UnitDamage = ArcherDamage;
    this.AttackSpeed = SlowAttackSpeed;
    this.MovementSpeed = SlowSpeed;
    this.UnitRange = BowRange;
  }
}

//Class Enemy Horseman
class Ehorseman extends EnemyUnit {
  Ehorseman(int HorseManHP, PImage BKEHorseman, int HorseManDamage, int FastAttackSpeed, int VeryFastSpeed) {
    this.life = HorseManHP;
    this.UnitImage = BKEHorseman;
    this.UnitDamage = HorseManDamage;
    this.AttackSpeed = FastAttackSpeed;
    this.MovementSpeed = VeryFastSpeed;
  }
}
