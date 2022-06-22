abstract class GameObjectE {

  //instance variable (put all the variables that are in common in all objects)
  float x, y, vx, vy, size;
  color c;
  int lives;
  int type = 0;

  //contructor
  GameObjectE(float x, float y, float vx, float vy, float size, color c, int lives) { //parameters is to generalize contructors
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.size = size;
    this.c = c;
    this.lives = lives;
  }

  //behavior

  void act() {
    x += vx;
    y += vy;
  }

  void show() {
    fill(c); //c is whatever is initialized in object tab
    square(x, y, size);
  }

  boolean collidingWith(GameObjectE objs) {
    return dist(objs.x, objs.y, x, y) < objs.size/2 + size/2;
  }

  boolean offScreen() {
    return x < 0 || x > width || y < -50 || y > height ;
  }
}
