class Bullet2 extends GameObject {
  //overloading

  //constructor
  Bullet2 () {
    super(player1.x, player1.y, random(-20, 20), random(-20, 20), 15, #FFFFB8, 1); //parameter (x,y,vx,vy,size,c,lives)
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
