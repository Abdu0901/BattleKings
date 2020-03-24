//Abdullah, Jens and Magnus DDU. BattleKings a RealTime Strategy Game.
ArrayList<sword> swords = new ArrayList<sword>();
ArrayList<king> kings = new ArrayList<king>();
ArrayList<archer> archers = new ArrayList<archer>();
ArrayList<horseman> horsemen = new ArrayList<horseman>();

//A variable that displays the current selected screen
int Screen = 0;

//Color of the buttons
int bRed = 0, bGreen = 166, bBlue = 255;

//Background Color
int backGroundColor = 255;

//Text Color
int textColor = 0;

//Stroke Color
int strokeColor = 0;

//Width and Height for Background 
int bW = 1400; 
int bH = 700;

PImage BKBackground;

void setup() {
  size(1400, 700);
  BKBackground = loadImage("BK Background.jpg");
  BKBackground.resize(bW, bH);
}

void draw() {
  //Switch case that displays the current screen
  switch(Screen) {
  case 0:
    StartScreen();
    break;
  case 1:
    GameScreen();
    break;
  case 2:
    EndScreen();
    break;
  }
}
