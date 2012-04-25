

String[] states = {"preparation","wait","go","assess","terminate"};
int s;
boolean openClose;
HUD hud;

void setup(){
  size(800,600);
  hud = new HUD(0,10,3,1);
  
  //starting state
  s = 0;
  
  //Set the gate for processing things once
  openClose = true;
}

void draw(){
  //clean the bg
  background(0);
  
  String currentState = states[s];
  
  if(currentState == "preparation"){
    println("I'm preparin' " + " state: " + currentState + ", number: " + s);
    
    //so that it only fires once!
    if(openClose){
      println(hud.score);
      openClose = false;
    }
    
  }else if(currentState == "wait"){
    println("I'm waitin'" + " state: " + currentState + ", number: " + s);
    
    //so that it only fires once!
    if(openClose){
      hud.updateScore(500);
      println(hud.score);
      openClose = false;
    }
    
  }else if(currentState == "go"){
    println("I'm goin'" + " state: " + currentState + ", number: " + s);
  
  }else if(currentState == "assess"){
    println("I'm assessin'" + " state: " + currentState + ", number: " + s);
    
    s = 1;
    
  }else if(currentState == "terminate"){
    println("I'm terminatin'" + " state: " + currentState + ", number: " + s);
    
  }
  
}

void mouseClicked() {
  s++;
  s = s % states.length;
  openClose = true;
  //s = (s == 0) ? states.length : s;
}
