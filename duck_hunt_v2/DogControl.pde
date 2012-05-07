float dogX = 10;
float dogY = 400;
boolean dogDown = false;



public int dogWalk() {
  int s;
  dogX += 1;
  ellipse(dogX, dogY, 50, 50);
  if (dogX > 300) dogY -= 2;
  if (dogX > 340) {
    dogX = 2000; 
    dogY = 2000;
    return s = 2;
  }
  return s = 1;
}

public void dogSmile() {
  if (dogX != 400 && dogY != 300) {
    dogX=400;
    dogY=300;
  }
  background(0);
  if (dogY == 240 || dogDown) {
    dogY+=0.5; 
    dogDown=true;
  }
  else dogY -= 0.5;
  println(dogY);
  if (dogY>300) {
    dogX = 2000; 
    dogY = 2000;
  }
  ellipse(dogX, dogY, 50, 50);
}

public void dogGotDuck() {
  if (dogX != 400 && dogY != 300) {
    dogX = 400;
    dogY = 300;
  }
  background(0);
  if (dogY == 240 ||  dogDown) {
    dogY += 0.5;
    dogDown = true;
  } 
  else { 
    dogY-=0.5;
  }
  println(dogY);
  if (dogY > 300) {
    dogX = 2000; 
    dogY = 2000;
  }
  ellipse(dogX, dogY, 50, 50);
}

