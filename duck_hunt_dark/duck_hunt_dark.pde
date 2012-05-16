PImage backImage;
//PImage menuImage;

import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

String button_b;
String button_ir;
float wiix;
float wiiy;
float tempx;
float tempy;
boolean shoot;
boolean safety;
float[] reticulePosition;


//HUD
HUD hud;
Score score;
Ducks_Hit ducks_hit;
Bullets bullets;
Rounds rounds;

//duck
Duck d;
Dog dog;
//bullet
int bu = 6;

//states
String[] states = {
  "preparation", "wait", "go", "assess", "terminate"
};
int s;
boolean openClose;
boolean drop = false;
boolean changeRounds = false;
boolean pass = true;
int grade = 500;

void setup() {
  //HUD
  //frameRate(25);
  score = new Score (0);
  ducks_hit = new Ducks_Hit (0);
  bullets = new Bullets(bu);
  rounds = new Rounds(0);
  //duck
  d= new Duck();
  dog = new Dog();
  size(800, 600);
  //starting state
  s = 0;

  //Set the gate for processing things once
  openClose = true;

  button_b = "/wii/1/button/B";
  button_ir = "/wii/1/ir";
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  reticulePosition = new float[2];
  safety = false;

  //Load Ducks Hit Array
  ducks_hit.loadDuckArray();
}

void draw() {
  backImage = loadImage("Images/background2.png");
  //menuImage = loadImage("Images/MENU.png");
  background(backImage);

  drawTarget();
  getVector();

  if (shoot && safety) {
    safety = false;
  }

  String currentState = states[s];

  if (currentState == "preparation") {
    println(" state: " + currentState + ", number: " + s);
    //image(menuImage,0,0);
    s = 1;

    if (shoot) {
      println(reticulePosition[0] + " " + reticulePosition[1]);
      if (reticulePosition[0] > .2 && reticulePosition[0] < .8 && reticulePosition[1] > .17 && reticulePosition[1] < .5) {

        //s = 1;
      }
    }
  }
  else if (currentState == "wait") {
    //println(" state: " + currentState + ", number: " + s);
    dog.dogWalk();
    s = dog.dogWalk();
    ducks_hit.updateDucks_Hit(0);
    score.updateScore(false);
    bullets.updateBullets(bu = 6);
    rounds.updateRounds(false);
  }
  else if (currentState == "go") {
    //println(" state: " + currentState + ", number: " + s);
    //duck fly, gun shot, if got it, duck drop, else "duck fly away".
    //dog appear, laugh or grab the duck and then update score, bullet and ducks
    //if bu <= 0 , "duck fly away"..., if ducks <= 0 , go to state "assess"*/
    d.duckFly(shoot, wiix, wiiy);
    //hud.updateBullets(bu);
    ducks_hit.updateDucks_Hit(2);
    score.updateScore(false);
    bullets.updateBullets(bu);
    rounds.updateRounds(false);
    /*if (wiigun) {
     bu-=2;
     ducks.updateDucks(1);
     score.updateScore(true);
     bullets.updateBullets(bu);
     }*/
    if (bu <= 0) {
      bullets.updateBullets(bu = 6);
    }
    s = ducks_hit.updateDucks_Hit(2);
  }
  else if (currentState == "assess") {
    //println(" state: " + currentState + ", number: " + s);
    //check it is pass or not, 
    //if yes, back 2 state 1 and reset all(r,b,d,s),
    //if not, go to state 4.
    if (pass) {
      bullets.updateBullets(bu = 6);
      rounds.updateRounds(true);
      s = 1;
    }
    else
      s = 4;
  }
  else if (currentState == "terminate") {
    //println("Game Over" + s);
  }
}

void oscEvent(OscMessage theOscMessage) {
  //Get the vector first



  if (theOscMessage.checkAddrPattern(button_ir)==true) {
    reticulePosition[0] = theOscMessage.get(0).floatValue();
    reticulePosition[1] = theOscMessage.get(1).floatValue();
  }

  if (theOscMessage.checkAddrPattern(button_b)==true) {
    if (theOscMessage.get(0).floatValue() == 1) {
      shoot = true;
      //the button is down
      //here you would get the vector
    }
    else {
      shoot = false;
      safety = true;
      //the button is up
    }
  }
}

void drawTarget() {

  fill(255);
  ellipse(wiix*width, (height-height*wiiy), 20, 20);
  if (shoot) {
    fill(255, 0, 0);
  }
}

void getVector() {

  wiix = reticulePosition[0];
  wiiy = reticulePosition[1];
  //println("X: "+tempx+" "+"Y: "+tempy);
}

