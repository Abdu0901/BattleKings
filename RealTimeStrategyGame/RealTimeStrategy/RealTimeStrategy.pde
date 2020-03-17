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
  background(0);
  wait = wait +1;
  if (wait == 100) {
    moneyssssssssssssssssssssssssssss = moneyssssssssssssssssssssssssssss +20;
    println(moneyssssssssssssssssssssssssssss);
    wait = 0;
  }
}
