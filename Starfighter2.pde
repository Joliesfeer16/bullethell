class Starfighter2 extends GameObjectE {

  //rate of fire
  int cooldown, threshold;
  float poo;

  //constructor
  Starfighter2() {
    super(width/2, height/2, 0, 0, 200, #FF0000, 40); //x,y,vx,vy,size,color,lives
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
      objectss.add(new BulletE()); //every time you hit space, a bullet shows up
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
  }



  ////powerup code (enemy diamond power up; makes it go faster)
  //int k=0;
  //while (k < objects.size()) {
  //  GameObject obj = objects.get(k);
  //  if (obj instanceof PowerupDiamond) {
  //    if (collidingWith(obj)) {
  //      lives--;
  //      obj.lives = 0;
  //      player1.poo = player1.poo * 1.1; //enemydiamond power up makes
  //    }
  //  }
  //  k++;
  //}

  void show() {
    //POSEIDON
    pushMatrix();
    translate(x, y);
    image(trident, 0, 0, size, size); //290,420
    popMatrix();
  }
}

//================================================================================
