//Abdullah, Jens and Magnus DDU. RealTime Strategy Game
ArrayList<sword> swords = new ArrayList<sword>(); 
ArrayList<king> kings = new ArrayList<king>(); 
ArrayList<archer> archers = new ArrayList<archer>(); 
ArrayList<horseman> horsemen = new ArrayList<horseman>(); 
int moneyssssssssssssssssssssssssssss;
int wait = 0;

void setup() {
  size(1400, 700);
}

void draw() {
  sword f;
  background(0);

  wait = wait +1;
  if (wait == 100) {
    moneyssssssssssssssssssssssssssss = moneyssssssssssssssssssssssssssss +20;
    println(moneyssssssssssssssssssssssssssss);
    wait = 0;
  }
  
  final int k = keyCode;
  if (k == LEFT | k == 'A') {
    swords.add(new sword());
  }
  
  for (int i2 = swords.size()-1; i2>=0; i2--) {
    f = swords.get(i2);
    f.update();
    f.swordMovement();
  }
}
