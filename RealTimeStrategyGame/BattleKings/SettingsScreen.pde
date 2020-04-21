Button SwitchMusic;

void SettingsScreen() {
  background(255,255,255);
  Screen = 4;
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //StartGame Button
  StartGame = new Button(1150, 70, 450, 100, strokeColor, "Start Game", 80, 0, bRed, bGreen, bBlue);
  StartGame.ButtonUpdate();
  if (StartGame.isButtonPressed(mouseX, mouseY, mouseJustPressed, StartGame) == true) {
    Screen = 1;
  }

  //SwitchMusic Button
  SwitchMusic = new Button(550, 70, 450, 100, strokeColor, "Switch Music", 80, 0, bRed, bGreen, bBlue);
  SwitchMusic.ButtonUpdate();
  if (SwitchMusic.isButtonPressed(mouseX, mouseY, mouseJustPressed, SwitchMusic) == true) {
  } 
}
