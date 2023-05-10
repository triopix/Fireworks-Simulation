// To change the shape of the firework -> we have to define the method required from the explosion class
// Then we must define the type of shape we want in display -> ex. p.display("shape") -> An invalid shape just returns invalid
// Might add try/catch for handling exceptions later on as well

//setup variables and arrays
int bgColor = 0; //black background
ArrayList<Firework> fireworkList; //fireworkList defined as a list with type firework clas
ArrayList<Particle> particleList; //fireworkList defined as a list with type firework class

int NUMBER_OF_PARTICLES = (int) random(30, 60);
float w = 10.0; // the random module is very bad at picking numbers
float h = 10.0; // same here - somtimes random module just keeps on picking the same number

void setup() {
  size(800, 600, P2D); //p2d rendering mode for faster performance
  colorMode(HSB); // color mode set to HSB
  rectMode(CENTER);
  smooth(); // smoothens everything
  noStroke(); // there is no stroke on any object - antialiasing off
  fireworkList = new ArrayList<Firework>(); // arraylist for fireworks
  particleList = new ArrayList<Particle>(); //arraylist for particles
}

void draw() {
  textSize(14); // setting the text size to 14 pixels - this sets it for every text
  
  background(bgColor);

  //FIREWORK - Each firework object is stored in fireworkList, as i
  for (int i = fireworkList.size()-1; i >= 0; i--) {
    Firework f = fireworkList.get(i);
    f.display(); //The '.' allow you to access methods and variables of the object
    f.move();

    //Check if we should remove each firework from the list
    if (f.maxHeightReached()) { //if firework reaches y target, it will get removed
      fireworkList.remove(i);
      // the explosion will also be triggered at that stage, this is why f.x and f.y are the initial positions of the "particles"
      createCircularExplosion(NUMBER_OF_PARTICLES, f.x, f.y, w, h);
      playPopSound();
    }
  }

  //CIRCLE EXPLOSION
  for (int i = particleList.size()-1; i >= 0; i--) {
    Particle p = particleList.get(i); //like int [var], the datatype is just the class Ball
    p.display("ball");
    p.move();

    //Check if we should remove each ball from the list according to kill() method in Ball class
    if (p.kill() == true) {
      particleList.remove(i);
    }
  }
  //display informational text on screen
  showAllStats();
}


//launch firework if mouse pressed
void mousePressed() {
  // adding a new firework based on the parameters given
  fireworkList.add(new Firework(mouseX, height, 5, 10, 255, random(height/7, height/8), -7)); //f is a new firework object, passing in these arguments to constructor
  playLaunchSound();
  fireworkCount++; // increment the number of fireworks to dynamically update the variable
  //continuously compare each firework object's x and y to mouseX and mouseY
  for (int i = fireworkList.size()-1; i >= 0; i--) {
    //if touching mouse, explode the firework
    Firework f = fireworkList.get(i);
    
    
    // checking to see if the mouse over is inside the mouseClickExplodeDist - if true, then we will complete the following actions
    if (dist(mouseX, mouseY, f.x, f.y) <= mouseClickExplodeDist) {
      fireworkList.remove(i);
      playPopSound();
      createCircularExplosion(NUMBER_OF_PARTICLES, f.x, f.y, w, h);
    }
  }
}

void keyPressed() {
 
  //Using s key, we can save a screenshot
  if (key == 's' || key == 'S') {
    // we save it to the local folder - also use day, hour, minute, etc...
    save(year()+"_"+month()+"_"+day()+"_"+hour()+""+minute() + ".png");
    playScreenshotSound(); // playing the sound
  }

  //m or M works like a toggle to mute or unmute the firework sounds
  if ((key == 'm' && muted == false) || (key == 'M' && muted == false)) {
    muted = true;
  } else if ((key == 'm' && muted == true) || (key == 'M' && muted == true)) {
    muted = false;
  }
}
