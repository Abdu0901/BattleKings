int SelectedUnitNum = 0;
String SelectedUnitString;
boolean SwordDP = false, KingDP = false, HorsemanDP = false, BowDP = false;

int DeployX = 50;
int DeployY = 400;

void SelectUnit() {
  switch(SelectedUnitNum) {
  case 0:
    DeselectAllUnits();
    SelectedUnitString = "None";
    break;
  case 1:
    DeselectAllUnits();
    SwordDP = true;
    SelectedUnitString = "Sword";
    break;
  case 2:
    DeselectAllUnits();
    KingDP = true;
    SelectedUnitString = "King";
    break;
  case 3:
    DeselectAllUnits();
    HorsemanDP = true;
    SelectedUnitString = "Horseman";
    break;
  case 4:
    DeselectAllUnits();
    BowDP = true;
    SelectedUnitString = "Bow";
    break;
  }
}

void DeselectAllUnits() {
  SwordDP = false;
  KingDP = false;
  HorsemanDP = false;
  BowDP = false;
}

void mousePressed(){
  DeployX = mouseX;
  DeployY = mouseY;
}

void keyPressed() {
  final int k = keyCode;

  if      (k == '1') SelectedUnitNum = 1;
  else if (k == '2') SelectedUnitNum = 2;
  else if (k == '3') SelectedUnitNum = 3;
  else if (k == '4') SelectedUnitNum = 4;
}
