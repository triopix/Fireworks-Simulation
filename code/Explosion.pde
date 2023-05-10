//create random colored circular explosion
// Note: w = h if circle is perfect because radius is constant
void createCircularExplosion(int numberOfParticles, float posX, float posY, float w, float h) { //w is width and h is height of each explosion particle/shape
  for (int i = 0; i < numberOfParticles; i++) {
    particleList.add(new Particle(posX, posY, w, h, random(12, 39), random(-5, 5), random(-5, 5), 0.13, 0.34, random(0, 255), 200, 255, 255, (int) random(2, 10)));
    //the 2 random values are responsible for the random particle movement into the ball construc. each ball particle will move at random speed
  }
}
 
 // Note: w = h if square because = square or if different = rect 
  void createSquareOrRectExplosion(int numberOfParticles, float posX, float posY, float w, float h) { //w is width and h is height of each explosion particle/shape
  for (int i = 0; i < numberOfParticles; i++) {
    particleList.add(new Particle(posX, posY, w, h, random(20, 80), random(-5, 5), random(-5, 5), 0.2, 0.6, random(0, 255), 200, 255, 255, (int)random(2, 10)));
    //the 2 random values are responsible for the random particle movement into the ball construc. each ball particle will move at random speed
  }
  
  // future improvments would be to add a createStarExplosion() to make star shaped explosions
}
