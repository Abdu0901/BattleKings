Button DeploySword;
Button DeployKing;
Button DeployHorseman;
Button DeployArcher;
enemyBase EnemyBase;
base FriendBase;
target Target;

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
    Fswords.add(new Fsword());
    SelectedUnitNum = 0;
  }
  for (int i2 = Fswords.size()-1; i2>=0; i2--) {
    s = Fswords.get(i2);
    s.update();
    s.swordMovement();
  }

  //Deploy Kings button
  DeployKing = new Button(525, 675, 350, 50, strokeColor, "[2] King(" + KingCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeployKing.ButtonUpdate();
  if (KingDP == true && Gold > KingCost-1 && mousePressed == true) {
    Gold = Gold -KingCost;
    println("Current amount of Gold: " + Gold);
    Fkings.add(new Fking());
    SelectedUnitNum = 0;
  }
  for (int i3 = Fkings.size()-1; i3>=0; i3--) {
    k = Fkings.get(i3);
    k.update();
    k.kingMovement();
  }

  //Deploy Horsemen button
  DeployHorseman = new Button(875, 675, 350, 50, strokeColor, "[3] Horseman(" + HorseManCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeployHorseman.ButtonUpdate();
  if (HorsemanDP == true && Gold > HorseManCost-1 && mousePressed == true) {
    Gold = Gold -HorseManCost;
    println("Current amount of Gold: " + Gold);
    Fhorsemen.add(new Fhorseman());
    SelectedUnitNum = 0;
  }
  for (int i4 = Fhorsemen.size()-1; i4>=0; i4--) {
    h = Fhorsemen.get(i4);
    h.update();
    h.horsemanMovement();
  }

  //Deploy Archers button
  DeployArcher = new Button(1225, 675, 350, 50, strokeColor, "[4] Archer(" + ArcherCost + ")", 35, 0, bRed, bGreen, bBlue);
  DeployArcher.ButtonUpdate();
  if (BowDP == true && Gold > ArcherCost-1 && mousePressed == true) {
    Gold = Gold -ArcherCost;
    println("Current amount of Gold: " + Gold);
    Farchers.add(new Farcher());
    SelectedUnitNum = 0;
  }
  for (int i5 = Farchers.size()-1; i5>=0; i5--) {
    a = Farchers.get(i5);
    a.update();
    a.archerMovement();
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
      Eswords.add(new Esword());
      EUnitSelected = false;
      EGold = EGold - ESwordCost;
      break;
    case 1:
      Ekings.add(new Eking());
      EUnitSelected = false;
      EGold = EGold - EKingCost;
      break;
    case 2:
      Ehorsemen.add(new Ehorseman());
      EUnitSelected = false;
      EGold = EGold - EHorseManCost;
      break;
    case 3:
      Earchers.add(new Earcher());
      EUnitSelected = false;
      EGold = EGold - EArcherCost;
      break;
    }
  }
  for (int i5 = Eswords.size()-1; i5>=0; i5--) {
    es = Eswords.get(i5);
    es.update();
    es.EswordMovement();
  }
  for (int i6 = Ekings.size()-1; i6>=0; i6--) {
    ek = Ekings.get(i6);
    ek.update();
    ek.EkingMovement();
  }
  for (int i7 = Ehorsemen.size()-1; i7>=0; i7--) {
    eh = Ehorsemen.get(i7);
    eh.update();
    eh.EhorsemanMovement();
  }
  for (int i8 = Earchers.size()-1; i8>=0; i8--) {
    ea = Earchers.get(i8);
    ea.update();
    ea.EarcherMovement();
  }
}
