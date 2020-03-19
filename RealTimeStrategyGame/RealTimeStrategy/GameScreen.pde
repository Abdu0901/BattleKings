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
  
  if (swords.size() < 1) {
    swords.add(new sword());
  }

  for (int i2 = swords.size()-1; i2>=0; i2--) {
    f = swords.get(i2);
    f.update();
    f.swordMovement();
  }
}
