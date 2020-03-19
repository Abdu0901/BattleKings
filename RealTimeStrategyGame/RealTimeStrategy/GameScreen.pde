Button DeploySword;

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
  sword f;

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
    f = swords.get(i2);
    f.update();
    f.swordMovement();
  }
}
