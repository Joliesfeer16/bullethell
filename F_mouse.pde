void mousePressed() {
  if (mode ==INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode== GAMEOVER) {
    gameOverClicks();
  } else if (mode== BONUS) {
    bonusClicks();
  } else if (mode== INSTRUCTIONS) {
    instructionsClicks();
  }
}//================================================================================================

void tactile(int x, int y, int w, int h) {
  if (mouseX> x && mouseX< x+w && mouseY> y && mouseY< y+h) {
    stroke(255);
    strokeWeight(2);
  } else {
      stroke(darkestBlue);
    }
  
}//================================================================================================
