class Rounds extends HUD {

  Rounds(int _r) {
    rounds = _r;
  }
  void updateRounds(boolean _active) {
    if (_active) {
      rounds++;
      fill(255);
      String textRounds = ""+rounds;
      text("R = " + textRounds, 50, 500);
    }
    else {
      fill(255);
      String textRounds = ""+rounds;
      text("R = " + textRounds, 50, 500);
    }
  }
}
