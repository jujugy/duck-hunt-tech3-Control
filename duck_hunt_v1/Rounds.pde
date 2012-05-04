class Rounds extends HUD {

  Rounds(int _r) {
    rounds = _r;
  }
  void updateRounds() {
      rounds++;
      fill(255);
      String textRounds = ""+rounds;
      text(textRounds, 100, 550);
  }
}

