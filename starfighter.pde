
class Starfighter extends GameObject {


  //rate of fire
  int cooldown, threshold;
  float poo;

  //constructor
  Starfighter() {
    super(width/2, height/2, 0, 0, 120, #000000, 50); //x,y,vx,vy,size,color,lives
    threshold = 10; //can shoot a bullet once every 30 second
    cooldown  = threshold;
    type = 1;
    poo  = 5;
  }

  //behavior
  void act() {
    super.act(); //general act from gameobject

    //ticks down by 1 each frame

    //managing bullet shoot
    cooldown ++;
    if (space && cooldown >= threshold) {
      objects.add(new Bullet()); //every time you hit space, a bullet shows up
      objects.add(new BulletExtra()); //every time you hit space, a bullet shows up
      objects.add(new BulletLast()); //every time you hit space, a bullet shows up


      cooldown = 0;
    }

    //controlling starfighter
    if (up)     vy = -poo;
    if (down)   vy =  poo;
    if (left)   vx = -poo;
    if (right)  vx =  poo;
    if (!up && !down) vy = vy * 0.9; // slow down ! means if up is not pressed
    if (!left && !right) vx = vx * 0.9;

    //limits on edges
    if (x> width ) {
      x =0;
    }
    if (x< -20 ) {
      x = width;
    }
    if (y> height) {
      y = 0;
    }
    if (y< 0) {
      y = height;
    }

    //collision code (if enemy hits starfighter)
    int i=0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          int p=0; //explosion code
          while (p<35) {
            objects.add(new Explosion (x, y, random(-3, 3), random(-3, 3), 25, #E10F20)); //enemy bullet parameters are x,y,vx,vy
            p++;
          }
        }
      }
      i++;
    }

    //powerup code (enemy diamond power up; makes it go faster)
    int k=0;
    while (k < objects.size()) {
      GameObject obj = objects.get(k);
      if (obj instanceof PowerupDiamond) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          player1.poo = player1.poo * 1.1; //enemydiamond power up makes
        }
      }
      k++;
    }

    //powerup code (enemy bonus; takes it to bonus tab)
    int m=0;
    while (m < objects.size()) {
      GameObject obj = objects.get(m);
      if (obj instanceof PowerupBonus) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          mode=BONUS; //enemydiamond power up makes
          timer2 = 500;
        }
      }
      m++;
    }


    //powerup code (enemy horizontal; makes the starfighter have more bullets)
    int c=0;
    while (c < objects.size()) {
      GameObject obj = objects.get(c);
      if (obj instanceof PowerupHorizontal) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          int q=0;
          while (q<40) {
            objects.add(new Bullet2()); //every time you hit space, a bullet shows up
            q++;
          }
        }
      }
      c++;
    }

    //powerup code (enemy regular; makes it grow in size)
    int u=0;
    while (u < objects.size()) {
      GameObject obj = objects.get(u);
      if (obj instanceof PowerupEnemy) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          player1.size= player1.size * 1.1;
        }
      }
      u++;
    }

    if (lives <= 0) {
      int p=0; //explosion code final
      while (p<200) {
        objects.add(new Explosion (x, y, random(-10, 10), random(-10, 10), 40, #E10F20)); //enemy bullet parameters are x,y,vx,vy
        p++;
        timer = 100;
      }
    }
  }

  void show() {
    fill(c);


    //POSEIDON
    pushMatrix();
    translate(x, y);
    image(trident, 0, 0, size, size); //290,420
    popMatrix();

  }
}
