class Spaceship extends Floater  
{   
 private int[] rocketXPoints, rocketYPoints;
 public Spaceship() { //constructor
   rocketXPoints = new int[]{-2, -6, -25, -6, -2};
   rocketYPoints = new int[]{0, -4, 0, 4, 0};
   corners = 5; 
   xCorners = new int[]{-8, 10, -8, -2, -8};   
   yCorners = new int[]{-6, 0, 6, 0, -6};  
   myColor = color(255, 255, 255);   
   myCenterX = myCenterY = 300; 
   myXspeed = myYspeed = 0;
   myPointDirection = (int)(Math.random() * 361);  
 }
 //setters & getters
 public void setXspeed(double speed) {
   myXspeed = speed;
 }
 public double getXspeed() {
   return myXspeed;  
 }
 public void setYspeed(double speed) {
   myYspeed = speed;
 }
 public double getYspeed() {
   return myYspeed;  
 }
 public void setCenterX(double num) {
   myCenterX = num;
 }
 public double getCenterX() {
   return myCenterX;  
 }
 public void setCenterY(double num) {
   myCenterY = num;
 }
 public double getCenterY() {
   return myCenterY;  
 }
 public void setPointDirection(double dir) {
   myPointDirection = dir;  
 }
 public double getPointDirection() {
   return myPointDirection;  
 }
 //^^ end of setters & getters ^^
 public void hyperspace() {
   setCenterX((int)(Math.random() * 601));
   setCenterY((int)(Math.random() * 601));
   setXspeed(0);
   setYspeed(0);
   setPointDirection((int)(Math.random() * 361));
 }
 public void show () {//Draws the floater at the current position             
   fill(myColor);   
   stroke(myColor);    
    
   //translate the (x,y) center of the ship to the correct position
   translate((float)myCenterX, (float)myCenterY);
   
   //convert degrees to radians for rotate()     
   float dRadians = (float)(myPointDirection*(Math.PI/180));
   
   //rotate so that the polygon will be drawn in the correct direction
   rotate(dRadians);
   
   //draw the polygon
   beginShape();
   for (int nI = 0; nI < corners; nI++) {
      vertex(xCorners[nI], yCorners[nI]);
   }
   endShape(CLOSE);

   if(getAccelerating()) {
     fill(255, 0, 0, 200);
     noStroke();
     beginShape();
     for(int i = 0; i < rocketXPoints.length; i++) {
       vertex(rocketXPoints[i], rocketYPoints[i]);  
     }
     endShape(CLOSE);
   }
   //"unrotate" and "untranslate" in reverse order
   rotate(-1*dRadians);
   translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
