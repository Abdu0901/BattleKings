Button DeploySword;
Button DeployKing;
Button DeployHorseman;
Button DeployArcher;
Button ConfirmGameStart;
enemyBase EnemyBase;
base FriendBase;

boolean GameStartConfirmed = true;
boolean RunOnce = true;

void GameConfirmationScreen() {
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;
  //Shows the confirmation screen which explains a couple of important things 
  if (GameStartConfirmed == false) {
    //Makes the whole screen darker
    fill(150, 150, 150, 2);
    rect(width/2, height/2, width, height);
    //Highlights the player's arena
    fill(0, 255, 0, 1);
    rect(350, 0, width/2, 1300);

    fill(255);
    textSize(30);
    textAlign(LEFT, CENTER);
    text("Gold: " + Gold, 25, 25);
    text("Selected unit: " + SelectedUnitString, 25, 60);

    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    //Text of the information
    text("1. Amount of gold and your current selected unit is displayed here", 150, 150, 200, 200);
    text("3. To Deploy a unit, press anywhere on your half of the arena. (Marked with green)", width/2, height/2, 200, 200);
    text("2. Select a unit by pressing the corresponding Number Key next to a unit's name in [ ]. The numbers in () indicate cost of the Unit", 30, 620);

    //ConfirmGameStart Button
    ConfirmGameStart = new Button(1250, 70, 250, 100, strokeColor, "Got it!", 80, 0, bRed, bGreen, bBlue);
    ConfirmGameStart.ButtonUpdate();
    if (ConfirmGameStart.isButtonPressed(mouseX, mouseY, mouseJustPressed, ConfirmGameStart) == true) {
      GameStartConfirmed = true;
    }
  }

  //If confirm screen is clicked Game starts
  if (GameStartConfirmed == true) {
    GameScreen();
  }
}


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
  FriendBase.update();
  EnemyBase.update();
  SelectUnit();
  AddUnits();

  //Checks if any of the bases has lost all HP
  if (EnemyBase.life <= 0) {
    BKWinTeam = BKBlueWin;
    Screen = 2;
  } else if (FriendBase.life <= 0) {
    BKWinTeam = BKRedWin;
    Screen = 2;
  }
  //Runs the game screen once to load game elements and then shows confirmation screen
  if (RunOnce == true) {
    GameStartConfirmed = false;
    RunOnce = false;
  }
}

//Resources used to buy troops
int Gold;
int EGold;
//Timer that is used to generate gold
int Timer = 0;

//Counter that generates gold
void GoldGenerator() {
  //Timer that generates gold for the player
  Timer = Timer +1;
  if (Timer == 75) {
    Gold = Gold +20;
    EGold = EGold +20;
    Timer = 0;
  }
}

//Variables used in the enemy selecting unit process
int UnitCount = 4;
int ESelectedUnit = 0;
boolean EUnitSelected = false;
String ChosenUnit;
String ChosenUnits;
int ChosenUnitCost;
int EDeployLocationX;
int EDeployLocationY;

