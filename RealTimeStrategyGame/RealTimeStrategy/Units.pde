class sword {
  PVector swordPos;
  PVector swordVel;
  
    void update() {
    pushMatrix();
    translate(swordPos.x, swordPos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void swordMovement() {

  }
}

class king {
  PVector kingPos;
  PVector kingVel;
  
    void update() {
    pushMatrix();
    translate(kingPos.x, kingPos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void kingMovement() {

  }
}

class archer {
  PVector archerPos;
  PVector archerVel;
  
    void update() {
    pushMatrix();
    translate(archerPos.x, archerPos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void archerMovement() {

  }
}
class horse {
  PVector horsePos;
  PVector horseVel;
  
    void update() {
    pushMatrix();
    translate(horsePos.x, horsePos.y);
    rectMode(CENTER);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

  void horseMovement() {

  }
}
