sprite walker;
PImage spriteSheet;

/*void setup() {
  size(136, 200);
  smooth();

  spriteSheet = loadImage("sprSht2.png");
  walker = new sprite();
}

void draw() {
  background(0);
  image(spriteSheet, 0, 4);
  walker.check();
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
    case DOWN:  
      walker.turn(0); 
      break;
    case UP:    
      walker.turn(1); 
      break;
    case LEFT:  
      walker.turn(2); 
      break;
    case RIGHT: 
      walker.turn(3); 
      break;
    }
  }
}*/

class sprite {
  PImage cell[];
  int cnt = 0, step = 0, step2 = 0, step3 = 0, dir = 0;

  sprite() {
    cell = new PImage[9];
    for (int y = 0; y < 2; y++)
      for (int x = 0; x < 3; x++)
        cell[y*3+x] = spriteSheet.get(x*50, y*50, 50, 50);
    cell[6] = spriteSheet.get(150, 150, 50, 50);
    cell[7] = spriteSheet.get(150, 175, 25, 50);
    cell[8] = spriteSheet.get(150, 200, 25, 50);
  }

  void turn(int _dir) {
    if (_dir >= 0 && _dir < 4) dir = _dir;
    println (dir);
  }

  void check() {
    //speed

    //how many image group together 3 => 1
    int idx;
    if (dir == 0 || dir == 1) {
      if (cnt++ > 7) {
        cnt = 0;
        step++;
        //playing which image
        if (step >= 3)
          step = 0;
      }
      idx = dir*3 + (step == 3 ? 1 : step);
      image(cell[idx], 88, 76);
    }
    else if (dir == 2) {
      if (cnt++ > 7) {
        cnt = 0;
        step2++;
        //playing which image
        if (step2 >= 1)
          step2 = 0;
      }
      idx = 6 + (step == 1 ? 1 : step);
      image(cell[idx], 88, 76);
    }
    else if (dir == 3) {
      if (cnt++ > 7) {
        cnt = 0;
        step3++;
        //playing which image
        if (step3 >= 2)
          step3 = 0;
      }
      idx = 7 + (step == 2 ? 1 : step);
      image(cell[idx], 88, 76);
    }
  }
}

