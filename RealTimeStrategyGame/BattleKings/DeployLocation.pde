//Integer for SelectUnit() to check which unit is selected
int SelectedUnitNum = 0;
//String to be displayed so the user can see which unit is selected
String SelectedUnitString;
//Booleans that allows the different units to be deployed
boolean SwordDP = false, KingDP = false, HorsemanDP = false, BowDP = false;

//X and Y position of where to deploy units
int DeployX;
int DeployY;

//Temporary location which gets constrained
int TempDeployX;
int TempDeployY;

//Location where dead units gets moved to
int DeadPosX = -500;
int DeadPosY = 0;

//Switch case that checks which unit is selected and sets it to true
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

//Sets all units to false so a new unit can be chosen
void DeselectAllUnits() {
  SwordDP = false;
  KingDP = false;
  HorsemanDP = false;
  BowDP = false;
}

//Deploys units in the location the moust is pressed
void mousePressed() {
  TempDeployX = mouseX;
  TempDeployY = mouseY;
  DeployX = constrain(TempDeployX, 0, width/2);
  DeployY = constrain(TempDeployY, 0, height);
}

//Selects units based on which numbers is pressed
void keyPressed() {
  final int k = keyCode;

  if      (k == '1') SelectedUnitNum = 1;
  else if (k == '2') SelectedUnitNum = 2;
  else if (k == '3') SelectedUnitNum = 3;
  else if (k == '4') SelectedUnitNum = 4;
}
