class Bullet extends Floater {
  private int lifetime = 120;
  public Bullet(Spaceship theShip) {
    myCenterX = theShip.getCenterX();
    myCenterY = theShip.getCenterY();
    myXspeed = theShip.getXspeed();
    myYspeed = theShip.getYspeed();
    myPointDirection = theShip.getPointDirection();
    accelerate(6);
  }
  public void show() {
    noStroke();
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  public void die() {
    lifetime--;  
  }
  public int getLifetime() {
    return lifetime;  
  }
}
