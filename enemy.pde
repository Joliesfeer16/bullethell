class Enemy extends GameObject { //enemy one

  int cooldown, threshold;


  Enemy() { //blue enemy
    super(random(width), -20, 0, 2, 60, #FC4280, 1);
    threshold = 30; //can shoot a bullet once every 30 second
    cooldown  = threshold;
  }

  void act() {
    super.act();

    //shoot enemy bullets
    cooldown ++;
    if ( cooldown >= threshold) {
      objects.add( 0, new EnemyBullet (x, y, 0, 7, 10, #FC4280)); //enemy bullet parameters are x,y,vx,vy
      // objects.add(new EnemyBullet (x, y, 0, -10, 15, #F01BB4 )); //enemy bullet will go to our x and y
      cooldown = 0;
    }


    //collision code
    int i=0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet || obj instanceof BulletExtra|| obj instanceof BulletLast) {
        if (collidingWith(obj)) {
          lives--;
          score++;
          obj.lives = 0;
          objects.add (new PowerupEnemy(x, y, 0, 0, 15, #FC4280, 1));
          //objects.remove();
          int p=0; //explosion code
          while (p<50) {
            objects.add(new Explosion (x, y, random(-3, 3), random(-3, 3), 25, #FFFFB8)); //enemy bullet parameters are x,y,vx,vy
            p++;
          }
        }
      }
      i++;
    }


    //green powerup, makes bullet 2 shoot enemies, no new power up
    int i2=0;
    while (i2 < objects.size()) {
      GameObject obj = objects.get(i2);
      if (obj instanceof Bullet2) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          score++;
          int p2=0; //explosion code
          while (p2<50) {
            objects.add(new Explosion (x, y, random(-3, 3), random(-3, 3), 25, #FFFFB8)); //enemy bullet parameters are x,y,vx,vy
            p2++;
          }
        }
      }
      i2++;
    }

    //remove if it goes off screen
    if (offScreen()) lives=0;
  }

  void show() {
    fill(c);
    stroke(c);
    triangle(x, y+30, x, y-30, x+70, y);
    circle(x, y, size);
    triangle(x+50, y, x+80, y+25, x+80, y-25);
  }
}
