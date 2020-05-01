//Class FriendlyUnit includes the different FriendlyUnits and their interactions
class FriendlyUnit {
  int life = 20;
  int taller = 0;
  int UnitRange = MeleeRange;
  PImage UnitImage = BKSword;
  boolean EbaseTargetted = false;
  boolean EswordTargetted = false;
  boolean EkingTargetted = false;
  boolean EhorseTargetted = false;
  boolean EarcherTargetted = false;
  boolean UnitIsAlive = false;
  PVector ETempTarget = new PVector (EnemyBase.pos.x, EnemyBase.pos.y);
  int UnitDamage;
  int AttackSpeed;
  int MovementSpeed;
  PVector pos = new PVector (DeployX, DeployY);
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
      rotate(atan2(ETempTarget.y - pos.y, ETempTarget.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
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
  void Movement() {
    if (UnitIsAlive) {
      taller++;
      //Checks if Unit is in combat, if true, Unit attacks target and stops it from moving
      if (EbaseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize) {
        vel.set(0, 0);
        if (taller > AttackSpeed) {
          taller = 0;
          EnemyBase.life = EnemyBase.life -UnitDamage;
        }
      } //If above is false, Unit will move towards enemy base
      else if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted) {
        ETempTarget = EnemyBase.pos;
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(MovementSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If Unit is close to base it becomes its target
      if (!EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=BaseSize + UnitRange) {
        EbaseTargetted = true;
      } 
      //For loop that checks for Eswords
      for (Esword esword : Eswords) { 
        //Checks if Unit is close to Eswords and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=DetectionRange) {
          ETempTarget = esword.pos;
          PVector vel = PVector.sub(esword.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EswordTargetted = true;
        }
        if (!EbaseTargetted && EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, esword.pos.x, esword.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            esword.life = esword.life -UnitDamage;
          }
        } else {
          EswordTargetted = false;
        }
      }
      //For loop that checks for Ekings
      for (Eking eking : Ekings) { 
        //Checks if Unit is close to Ekings and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=DetectionRange) {
          ETempTarget = eking.pos;
          PVector vel = PVector.sub(eking.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EkingTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, eking.pos.x, eking.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            eking.life = eking.life -UnitDamage;
          }
        } else {
          EkingTargetted = false;
        }
      }
      //For loop that checks for Earchers
      for (Earcher earcher : Earchers) { 
        //Checks if Unit is close to Earchers and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=DetectionRange) {
          ETempTarget = earcher.pos;
          PVector vel = PVector.sub(earcher.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EarcherTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, earcher.pos.x, earcher.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            earcher.life = earcher.life -UnitDamage;
          }
        } else {
          EarcherTargetted = false;
        }
      }
      //For loop that checks for Ehorseman
      for (Ehorseman ehorseman : Ehorsemen) { 
        //Checks if Unit is close to Ehorseman and changes Pvector accordingly
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && !EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=DetectionRange) {
          ETempTarget = ehorseman.pos;
          PVector vel = PVector.sub(ehorseman.pos, pos);
          vel.setMag(MovementSpeed);
          pos.x = constrain(pos.x, 0, width);
          pos.y = constrain(pos.y, 0, height);
          pos.add(vel);
          EhorseTargetted = true;
        }
        if (!EbaseTargetted && !EswordTargetted && !EkingTargetted && !EarcherTargetted && EhorseTargetted && dist(pos.x, pos.y, ehorseman.pos.x, ehorseman.pos.y)<=UnitSize + UnitRange) {
          vel.set( 0, 0);
          if (taller > AttackSpeed) {
            taller = 0;
            ehorseman.life = ehorseman.life -UnitDamage;
          }
        } else {
          EhorseTargetted = false;
        }
      }
    }
  }
}

//Class Friendly Sword
class Fsword extends FriendlyUnit {
  Fsword(int SwordHP, PImage BKSword, int SwordDamage, int VeryFastAttackSpeed, int MediumSpeed) {
    this.life = SwordHP;
    this.UnitImage = BKSword;
    this.UnitDamage = SwordDamage;
    this.AttackSpeed = VeryFastAttackSpeed;
    this.MovementSpeed = MediumSpeed;
  }
}

//Class Friendly King
class Fking extends FriendlyUnit {
  Fking(int KingHP, PImage BKKing, int KingDamage, int SlowAttackSpeed, int FastSpeed) {
    this.life = KingHP;
    this.UnitImage = BKKing;
    this.UnitDamage = KingDamage;
    this.AttackSpeed = SlowAttackSpeed;
    this.MovementSpeed = FastSpeed;
  }
}

//Class Friendly Archer
class Farcher extends FriendlyUnit {
  Farcher(int ArcherHP, PImage BKBow, int ArcherDamage, int SlowAttackSpeed, int SlowSpeed, int BowRange) {
    this.life = ArcherHP;
    this.UnitImage = BKBow;
    this.UnitDamage = ArcherDamage;
    this.AttackSpeed = SlowAttackSpeed;
    this.MovementSpeed = SlowSpeed;
    this.UnitRange = BowRange;
  }
}

//Class Friendly Horseman
class Fhorseman extends FriendlyUnit {
  Fhorseman(int HorseManHP, PImage BKHorseman, int HorseManDamage, int FastAttackSpeed, int VeryFastSpeed) {
    this.life = HorseManHP;
    this.UnitImage = BKHorseman;
    this.UnitDamage = HorseManDamage;
    this.AttackSpeed = FastAttackSpeed;
    this.MovementSpeed = VeryFastSpeed;
  }
}
