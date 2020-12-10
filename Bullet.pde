class Bullet extends Floater {
  private int lifetime = 90;
  public Bullet(Spaceship theShip) {
    myCenterX = theShip.getCenterX();
    myCenterY = theShip.getCenterY();
    myXspeed = theShip.getXspeed();
    myYspeed = theShip.getYspeed();
    myPointDirection = theShip.getPointDirection();
    accelerate(7);
  }
  public void show() {
    noStroke();
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, 7, 7);
  }
  public void die() {
    lifetime--;  
  }
  public int getLifetime() {
    return lifetime;  
  }
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
}
