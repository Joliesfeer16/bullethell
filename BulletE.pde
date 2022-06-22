class BulletE extends GameObjectE {
  //overloading

  //constructor
  BulletE () {
    super(player2.x, player2.y, 0, -10, 15, #FFFFB8, 1); //parameter (x,y,vx,vy,size,c,lives)
  }

  void act() {
    super.act();
    if (offScreen()) lives = 0;
  }
  void show() {
    fill(c); //c is whatever is initialized in object tab
    circle(x, y, size);
  }
}
