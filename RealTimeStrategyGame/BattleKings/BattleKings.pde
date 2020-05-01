//Abdullah, Jens and Magnus DDU. BattleKings a RealTime Strategy Game.

//ArrayList that contains the objects of each unit
ArrayList<Fsword> Fswords = new ArrayList<Fsword>();
ArrayList<Fking> Fkings = new ArrayList<Fking>();
ArrayList<Farcher> Farchers = new ArrayList<Farcher>();
ArrayList<Fhorseman> Fhorsemen = new ArrayList<Fhorseman>();

ArrayList<Esword> Eswords = new ArrayList<Esword>();
ArrayList<Eking> Ekings = new ArrayList<Eking>();
ArrayList<Earcher> Earchers = new ArrayList<Earcher>();
ArrayList<Ehorseman> Ehorsemen = new ArrayList<Ehorseman>();

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
PImage BKBlueWin;
PImage BKRedWin;

//Images for the Characters
PImage BKSword;
PImage BKBow;
PImage BKKing;
PImage BKHorseman;
PImage BKESword;
PImage BKEBow;
PImage BKEKing;
PImage BKEHorseman;

void setup() {
  size(1400, 700);
  frameRate(60);
  //Loads images
  BKBackground = loadImage("BK Background.jpg");
  BKBackground.resize(bW, bH);
  BKStartScreen = loadImage("BK StartScreen.jpg");
  BKStartScreen.resize(bW, bH);
  BKBlueWin = loadImage("BK BlueWin.jpg");
  BKBlueWin.resize(bW, bH);
  BKRedWin = loadImage("BK RedWin.jpg");
  BKRedWin.resize(bW, bH);
  BKSword = loadImage("BK Sword.png");
  BKBow = loadImage("BK Bow.png");
  BKKing = loadImage("BK Crown.png");
  BKHorseman = loadImage("BK Horse.png");
  BKESword = loadImage("BK ESword.png");
  BKEBow = loadImage("BK EBow.png");
  BKEKing = loadImage("BK ECrown.png");
  BKEHorseman = loadImage("BK EHorse.png");
  //Creates bases
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
