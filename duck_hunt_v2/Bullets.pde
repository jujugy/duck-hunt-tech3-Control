class Bullets extends HUD {

  Bullets(int _b) {
    bullets = _b;
  }
  void updateBullets(int _bu) {
    
    stroke(130, 160, 0);
    switch(_bu) {
    case 6:
      rect(50, 545, 2, 12);
      rect(70, 545, 2, 12);
      rect(90, 545, 2, 12);
      break;
    case 4:
      rect(50, 545, 2, 12);
      rect(70, 545, 2, 12);
      break;
    case 2:
      rect(50, 545, 2, 12);
      break;
    case 0:
      break;
    }
  }
}

