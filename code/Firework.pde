//entire file is the firework class, the ball that flies up before causing explosion
int mouseClickExplodeDist = 35; //how close  mouse has to be in order to manually explode fireworks

class Firework {
  //define variables
  float x; //xPos
  float y; //yPos
  float w; //width
  float h; //length
  int col; //white color
  float maxHeight; //height, the y-value that it reaches before exploding
  float speedY; //how fast it goes up the screen

  //the constructor, arguments that can be passed through. these are temporary variables
  Firework(float _x, float _y, float _w, float _h, int _col, float _maxHeight, float _speedY) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    col = _col;
    maxHeight = _maxHeight;
    speedY = _speedY;
  }

  //draw circle on screen and fill with specificed color
  void display() {
    fill(col);
    ellipse(x, y, w, h);
  }

  //move up screen
  void move() {
    y += speedY;
  }

  //explode and go boom
  boolean maxHeightReached() {
    if (y <= maxHeight) {
      return true;
    } else {
      return false;
    }
  }
}
