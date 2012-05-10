PImage spriteSheet;

class sprite {
  PImage cell[];
  int cnt = 0, step = 0, step2 = 0, step3 = 0, dir = 0;

  sprite() {
    spriteSheet = loadImage("spritesheet.png");

    cell = new PImage[48];
    //dog
    for (int x = 0; x < 5; x++) {
      cell[x] = spriteSheet.get(x*130, 0, 130, 90);
    }
    for (int x = 0; x < 3; x++) {
      cell[5+x] = spriteSheet.get(x*130, 50, 130, 90);
    }
    for (int x = 0; x < 2; x++) {
      cell[8+x] = spriteSheet.get(x*130, 50, 130, 90);
    }
    for (int y = 0; y < 2; y++) {
      cell[10+y] = spriteSheet.get(130, y*50, 130, 90);
    }

    //duck
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        cell[12+y*3+x] = spriteSheet.get(x*130, y*50, 130, 90);
      }
    }
    cell[21] = spriteSheet.get(150, 150, 50, 50);
    cell[22] = spriteSheet.get(150, 175, 25, 50);
    cell[23] = spriteSheet.get(150, 200, 25, 50);
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        cell[24+y*3+x] = spriteSheet.get(x*130, y*50, 130, 90);
      }
    }
    cell[33] = spriteSheet.get(150, 150, 50, 50);
    cell[34] = spriteSheet.get(150, 175, 25, 50);
    cell[35] = spriteSheet.get(150, 200, 25, 50);
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        cell[36+y*3+x] = spriteSheet.get(x*130, y*50, 130, 90);
      }
    }
    cell[45] = spriteSheet.get(150, 150, 50, 50);
    cell[46] = spriteSheet.get(150, 175, 25, 50);
    cell[47] = spriteSheet.get(150, 200, 25, 50);
  }

  void dogTurn(int _dir) {
    if (_dir >= 0 && _dir < 4) dir = _dir;
    println (dir);
  }
  void duckTurn(int _dir) {
    if (_dir >= 0 && _dir < 5) dir = _dir;
    println (dir);
  }

  void dogCheck(int _px) {
    //speed

    //how many image group together 3 => 1
    int idx;
    if (dir == 0 || dir == 1) {
      if (cnt++ > 15) {
        cnt = 0;
        step++;
        //playing which image
        if (step >= 3)
          step = 0;
      }
      idx = dir*3 + (step == 3 ? 1 : step);
      image(cell[idx], _px, 176);
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
      image(cell[idx], 188, 176);
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
      image(cell[idx], 188, 176);
    }
  }

  void duckCheck() {
    //speed

    //how many image group together 3 => 1
    int idx;
    if (dir == 0 || dir == 1) {
      if (cnt++ > 15) {
        cnt = 0;
        step++;
        //playing which image
        if (step >= 3)
          step = 0;
      }
      idx = dir*3 + (step == 3 ? 1 : step);
      image(cell[idx], 188, 176);
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
      image(cell[idx], 188, 176);
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
      image(cell[idx], 188, 176);
    }
  }
}

