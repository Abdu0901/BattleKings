Button DeploySword;
Button DeployKing;
Button DeployHorseman;
Button DeployArcher;
enemyBase EnemyBase;
base FriendBase;

//Where all the fun is =]
void GameScreen() {
  background (BKBackground);

  //Text that shows the current amount of Gold the player has
  fill(255);
  textSize(30);
  textAlign(LEFT, CENTER);
  text("Gold: " + Gold, 25, 25);

  //Text that shows the current amount of Gold the player has
  fill(255);
  textSize(30);
  textAlign(LEFT, CENTER);
  text("Selected unit: " + SelectedUnitString, 25, 60);

  GoldGenerator();
  AddUnits();
  FriendBase.update();
  EnemyBase.update();
  SelectUnit();

  //Checks if any of the bases has lost all HP
  if (EnemyBase.life <= 0) {
    Screen = 2;
  } else if (FriendBase.life <= 0) {
    Screen = 2;
  }
}

//Resources used to buy troops
int Gold;
//Timer that is used to generate gold
int Timer = 0;

//Counter that generates gold
void GoldGenerator() {
  //Timer that generates gold for the player
  Timer = Timer +1;
  if (Timer == 100) {
    Gold = Gold +20;
    println("Current amount of Gold: " + Gold);
    Timer = 0;
  }
}

//The buttons which deploys units
void AddUnits() {
  sword s;
  king k;
  horseman h;
  archer a;

  //Deploy Swords button
  DeploySword = new Button(175, 675, 350, 50, strokeColor, "[1] Sword(20)", 35, 0, bRed, bGreen, bBlue);
  DeploySword.ButtonUpdate();
  if (SwordDP == true && Gold > 19 && mousePressed == true) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    swords.add(new sword());
    SelectedUnitNum = 0;
  }
  for (int i2 = swords.size()-1; i2>=0; i2--) {
    s = swords.get(i2);
    s.update();
    s.swordMovement();
  }

  //Deploy Kings button
  DeployKing = new Button(525, 675, 350, 50, strokeColor, "[2] King(20)", 35, 0, bRed, bGreen, bBlue);
  DeployKing.ButtonUpdate();
  if (KingDP == true && Gold > 19 && mousePressed == true) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    kings.add(new king());
    SelectedUnitNum = 0;
  }
  for (int i3 = kings.size()-1; i3>=0; i3--) {
    k = kings.get(i3);
    k.update();
    k.kingMovement();
  }

  //Deploy Horsemen button
  DeployHorseman = new Button(875, 675, 350, 50, strokeColor, "[3] Horseman(20)", 35, 0, bRed, bGreen, bBlue);
  DeployHorseman.ButtonUpdate();
  if (HorsemanDP == true && Gold > 19 && mousePressed == true) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    horsemen.add(new horseman());
    SelectedUnitNum = 0;
  }
  for (int i4 = horsemen.size()-1; i4>=0; i4--) {
    h = horsemen.get(i4);
    h.update();
    h.horsemanMovement();
  }

  //Deploy Archers button
  DeployArcher = new Button(1225, 675, 350, 50, strokeColor, "[4] Archer(20)", 35, 0, bRed, bGreen, bBlue);
  DeployArcher.ButtonUpdate();
  if (BowDP == true && Gold > 19 && mousePressed == true) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    archers.add(new archer());
    SelectedUnitNum = 0;
  }
  for (int i5 = archers.size()-1; i5>=0; i5--) {
    a = archers.get(i5);
    a.update();
    a.archerMovement();
  }
}
