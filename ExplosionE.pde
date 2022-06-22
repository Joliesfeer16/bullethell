class ExplosionE extends GameObjectE { //for enemy to shoot

  //constructor
  ExplosionE(float x, float y, float vx, float vy, float size, color c) { //use parameters to make multiple players
    super(x, y, vx, vy, size, c, 1);
  }

  void show() {
    fill(c);
    circle(x, y, size);
    size--;
    if (size<0) {
      lives = 0;
    }
  }
}
