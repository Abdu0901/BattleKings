Button StartGame;

//Definin variables needed or button check
boolean lastMousePressed = false;

//StartScreen which includes info about the game and a start button
void StartScreen() {
  background(BKStartScreen);
  imageMode(CENTER);
  Screen = 0;
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //StartGame Button
  StartGame = new Button(1150, 70, 450, 100, strokeColor, "Start Game", 80, 0, bRed, bGreen, bBlue);
  StartGame.ButtonUpdate();
  if (StartGame.isButtonPressed(mouseX, mouseY, mouseJustPressed, StartGame) == true) {
    Screen = 1;
  }
}
