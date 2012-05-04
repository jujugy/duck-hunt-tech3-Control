import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
String b_button;

String[] states = {
  "preparation", "wait", "go", "assess", "terminate"
};
int s;
boolean openClose;
boolean drop = false;
boolean changeRounds = false;
boolean pass;
int grade = 500;

//HUD
HUD hud;
Score score;
Ducks ducks;
Bullets bullets;
Rounds rounds;
//duck
DuckControl d;
//bullet
int bu = 6;

void setup() {
  //HUD
  score = new Score (0);
  ducks = new Ducks (0);
  bullets = new Bullets(bu);
  //rounds = new Rounds(false);
  //duck
  d= new DuckControl();

  size(800, 600);
  //starting state
  s = 0;

  //Set the gate for processing things once
  openClose = true;

  //OSC
  b_button = "/wii/1/button/B"; 
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}

void draw() {
  //clean the bg
  //background(0);

  String currentState = states[s];

  if (currentState == "preparation") {
    //println("I'm preparin' " + " state: " + currentState + ", number: " + s);
    //so that it only fires once!
    if (openClose) {
      //println(hud.score);
      openClose = false;
    }
    if (mousePressed)
      s = 1;
  }
  else if (currentState == "wait") {
    //println("I'm waitin'" + " state: " + currentState + ", number: " + s);
    dogWalk();
    s = dogWalk();
    ducks.updateDucks(0);
    score.updateScore(false);
    bullets.updateBullets(bu = 6);
    //rounds.updateRounds(false);
  }
  else if (currentState == "go") {
    //println("I'm goin'" + " state: " + currentState + ", number: " + s);
    d.fly();
    //hud.updateBullets(bu);
    ducks.updateDucks(2);
    score.updateScore(false);
    bullets.updateBullets(bu);
    //rounds.updateRounds(false);
    if (mousePressed) {
      bu-=2;
      ducks.updateDucks(1);
      score.updateScore(true);
      bullets.updateBullets(bu);
    }
    if (bu <= 0) {
        s = 3;
    }
  }
  else if (currentState == "assess") {
    //println("I'm assessin'" + " state: " + currentState + ", number: " + s);
    
    bullets.updateBullets(bu = 6);
    s = ducks.updateDucks(2);
    
  }
  else if (currentState == "terminate") {
    println("Game Over" + s);
  }
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern(b_button)==true) {  
    /*if(abs(mouseX-dx) < 20 && abs(mouseY-dy) < 20){
     drop = true;
     }*/
    bu--;
  }
}

