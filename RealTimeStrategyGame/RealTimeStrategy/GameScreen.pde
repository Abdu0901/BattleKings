void GameScreen() {
  background (backGroundColor);

  //Counter that generates money
  wait = wait +1;
  if (wait == 100) {
    moneyssssssssssssssssssssssssssss = moneyssssssssssssssssssssssssssss +20;
    println(moneyssssssssssssssssssssssssssss);
    wait = 0;
  }
}
