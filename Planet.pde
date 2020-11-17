class Planet extends Star {
  private boolean hasRing;
  private int randNum;
  public Planet() {
    randNum = (int)(Math.random() * 3);
    if(randNum == 1) {
      hasRing = true;  
    } else {
      hasRing = false;  
    }
    myX = (int)(Math.random() * 601);
    myY = (int)(Math.random() * 601);
    mySize = (int)(Math.random() * 8) + 8;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256), 120);
  }
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, mySize, mySize);
    stroke(myColor);
    strokeWeight(2.5);
    strokeCap(ROUND);
    if(hasRing) {
      line(myX - mySize, myY, myX + mySize, myY);
    }
  }
}
