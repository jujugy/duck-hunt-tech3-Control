class Ducks extends HUD{
  
  Ducks(int s, int d,int b, int r){
    super(s, d, b, r);
  }
  void display(){
    fill(255);
    for (int i = 1; i<=10; i++){
    rect(240+i*26, 550, 15, 15);
    }
  }
}
