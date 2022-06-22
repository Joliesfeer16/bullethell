class BonusE extends GameObjectE { //enemy bonus tab



  BonusE() { //blue enemy
    super(random(width), -20, 0, 5, 100, #A07394, 1);
  }

  void act() {
    super.act();



    //collision code
    int i=0;
    while (i < objectss.size()) {
      GameObjectE objs = objectss.get(i);
      if (objs instanceof BulletE) {
        if (collidingWith(objs)) {
          // objectss.remove();lives--;
          objs.lives = 0;
          lives--;
          player1.lives++;
          int p=0; //explosion code
          while (p<50) {
            objectss.add(new ExplosionE (x, y, random(-3, 3), random(-3, 3), 25, #FFFFB8)); //enemy bullet parameters are x,y,vx,vy
            p++;
          }
        }
      }
      i++;
    }



    //remove if it goes off screen
    if (offScreen()) lives=0;
  }
  void show() {
    pushMatrix();
    translate(x, y);
    image(coin, 0, 0, size, size); //290,420
    popMatrix();
  }
}
