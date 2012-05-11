Sprite ducker;

class Duck
{
  boolean flyDown = false;
  boolean flyRight;
  boolean flyAway; 
  boolean drop = false;//unfinished
  int duckX=400;
  int duckY=300;
  float duckSpeed = 5; //haven't finished 
  //is duck speed actually defined in fly function? - tana

  int currentTime;//timer
  int startTime = 0;//timer

  Duck() {
    ducker = new Sprite();
  }

  void duckFly() {
    if (mousePressed && !flyAway ) {  //duck shot
      ducker.duckCheck(duckX, duckY);
      ducker.duckTurn(3);
      drop = true;

      println("duck drop");
    } 
    if (drop && duckY<500) {
      duckY+=5;
      fill(255, 0, 0);
      ducker.duckCheck(duckX, duckY);
      ducker.duckTurn(4);
      //rect(duckX, duckY, 50, 50);
    }
    else
    { 
      if (drop) {
        drop=!drop;
        startTime=millis(); 
        println (startTime);
        duckX = int(random(200, 600));
        duckY = 400;
      }
      if (duckY > 400) {
        flyDown = false;
      }  
      if (duckY < 0 && flyAway == false) {
        flyDown = true;
      }
      //this is giving a speed to duck, yes?(t) //yiyang: yes it determine the speed
      if (!flyAway) {
        if (flyDown) { 
          duckY += duckSpeed;
        } 
        else { 
          duckY -= duckSpeed;
        }

        if (flyRight) {
          duckX += duckSpeed;
          if (random(100)<2) flyRight=!flyRight;
        } 
        else { 
          duckX -= duckSpeed;
          if (random(100)<2) flyRight=!flyRight;
        }
        ducker.duckCheck(duckX, duckY);
        ducker.duckTurn(1);
        //fill(255, 255, 0);
        //rect(duckX, duckY, 50, 50);

        if (duckX < 0) {
          if (random(100) > 50) {
            flyDown = !flyDown;
          } 
          flyRight = true;
        }
        if (duckX > 745) {
          if (random(100) > 50) {
            flyDown = !flyDown;
          }
          flyRight = !flyRight;
        }
      }
      else {
        duckY -= 2;
        ducker.duckCheck(duckX, duckY);
        ducker.duckTurn(2);
        //fill(255, 255, 0);
        //rect(duckX, duckY, 50, 50);
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
        duckX = int(random(200, 600)); //reset position
        duckY = 400;
        startTime = millis(); //timer reset
      }
    }

    // duck drop
  }
}

