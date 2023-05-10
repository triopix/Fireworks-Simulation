// The particle class is there as a general abstract definition class for defining different types of particles
class Particle {
  float x; //xPos
  float y; //yPos
  float w; //width
  float h; //height
  float angle; // the angle in which to release the particle
  float moveX;//initial x speed
  float moveY; //initial y speed
  float grav; //initial gravity
  float gravAccel; // change in gravity
  float hue; //hue, color
  float sat; //saturation
  float black; //black value
  int a; //alpha transparency value
  int alphaDecrease; // change in alpha

  Particle(float _x, float _y, float _w, float _h, float _angle, float _moveX, float _moveY, float _grav, float _gravAccel, float _hue, float _sat, float _black, int _a, int _alphaDecrease) {
    // initializing our variables
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    angle = _angle;
    moveX = _moveX;
    moveY = _moveY;
    grav = _grav;
    gravAccel = _gravAccel;
    hue = _hue;
    sat = _sat;
    black = _black;
    a = _a;
    alphaDecrease = _alphaDecrease; //random value to change alpha by
  }
  
  // display function displays the shape based on the string type given to it
  void display(String type) {
    a -= alphaDecrease; //subtract alpha to cause particle fade out over time - runs each frame the particle appears on screen
    fill(hue, sat, black, a); //4th arg is alpha
    if(type == "square" || type == "rectangle") {
      rect(x, y, w, h);
    } else if(type == "ball") {
      ellipse(x, y, w, h);
    } else {
      println("Invalid type");
    }
  }

  //moves the explosion particles - using trig we can do it
  void move() {
    // we get the cosine of the angle given to us, and then add it to move x to get the final x position
    x+=moveX + cos(angle);
    grav += gravAccel; // accelerating gravity using change in gravity
    y += (moveY + grav) + sin(angle); // doing the same as for cos()
  }

  boolean kill() {// kills everything based on the a value. - once a fades out - we don't need the particle anymore in the list
    if (a >= 1) {
      return false;
    } else {
      return true;
    }
  }
}