//The buttons which deploys units
void AddUnits() {
  Fsword s;
  Fking k;
  Fhorseman h;
  Farcher a;

  Esword es;
  Eking ek;
  Ehorseman eh;
  Earcher ea;

  //Deploy Swords button
  DeploySword = new Button(175, 675, 350, 50, strokeColor, "[1] Sword(" + SwordCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeploySword.ButtonUpdate();
  if (SwordDP == true && Gold > SwordCost-1 && mousePressed == true) {
    Gold = Gold -SwordCost;
    println("Current amount of Gold: " + Gold);
    Fswords.add(new Fsword(SwordHP, BKSword, SwordDamage, VeryFastAttackSpeed, MediumSpeed));
    SelectedUnitNum = 0;
  }
  for (int i2 = Fswords.size()-1; i2>=0; i2--) {
    s = Fswords.get(i2);
    s.update();
    s.Movement();
  }

  //Deploy Kings button
  DeployKing = new Button(525, 675, 350, 50, strokeColor, "[2] King(" + KingCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeployKing.ButtonUpdate();
  if (KingDP == true && Gold > KingCost-1 && mousePressed == true) {
    Gold = Gold -KingCost;
    println("Current amount of Gold: " + Gold);
    Fkings.add(new Fking(KingHP, BKKing, KingDamage, SlowAttackSpeed, FastSpeed));
    SelectedUnitNum = 0;
  }
  for (int i3 = Fkings.size()-1; i3>=0; i3--) {
    k = Fkings.get(i3);
    k.update();
    k.Movement();
  }

  //Deploy Horsemen button
  DeployHorseman = new Button(875, 675, 350, 50, strokeColor, "[3] Horseman(" + HorseManCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeployHorseman.ButtonUpdate();
  if (HorsemanDP == true && Gold > HorseManCost-1 && mousePressed == true) {
    Gold = Gold -HorseManCost;
    println("Current amount of Gold: " + Gold);
    Fhorsemen.add(new Fhorseman(HorseManHP, BKHorseman, HorseManDamage, FastAttackSpeed, VeryFastSpeed));
    SelectedUnitNum = 0;
  }
  for (int i4 = Fhorsemen.size()-1; i4>=0; i4--) {
    h = Fhorsemen.get(i4);
    h.update();
    h.Movement();
  }

  //Deploy Archers button
  DeployArcher = new Button(1225, 675, 350, 50, strokeColor, "[4] Archer(" + ArcherCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeployArcher.ButtonUpdate();
  if (BowDP == true && Gold > ArcherCost-1 && mousePressed == true) {
    Gold = Gold -ArcherCost;
    println("Current amount of Gold: " + Gold);
    Farchers.add(new Farcher(ArcherHP, BKBow, ArcherDamage, SlowAttackSpeed, SlowSpeed, BowRange));
    SelectedUnitNum = 0;
  }
  for (int i5 = Farchers.size()-1; i5>=0; i5--) {
    a = Farchers.get(i5);
    a.update();
    a.Movement();
  }  

  if (EUnitSelected == false) {
    ESelectedUnit = (int)random(0, UnitCount);
    EDeployLocationX = (int)random(width/2, width);
    EDeployLocationY = (int)random(0, height-75);
    switch(ESelectedUnit) {
    case 0:
      EUnitSelected = true;
      ChosenUnitCost = SwordCost;
      break;
    case 1:
      EUnitSelected = true;
      ChosenUnitCost = KingCost;
      break;
    case 2:
      EUnitSelected = true;
      ChosenUnitCost = HorseManCost;
      break;
    case 3:
      EUnitSelected = true;
      ChosenUnitCost = ArcherCost;
      break;
    }
  }

  if (EUnitSelected == true && EGold > ChosenUnitCost - 1) {
    switch(ESelectedUnit) {
    case 0:
      Eswords.add(new Esword(SwordHP, BKESword, SwordDamage, VeryFastAttackSpeed, MediumSpeed));
      EUnitSelected = false;
      EGold = EGold - ESwordCost;
      break;
    case 1:
      Ekings.add(new Eking(KingHP, BKEKing, KingDamage, SlowAttackSpeed, FastSpeed));
      EUnitSelected = false;
      EGold = EGold - EKingCost;
      break;
    case 2:
      Ehorsemen.add(new Ehorseman(HorseManHP, BKEHorseman, HorseManDamage, FastAttackSpeed, VeryFastSpeed));
      EUnitSelected = false;
      EGold = EGold - EHorseManCost;
      break;
    case 3:
      Earchers.add(new Earcher(ArcherHP, BKEBow, ArcherDamage, SlowAttackSpeed, SlowSpeed, BowRange));
      EUnitSelected = false;
      EGold = EGold - EArcherCost;
      break;
    }
  }
  for (int i5 = Eswords.size()-1; i5>=0; i5--) {
    es = Eswords.get(i5);
    es.update();
    es.EMovement();
  }
  for (int i6 = Ekings.size()-1; i6>=0; i6--) {
    ek = Ekings.get(i6);
    ek.update();
    ek.EMovement();
  }
  for (int i7 = Ehorsemen.size()-1; i7>=0; i7--) {
    eh = Ehorsemen.get(i7);
    eh.update();
    eh.EMovement();
  }
  for (int i8 = Earchers.size()-1; i8>=0; i8--) {
    ea = Earchers.get(i8);
    ea.update();
    ea.EMovement();
  }
}
