PImage backimage;
//osc
Gun wiigun;

//HUD
HUD hud;
Score score;
Ducks ducks;
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
  ducks = new Ducks (0);
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

  //wiigun
  wiigun = new Gun();
  wiigun.initGun();
}

void draw() {
  backimage = loadImage("background2.png");
  background(backimage);
  //wiigun
  wiigun.drawTarget();
  wiigun.getVector();

  String currentState = states[s];

  if (currentState == "preparation") {
    println(" state: " + currentState + ", number: " + s);
    rect(150, 300, 500, 200);
    if (mousePressed) {
      if (mouseX > 150 && mouseX < 650 && mouseY > 300 && mouseY < 500) {
        s = 1;
      }
    }
  }
  else if (currentState == "wait") {
    println(" state: " + currentState + ", number: " + s);
    dog.dogWalk();
    s = dog.dogWalk();
    ducks.updateDucks(0);
    score.updateScore(false);
    bullets.updateBullets(bu = 6);
    rounds.updateRounds(false);
  }
  else if (currentState == "go") {
    println(" state: " + currentState + ", number: " + s);
    //duck fly, gun shot, if got it, duck drop, else "duck fly away".
    //dog appear, laugh or grab the duck and then update score, bullet and ducks
    //if bu <= 0 , "duck fly away"..., if ducks <= 0 , go to state "assess"*/
    d.duckFly();
    //hud.updateBullets(bu);
    ducks.updateDucks(2);
    score.updateScore(false);
    bullets.updateBullets(bu);
    rounds.updateRounds(false);
    if (mousePressed) {
      bu-=2;
      ducks.updateDucks(1);
      score.updateScore(true);
      bullets.updateBullets(bu);
    }
    if (bu <= 0) {
      bullets.updateBullets(bu = 6);
    }
    s = ducks.updateDucks(2);
  }
  else if (currentState == "assess") {
    println(" state: " + currentState + ", number: " + s);
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
    println("Game Over" + s);
  }
}

