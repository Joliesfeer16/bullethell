void pause () {
  textFont(intro);
  textSize(100);
  fill(darkestBlue);
  text("PAUSE", 310, 400);

  //pause button
  stroke(darkestBlue);
  strokeWeight(2);
  fill(lightBlue);
  rectMode(CORNER);
  tactile(820, 50, 50, 50);
  rect(820, 50, 50, 50);
  textFont(symbols);
  fill(darkestBlue);
  text("D", 826, 87); 
}
//================================================================================

void pauseClicks() {
  if (mouseX>820 && mouseX< 870 && mouseY> 50 && mouseY<100) {
    mode=GAME;
  }
}
//================================================================================
