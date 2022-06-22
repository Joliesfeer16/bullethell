//add an enemy, that if you hit, it will give you back all your lives
//there must be a 5 second timer, so that when timer goes off, you go back to game tab
//make many enemy that you must hit, so that every time you hit one, you gain 1 more live back.

void bonus () {

  background(#0C4086);
  addObject2();
  bonusEngine();
  debug1();
  textSize(60);
  fill(255);
  text("BONUS", 350, 100);
  textSize(40);
  text("Total lives:" + player1.lives, 330, 150);

  image (goldpile, 100, 630, 500, 200);
  image (treasure, 600, 600, 180, 180);

  if(player2.y> 450){
    player2.y=450;
  }

  timer2--;
  if (timer2 == 0) {
    mode = GAME;
  };
}

void addObject2() {

  //to reduce the amount of enemies
  if (frameCount % 60 == 0) objectss.add(new BonusE());
}
//================================================================================


void bonusEngine() {
  //general code for all objects
  int i=0;
  while (i< objectss.size()) {
    GameObjectE e = objectss.get(i);
    e.act();
    e.show();
    if (e.lives == 0) {
      objectss.remove(i); //stars will die
    } else {
      i++;
    }
  }
}
//================================================================================

void debug1() {
  //fill(255);
  //text(frameRate, 20, 20);
  //text(objects.size(), 20, 40);
}
//================================================================================


void bonusClicks() {
}
