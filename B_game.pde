void game () {
  textFont(intro);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(1);
  //background(0);
  textSize(10);
  background(#0C66B5);
  addObject();
  gameEngine();
  debug();

  //pause button
  textFont(symbols);
  stroke(darkestBlue);
  strokeWeight(2);
  fill(lightBlue);
  rectMode(CORNER);
  tactile(820, 50, 50, 50);
  rect(820, 50, 50, 50);
  fill(darkestBlue);
  text("C", 826, 87); 

  textFont(intro);
  rectMode(CENTER);
  //text of score for target
  fill(lightBlue);
  textSize(30);
  text("Score: " + score, 30, 50); //will say the work score + the value of the score
  text("Lives: " + player1.lives, 30, 80);
  text("Highscore:" + highscore, 30, 110);

 
  if (score>highscore) {
    highscore = score;
  }

  textSize(10);

  timer--; //timer will start to tick down
  if (timer == 0) {
    mode = GAMEOVER;
  };
}
//================================================================================


void addObject() {
  objects.add(new Star()); //to draw stars

  //to reduce the amount of enemies
  if (frameCount % 80 == 0) objects.add(new Enemy());
  //to reduce the amount of enemies
  if (frameCount % 80 == 0) objects.add(new EnemyDiamond());
  //to reduce the amount of enemies
  if (frameCount % 98 == 0) objects.add(new EnemyHorizontal());

  if (frameCount % 200 == 0) objects.add(new EnemyBonus());
}
//================================================================================


void gameEngine() {
  //general code for all objects
  int i=0;
  while (i< objects.size()) {
    GameObject s = objects.get(i);
    s.act();
    s.show();
    if (s.lives <= 0) {
      objects.remove(i); //stars will die
    } else {
      i++;
    }
  }
}
//================================================================================


void debug() {
  //fill(255);
  //text(frameRate, 20, 20);
  //text(objects.size(), 20, 40);
}
//================================================================================


void gameClicks() {
  if (mouseX>820 && mouseX< 870 && mouseY> 50 && mouseY<100) {
    mode=PAUSE;
  }
}
//================================================================================
