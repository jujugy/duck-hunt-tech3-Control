//The superclass for all hud elements
class HUD{
  
  int score;
  int ducks;
  int bullets;
  int rounds;
  
  HUD(int s, int d,int b, int r){
    score = s;
    ducks = d;
    bullets = b;
    rounds = r;
    
  }
  
  void updateScore(int num){
    this.score = num;
  }
  void updateDucks(int num){
    this.ducks = num;
  }
  void updateBullets(int num){
    this.bullets = num;
  }
  void updateRounds(int num){
    this.rounds = num;
  }
}
