// Setting the variable to show firework count
int fireworkCount;

void showFPSCounter() {
  fill(0, 0, 255); //ensure color remains white
  text("FPS: " + frameRate, width/50, height/25); //independent of screen size, draws text on top left corner of program window
}

void showFireworkCount() {
  fill(0, 0, 255); //ensure text color remains white
  text("Fireworks launched: " + fireworkCount, width/50, height/12); //string, fireworkcount increment, x, y
}

void showParticleCount() {
  fill(0, 0, 255); //ensure text color remains white
  text("Explosion particles onscreen: " + particleList.size(), width/50, height/8); //string, particlecount according to
}

void showAllStats() {
  showFPSCounter();
  showFireworkCount();
  showParticleCount();
}
