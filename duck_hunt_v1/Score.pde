class Score extends HUD{
  
  Score(int s, int d,int b, int r){
    super(s, d, b, r);
  }
  void display(int s){
    fill(255);
    String score = ""+s;
    text(score, 590, 550);
  }
}
