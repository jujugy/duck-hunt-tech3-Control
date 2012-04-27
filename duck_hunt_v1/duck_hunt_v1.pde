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
int grade = 500;
HUD hud;
Bullets bullets;
Ducks ducks;
Rounds rounds;
Score score;

//bullet
int bu = 6;

void setup() {
  size(800, 600);
  hud = new HUD(0, 10, 6, 1);
  bullets = new Bullets(0, 10, 6, 1);
  ducks = new Ducks(0,10,6,1);
  score = new Score(0,10,6,1);
  //starting state
  s = 0;

  //Set the gate for processing things once
  openClose = true;
  
  //OSC
  b_button = "/wii/1/button/B"; 
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}

void draw() {
  //clean the bg
  //background(0);

  String currentState = states[s];

  if (currentState == "preparation") {
    println("I'm preparin' " + " state: " + currentState + ", number: " + s);
    //so that it only fires once!
    if (openClose) {
      println(hud.score);
      openClose = false;
    }
    if(mousePressed)
    s = 1;
  }
  else if (currentState == "wait") {
    println("I'm waitin'" + " state: " + currentState + ", number: " + s);
    dogWalk();
    s = dogWalk();
    //hud.updateBullets(6);
    bullets.display(bu);
    ducks.display();
    score.display(hud.score);
  }
  else if (currentState == "go") {
    println("I'm goin'" + " state: " + currentState + ", number: " + s);
    duckFly();
    //hud.updateBullets(bu);
    bullets.display(bu);
    ducks.display();
    score.display(hud.score);
    if (drop) {
      hud.updateScore(500);
      println(hud.score);
      openClose = false;
    }
  }
  else if (currentState == "assess") {
    println("I'm assessin'" + " state: " + currentState + ", number: " + s);

    s = 1;
  }
  else if (currentState == "terminate") {
    println("Game Over" + s);
  }
}

void oscEvent(OscMessage theOscMessage) {

  if(theOscMessage.checkAddrPattern(b_button)==true) {  
    /*if(abs(mouseX-dx) < 20 && abs(mouseY-dy) < 20){
    drop = true;
    }*/
    bu--;
  }
  
}


