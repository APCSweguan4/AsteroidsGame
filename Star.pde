class Star //note that this class does NOT extend Floater
{
  protected int myX, myY, mySize, myColor, myOpacity;
  public Star() {
    myOpacity = (int)(Math.random() * 130) + 125;
    myX = (int)(Math.random() * 601);
    myY = (int)(Math.random() * 601);
    mySize = (int)(Math.random() * 5) + 1;
    myColor = color(235, 235, 150, myOpacity);
  }
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, mySize, mySize);
  }
}
