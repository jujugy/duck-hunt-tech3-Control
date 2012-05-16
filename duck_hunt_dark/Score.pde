class Score extends HUD {

  Score(int _s) {
    score = _s;
  }
  void updateScore(boolean _active) {
    if (_active) {
      score += 500;
      fill(255);
      String textScore = ""+score;
      text(textScore, 650, 550);
    }else{
      fill(255);
      String textScore = ""+score;
      text(textScore, 650, 550);
    }
  }
}

