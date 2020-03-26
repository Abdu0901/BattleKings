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

//Images for the different screens
PImage BKBackground;
PImage BKStartScreen;

//Images for the Characters
PImage BKSword;
PImage BKBow;
PImage BKKing;
PImage BKHorseman;

void setup() {
  size(1400, 700);
  //Loads images
  BKBackground = loadImage("BK Background.jpg");
  BKBackground.resize(bW, bH);
  BKStartScreen = loadImage("BK StartScreen.jpg");
  BKStartScreen.resize(bW, bH);
  BKSword = loadImage("BK Sword.png");
  BKBow = loadImage("BK Bow.png");
  BKKing = loadImage("BK Crown.png");
  BKHorseman = loadImage("BK Horse.png");

  FriendBase = new base();
  EnemyBase = new enemyBase();
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
