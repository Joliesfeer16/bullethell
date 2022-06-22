// powerup in enemy bullet, powerup in starfighter
// enemies drop a bullet when hit by starfighter, when starfighter collides with power up it will activate it

class PowerupDiamond extends GameObject {

  //constructor
  PowerupDiamond(float x, float y, float vx, float vy, float size, color c, int lives) { //use parameters to make multiple players
    super(x, y, vx, vy, size, c, 1);
  }
}
