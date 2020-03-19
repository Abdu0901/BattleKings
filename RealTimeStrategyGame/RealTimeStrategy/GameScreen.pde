Button DeploySword;
Button DeployKing;
Button DeployHorseman;
Button DeployArcher;

void GameScreen() {
  background (backGroundColor);
  GoldGenerator();
  AddUnits();
}

//Resources used to buy troops
int Gold;
//Timer that is used to generate gold
int Timer = 0;

//Counter that generates gold
void GoldGenerator() {
  Timer = Timer +1;
  if (Timer == 100) {
    Gold = Gold +20;
    println("Current amount of Gold: " + Gold);
    Timer = 0;
  }
}

void AddUnits() {
  sword s;
  king k;
  horseman h;
  archer a;

  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  DeploySword = new Button(width/3, 450, 100, 200, strokeColor, "Sword(20)", 20, 0, bRed, bGreen, bBlue);
  DeploySword.ButtonUpdate();
  if (DeploySword.isButtonPressed(mouseX, mouseY, mouseJustPressed, DeploySword) == true && Gold > 19) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    swords.add(new sword());
  }

  for (int i2 = swords.size()-1; i2>=0; i2--) {
    s = swords.get(i2);
    s.update();
    s.swordMovement();
  }
  DeployKing = new Button(600, 450, 100, 200, strokeColor, "King(20)", 20, 0, bRed, bGreen, bBlue);
  DeployKing.ButtonUpdate();
  if (DeployKing.isButtonPressed(mouseX, mouseY, mouseJustPressed, DeployKing) == true && Gold > 19) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    kings.add(new king());
  }

  for (int i3 = kings.size()-1; i3>=0; i3--) {
    k = kings.get(i3);
    k.update();
    k.kingMovement();
  }

  DeployHorseman = new Button(750, 450, 100, 200, strokeColor, "horseman(20)", 20, 0, bRed, bGreen, bBlue);
  DeployHorseman.ButtonUpdate();
  if (DeployHorseman.isButtonPressed(mouseX, mouseY, mouseJustPressed, DeployHorseman) == true && Gold > 19) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    horsemen.add(new horseman());
  }

  for (int i4 = horsemen.size()-1; i4>=0; i4--) {
    h = horsemen.get(i4);
    h.update();
    h.horsemanMovement();
  }

  DeployArcher = new Button(900, 450, 100, 200, strokeColor, "archer(20)", 20, 0, bRed, bGreen, bBlue);
  DeployArcher.ButtonUpdate();
  if (DeployArcher.isButtonPressed(mouseX, mouseY, mouseJustPressed, DeployArcher) == true && Gold > 19) {
    Gold = Gold -20;
    println("Current amount of Gold: " + Gold);
    archers.add(new archer());
  }

  for (int i5 = archers.size()-1; i5>=0; i5--) {
    a = archers.get(i5);
    a.update();
    a.archerMovement();
  }
}
