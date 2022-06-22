void intro () {
  rectMode(CORNER);

  noStroke();
  //background
  image (ocean, 0, 0, width, height);

  image(greek, -560, 150, 1400, 700);
  image(greek, 60, 150, 1400, 700);

  //text
  fill(gold);
  textFont(intro);
  textSize(100);
  text("POSEIDON", 255, 270);

  //intructions button
  textFont(symbols);
  stroke(darkestBlue);
  strokeWeight(2);
  fill(lightBlue);
  rectMode(CORNER);
  tactile(820, 50, 50, 50);
  rect(820, 50, 50, 50);
  fill(darkestBlue);
  text("u", 826, 87); 
  


  //start button
 
  textFont(intro);
  fill(darkestBlue);
  tactile(350, 300, 200, 100);
  rect(350, 300, 200, 100);
  textMode(CENTER);
  fill(lightBlue);
  textSize(40);
  text("START", 393, 365);
 


  //player moving
  poseidon(poseidonX, 420, thingA);
  poseidonX += 25 ;
  if (poseidonX>width) {
    mode=GAME;
  }
}
//================================================================================

void introClicks() {
  rectMode(CORNER);
  //if click on start button it will be removed
  if (mouseX> 350 && mouseX< 550 && mouseY> 300 && mouseY< 400) {
    poseidonX= -200;
    frameCount=0;
  }
 if (mouseX>820 && mouseX< 870 && mouseY> 50 && mouseY<100) {
    mode=INSTRUCTIONS;
  }
}
//================================================================================


void poseidon (int x, int y, int angle) {

  pushMatrix();
  translate(x, y);
  rectMode(CORNER);
  rotate(radians(angle));
  //noStroke();
  ////poseidon image
  image(trident, 0, 0, 330, 330); //290,420

  popMatrix();
}
