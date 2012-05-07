import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

class Gun {

  String button_b;
  float wiix;
  float wiiy;
  float tempx;
  float tempy;
  boolean shoot;

  Gun() {
  }

  void initGun() {

    button_b = "/wii/1/button/B";
    oscP5 = new OscP5(this, 12000);
    myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  }

  void oscEvent(OscMessage theOscMessage) {


    if (theOscMessage.checkAddrPattern(button_b)==true) {
      shoot = true;
      /*if(abs(mouseX-dx) < 20 && abs(mouseY-dy) < 20){
         drop = true;
         }
       bu--;*/
    }
    else {
      shoot = false;
    }
    tempx = theOscMessage.get(0).floatValue();
    tempy = theOscMessage.get(1).floatValue();
  }

  void drawTarget() {

    fill(255);
    ellipse(wiix*width, (height-height*wiiy), 20, 20);
    if (shoot) {
      fill(255, 0, 0);
    }
  }

  void getVector() {

    wiix = tempx;
    wiiy = tempy;
    //println("X: "+tempx+" "+"Y: "+tempy);
  }
}

