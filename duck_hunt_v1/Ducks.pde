class Ducks extends HUD {
  int whiteDuck, redDuck;
  Ducks(int _d) {
    ducks = _d;
  }
  public int updateDucks(int num) {
    int s;
    if (num == 0) {
      fill(255);
      whiteDuck = 10;
      redDuck = 0;
      for (int i = 1; i<=whiteDuck; i++) {
        rect(600-i*26, 550, 15, 15);
      }
    }
    else if (num == 1) {

      whiteDuck--;
      redDuck++;
      for (int i = 1; i<=whiteDuck; i++) {
        fill(255);
        rect(600-i*26, 550, 15, 15);
      }
    }
    else if (num == 2) {
      fill(255);
      for (int i = 1; i<=whiteDuck; i++) {
        rect(600-i*26, 550, 15, 15);
      }
    }
    if (whiteDuck <= 0)
      return s = 1;
    else
      return s = 2;
  }
}

