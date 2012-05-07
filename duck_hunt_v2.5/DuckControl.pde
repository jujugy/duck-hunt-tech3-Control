//i need duck don't fly...

class DuckControl
{
  boolean flyDown=false;
  boolean flyRight;
  boolean flyAway;
  boolean drop=false;
  float duckX = 400;
  float duckY = 300;
  float duckSpeed;//haven't finished 
  int currentTime=0;//timer
  int startTime=0;//timer


  void fly() {
    if (mousePressed && !flyAway ) {  //duck shot
      drop = true;

      println("duck drop");
    } 
    if (drop && duckY<500) {
      duckY+=5;
      fill(255, 0, 0);
      rect(duckX, duckY, 50, 50);
    }
    else
    { 
      if (drop) {
        drop=!drop;
        startTime=millis(); 
        println (startTime);
        duckX = random(200, 600);
        duckY = 400;
      }
      if (duckY > 400) {
        flyDown = false;
      }  
      if (duckY < 0 && flyAway== false) {
        flyDown = true;
      }
      if (!flyAway) {
        if (flyDown) { 
          duckY += 5;
        } 
        else { 
          duckY -= 7;
        }

        if (flyRight) {
          duckX += 5;
          if (random(1000)<2) flyRight=!flyRight;
        } 
        else { 
          duckX -= 5;
          if (random(1000)<2) flyRight=!flyRight;
        }
        fill(255, 255, 0);
        rect(duckX, duckY, 50, 50);

        if (duckX < 0) {
          if (random(100) > 50) {
            flyDown = !flyDown;
          } 
          flyRight = true;
        }
        if (duckX > 760) {
          if (random(100) > 50) {
            flyDown = !flyDown;
          }
          flyRight = !flyRight;
        }
      }
      else {
        duckY-=2;
        fill(255, 255, 0);
        rect(duckX, duckY, 50, 50);
      }

      //timer
      if (startTime==0)startTime=millis();
      currentTime  = millis()-startTime;
      if (currentTime > 6000 && drop == false) {
        flyAway = true; 
        println("time out, duck flies away"); 
        startTime = millis() + 10000;
      }
      if (duckY < -100 && flyAway == true) { // yiyang - your code said "if (duckY <- 300.." did you mean <= ? That's what I changed it to.(tana)
        flyAway = false;                     // actually, it's mean fly away from screen.(boesen) so the next line he putted the reset position
        duckX = random(800); //reset position
        duckY = 400;
        startTime = millis(); //timer reset
      }
    }
  }
}

