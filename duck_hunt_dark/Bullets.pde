Sprite bullet_image;

class Bullets extends HUD {

  Bullets(int _b) {
    bullets = _b;
    bullet_image = new Sprite();
  }

  void updateBullets(int _bu) {
    bullet_image.bulletCheck();
    bullet_image.bulletTurn(0);

    fill(0);
    switch(_bu) {
    case 6:
      break;
    case 4:
      rect(85, 530, 13, 25);
      break;
    case 2:
      rect(65, 530, 13, 25);
      rect(85, 530, 13, 25);
      break;
    case 0:
      rect(45, 530, 13, 25);
      rect(65, 530, 13, 25);
      rect(85, 530, 13, 25);
      break;
    }
  }
}

