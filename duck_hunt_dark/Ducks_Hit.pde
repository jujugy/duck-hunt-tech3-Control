class Ducks_Hit extends HUD {
  int whiteDuck, redDuck;
  int[] squareDucks = new int[10];
  
 /* for (int i=0; i<squareDucks.length; i++) {
    if (i == 0) {squareDucks[i] = 200;} else {squareDucks[i] = 200 + (i*20);}
   //squareDucks[i] = i*20;
   println(squareDucks[i]);   
 }*/
 
// squareDucks[0] = 200;
  
  Ducks_Hit(int _d) {
    ducks_hit = _d;
  }
  
  public void loadDuckArray() {
   squareDucks[0] = 200;   
   for (int i=0; i<squareDucks.length; i++) {
    if (i == 0) {squareDucks[i] = 200;} else {squareDucks[i] = 200 + (i*20);}
   //squareDucks[i] = i*20;
   println(squareDucks[i]);   
 }
   // println(squareDucks[0]);
    
  }
  //num = 0, reset
  //num = 1, duck drop
  //num = 2, no change
  
  public int updateDucks_Hit(int num) {
    int s;
    //println(squareDucks[0]);
    if (num == 0) {
      fill(255);
      whiteDuck = 10;
      redDuck = 0;
      for (int i = 1; i<=whiteDuck; i++) {
        rect(500-i*26, 550, 15, 15);
      }
    }
    else if (num == 1) {

      whiteDuck--;
      redDuck++;
      for (int i = 1; i<=whiteDuck; i++) {
        fill(255);
        rect(500-i*26, 550, 15, 15);
      }
    }
    else if (num == 2) {
      fill(255);
      for (int i = 1; i<=whiteDuck; i++) {
        rect(500-i*26, 550, 15, 15);
      }
    }
    if (whiteDuck <= 0)
      return s = 3;
    else
      return s = 2;
  }
}

