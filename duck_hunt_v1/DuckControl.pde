boolean duckFlyDown=false;
boolean duckFlyRight;
boolean duckFlyAway;
boolean duckDrop=false;
float duckX = 10;
float duckY = 400;
float duckSpeed;//haven't finished 
int currentTime;//timer
int startTime=0;//timer


public void duckFly() {
  background(0);
  if (duckY > 400) {
  duckFlyDown = false;
  }  
  if (duckY < 0 && duckFlyAway== false) {
    duckFlyDown = true;
  }
  if (!duckFlyAway) {
    if (duckFlyDown) { 
      duckY += 5;
    } 
    else { 
      duckY -= 7;
    }

    if (duckFlyRight) {
      duckX += 5;
    } 
    else { 
      duckX -= 5;
    }
    fill(255, 255, 0);
    rect(duckX, duckY, 50, 50);

    if (duckX < 0) {
      if (random(100) > 50) {
        duckFlyDown = !duckFlyDown;
      } 
      duckFlyRight = true;
    }
    if (duckX > 760) {
      if (random(100) > 50) {
        duckFlyDown = !duckFlyDown;
      }
      duckFlyRight = !duckFlyRight;
    }
  }
  else {
    duckY-=3;
    fill(255, 255, 0);
    rect(duckX, duckY, 50, 50);
  }

  //timer
  currentTime  = millis()-startTime;
  if (currentTime > 6000 && duckDrop == false) {
    duckFlyAway = true; 
    println("time out, duck flies away"); 
    startTime = millis() + 10000;
  }
  if (duckY < -100 && duckFlyAway == true) { // yiyang - your code said "if (duckY <- 300.." did you mean <= ? That's what I changed it to.(tana)
    duckFlyAway = false;                     // actually, it's mean fly away from screen.(boesen) so the next line he putted the reset position
    duckX = random(800); //reset position
    duckY = 400;
    startTime = millis(); //timer reset
  }
}

