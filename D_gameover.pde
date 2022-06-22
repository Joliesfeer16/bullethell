void gameOver () {
  image(deepocean, 0, 0, width, height);
  fill(lightBlue);
  textSize(120);
  text("GAMEOVER", 198, 300);
  textSize(60);
  text("Highscore:" + highscore, 310, 370);

  //font
  textFont(intro);

  //home button
  stroke(darkestBlue);
  strokeWeight(2);
  fill(lightBlue);
  rectMode(CORNER);
  tactile(350, 480, 200, 100);
  rect(350, 480, 200, 100);
  fill(darkestBlue);
  textSize(50);
  text("RESTART", 355, 550);
  //text("HOME", 390, 550);
}
//================================================================================

void gameOverClicks() {
  if (mouseX>350 && mouseX<550 && mouseY>480 && mouseY<580) {
    //exit();
    mode=GAME;
    player1.lives=10;
    score=0;
    
    objects.clear();
    player1 = new Starfighter();
    objects.add(player1);
  }
}
//================================================================================
