class EnemyDiamond extends GameObject {

  int cooldown, threshold;
  float diamondA= PI/4;

  //contructor variable
  EnemyDiamond() {
    super(random(width), -50, 0, 5, 40, #FA8347, 1); //enemy characterisitcs
    threshold = 20; //can shoot a bullet once every 30 second
    cooldown  = threshold;
  }


  void show() {
    diamond(x, y, diamondA);
    diamondA += PI/180;
  }


  //behavior variable
  void act() {
    super.act();

    //shoot enemydiamond bullets
    cooldown ++;
    if ( cooldown >= threshold) {
      objects.add(0, new EnemyBullet (x, y, -5, -5, 10, #FA8347)); //enemy bullet parameters are x,y,vx,vy
      objects.add(0, new EnemyBullet (x, y, 5, 5, 10, #FA8347 )); //enemy bullet will go to our x and y
      objects.add(0, new EnemyBullet (x, y, -5, 5, 10, #FA8347)); //enemy bullet will go to our x and y
      objects.add(0, new EnemyBullet (x, y, 5, -5, 10, #FA8347)); //enemy bullet will go to our x and y

      cooldown = 0;
    }

    //collision code
    int i=0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet|| obj instanceof BulletExtra) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          score++;
          objects.add (new PowerupDiamond(x,y,0,0,15,#FA8347,1));
          int p=0;
          while (p<50) {
            objects.add(new Explosion (x, y, random(-3, 3), random(-3, 3), 25, #FFFFB8)); //enemy bullet parameters are x,y,vx,vy
            p++;
          }
        }
      }
      i++;
    }

    //green powerup, makes bullet 2 shoot enemies, no new power up dropped
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




  void diamond (float x, float y, float angle) {
    fill(#FA8347);
    stroke(c);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    triangle(0, 0+20, 0, 0-20, 0+50, 0);
    circle(0, 0, size);
    triangle(0+45, 0, 0+70, 0+15, 0+70, 0-15);

    popMatrix();
  }
}
