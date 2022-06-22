//how to show only one, not a whole class

class EnemyBonus extends GameObject {

  EnemyBonus() { //blue enemy
    super(random(width), -20, -5, 5, 120, #000000, 1);
  }

  void act() {
    super.act();

    //collision code
    int i=0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet|| obj instanceof BulletExtra || obj instanceof BulletLast) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          score++;
          objects.add (new PowerupBonus(x, y, 0, 0, 15, #000000, 1));
          int p=0;
          while (p<50) {
            objects.add(new Explosion (x, y, random(-3, 3), random(-3, 3), 25, #FFFFB8)); //enemy bullet parameters are x,y,vx,vy
            p++;
          }
        }
      }
      i++;
    }
  }

  void show() {
    fill(c);


    //POSEIDON
    pushMatrix();
    translate(x, y);
    image(treasure, 0, 0, size, size); //290,420
    popMatrix();
  }
}
