//Processing sound library is used to play sounds 

import processing.sound.*;
SoundFile File;

// setting muted to be initially false
boolean muted = false;

// Playing the firework sound if muted is not false - sound file is from the folder
void playPopSound() {
  if (muted == false) {
    File = new SoundFile(this, "pop.wav");
  }
}

// The launching sound is used when the firework launch is triggered
void playLaunchSound() {
  if (muted == false) {
    File = new SoundFile(this, "fireworkLaunch.wav");
    File.play();
  }
}

// the camera sound is trigged when we press s as well
void playScreenshotSound() {
  if (muted == false) {
    File = new SoundFile(this, "camerashutter.wav");
    File.play();
  }
}
