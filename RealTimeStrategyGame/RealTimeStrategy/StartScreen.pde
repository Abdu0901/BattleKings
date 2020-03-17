Button StartGame;

//Definin variables needed or button check
boolean lastMousePressed = false;

void StartScreen() {
  Screen = 0;
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //StartGame Button
  StartGame = new Button(width/3, height/2, 300, 150, strokeColor, "Start", 100, 0, bRed, bGreen, bBlue);
  StartGame.ButtonUpdate();
  if (StartGame.isButtonPressed(mouseX, mouseY, mouseJustPressed, StartGame) == true) {
    Screen = 1;
  }
}
