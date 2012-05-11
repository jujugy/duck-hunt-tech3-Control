PImage spriteSheet;

class Sprite {
  PImage cell[];
  int dog_cnt = 0, dog_step = 0, dog_step1 = 0, dog_step2 = 0, dog_step3 = 0, dog_dir = 0;
  int duck_cnt = 0, duck_step = 0, duck_step1 = 0, duck_step2 = 0, duck_step3 = 0, duck_step4 = 0, duck_dir = 0;
  
  Sprite() {
    spriteSheet = loadImage("spritesheet.png");

    cell = new PImage[48];
    //dog
    for (int x = 0; x < 5; x++) {
      cell[x] = spriteSheet.get(x*130, 0, 130, 120);
    }
    for (int x = 0; x < 3; x++) {
      cell[5+x] = spriteSheet.get(x*130, 120, 130, 140);
    }
    for (int x = 0; x < 2; x++) {
      cell[8+x] = spriteSheet.get(390+x*130, 120, 130, 120);
    }
    for (int y = 0; y < 2; y++) {
      cell[10+y] = spriteSheet.get(650, y*120, 140, 120);
    }

    //duck
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        cell[12+y*3+x] = spriteSheet.get(x*85, 260+y*85, 85, 85);
      }
    }
    cell[21] = spriteSheet.get(0, 520, 85, 88);
    cell[22] = spriteSheet.get(88, 520, 85, 88);
    cell[23] = spriteSheet.get(176, 520, 85, 88);
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        cell[24+y*3+x] = spriteSheet.get(270+x*85, 260+y*85, 85, 85);
      }
    }
    cell[33] = spriteSheet.get(264, 520, 85, 88);
    cell[34] = spriteSheet.get(352, 520, 85, 88);
    cell[35] = spriteSheet.get(440, 520, 85, 88);
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        cell[36+y*3+x] = spriteSheet.get(530+x*85, 260+y*85, 85, 85);
      }
    }
    cell[45] = spriteSheet.get(528, 520, 85, 88);
    cell[46] = spriteSheet.get(616, 520, 85, 88);
    cell[47] = spriteSheet.get(704, 520, 85, 88);
  }

  void dogTurn(int _dir) {
    if (_dir >= 0 && _dir < 4) dog_dir = _dir;
    //println (dir);
  }
  void duckTurn(int _dir) {
    if (_dir >= 0 && _dir < 5) duck_dir = _dir;
    //println (dir);
  }

  void dogCheck(int _px, int _py) {
    //speed
    
    //how many image group together 3 => 1
    int idx;
    if (dog_dir == 0) {
      if (dog_cnt++ > 25) {
        dog_cnt = 0;
        dog_step++;
        //playing which image
        if (dog_step >= 5)
          dog_step = 0;
      }
      idx = dog_dir*3 + (dog_step == 5 ? 1 : dog_step);
      image(cell[idx], _px, _py);
    }
    else if (dog_dir == 1) {
      if (dog_cnt++ > 30) {
        dog_cnt = 0;
        dog_step1++;
        //playing which image
        if (dog_step1 >= 3)
          dog_step1 = 0;
      }
      idx = 5 + (dog_step1 == 3 ? 1 : dog_step1);
      image(cell[idx], _px, _py);
    }
    else if (dog_dir == 2) {
      if (dog_cnt++ > 15) {
        dog_cnt = 0;
        dog_step2++;
        //playing which image
        if (dog_step2 >= 2)
          dog_step2 = 0;
      }
      idx = 8 + (dog_step2 == 2 ? 1 : dog_step2);
      image(cell[idx], _px, _py);
    }
    else if (dog_dir == 3) {
      if (dog_cnt++ > 15) {
        dog_cnt = 0;
        dog_step3++;
        //playing which image
        if (dog_step3 >= 2)
          dog_step3 = 0;
      }
      idx = 10 + (dog_step3 == 2 ? 1 : dog_step3);
      image(cell[idx], _px, _py);
    }
  }

  void duckCheck(int _duckX, int _duckY) {
    //speed

    //how many image group together 3 => 1
    int idx;
    if (duck_dir == 0) {
      if (duck_cnt++ > 15) {
        duck_cnt = 0;
        duck_step++;
        //playing which image
        if (duck_step >= 3)
          duck_step = 0;
      }
      idx = duck_dir*3 + (duck_step == 3 ? 1 : duck_step);
      image(cell[idx], _duckX, _duckY);
    }
    else if(duck_dir == 1) {
      if (duck_cnt++ > 15) {
        duck_cnt = 0;
        duck_step1++;
        //playing which image
        if (duck_step1 >= 3)
          duck_step1 = 0;
      }
      idx = 15 + (duck_step1 == 3 ? 1 : duck_step1);
      image(cell[idx], _duckX, _duckY);
    }
    else if(duck_dir == 2) {
      if (duck_cnt++ > 15) {
        duck_cnt = 0;
        duck_step2++;
        //playing which image
        if (duck_step2 >= 3)
          duck_step2 = 0;
      }
      idx = 18 + (duck_step2 == 3 ? 1 : duck_step2);
      image(cell[idx], _duckX, _duckY);
    }
    else if (duck_dir == 3) {
      if (duck_cnt++ > 15) {
        duck_cnt = 0;
        duck_step3++;
        //playing which image
        if (duck_step3 >= 1)
          duck_step3 = 0;
      }
      idx = 21 + (duck_step3 == 1 ? 1 : duck_step3);
      delay(1000);
      image(cell[idx], _duckX, _duckY);
    }
    else if (duck_dir == 4) {
      if (duck_cnt++ > 7) {
        duck_cnt = 0;
        duck_step4++;
        //playing which image
        if (duck_step4 >= 2)
          duck_step4 = 0;
      }
      idx = 22 + (duck_step4 == 2 ? 1 : duck_step4);
      image(cell[idx], _duckX, _duckY);
    }
  }
}

