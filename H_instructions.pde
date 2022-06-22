void instructions () {
  background(seaBlue);
  textFont(intro);

  //title
  textSize(100);
  fill(lightBlue);
  text("INSTRUCTIONS", 160, 200);

  //legend
  stroke(darkestBlue);
  rectMode(CORNER);
  rect(280, 250, 345, 250);

  textSize(50);
  fill(darkestBlue);
  text("Legend", 295, 290);
  textSize(10);
  textFont(instruct);
  text("= grow in size", 370, 350);
  text("= increase speed", 370, 410);
  text("= bullet bomb", 370, 470);
  
  //images
  fill(#FA8347);
  square(310, 385, 30);
  
  fill(#FC4280);
  square(310, 320, 30);
  
  fill(#FFD04D);
  square(310, 450, 30);
  
  //bonus
  textSize(50);
  fill(darkestBlue);
  text("shoot the treasure to discover a hidden setting", 12, 570);
  image(treasure, 375, 590, 170, 170);
  
  //intructions button
  textFont(symbols);
  stroke(darkestBlue);
  strokeWeight(2);
  fill(lightBlue);
  rectMode(CORNER);
  tactile(820, 50, 50, 50);
  rect(820, 50, 50, 50);
  fill(darkestBlue);
  text("5", 826, 87); 
}


void instructionsClicks() {
 if (mouseX>820 && mouseX< 870 && mouseY> 50 && mouseY<100) {
    mode=INTRO;
  }
  
}
