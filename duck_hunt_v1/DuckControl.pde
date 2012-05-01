


class Duck
{
  boolean flyDown=false;
  boolean flyRight;
  boolean flyAway; 
  boolean drop=false;//unfinished
  float duckX=400;
  float duckY=300;
  float duckSpeed;//haven't finished 
  int currentTime;//timer
  int startTime=0;//timer

 void fly() {
    background(0);
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
        if (random(100)<2) flyRight=!flyRight;
      } 
      else { 
        duckX -= 5;
        if (random(100)<2) flyRight=!flyRight;
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
    currentTime  = millis()-startTime;
    if (currentTime > 6000 && drop == false) {
      flyAway = true; 
      println("time out, duck flies away"); 
      startTime = millis() + 10000;
    }
    if (duckY < -100 && flyAway == true) { 
      flyAway = false;                     
      duckX = random(200, 600); //reset position
      duckY = 400;
      startTime = millis(); //timer reset
    }
  }
}
