Button StartGame;

//Definin variables needed or button check
boolean lastMousePressed = false;

void StartScreen() {
  background(BKStartScreen);
  Screen = 0;
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //StartGame Button
  StartGame = new Button(bW-470, 10, 450, 100, strokeColor, "Start Game", 80, 0, bRed, bGreen, bBlue);
  StartGame.ButtonUpdate();
  if (StartGame.isButtonPressed(mouseX, mouseY, mouseJustPressed, StartGame) == true) {
    Screen = 1;
  }
}
