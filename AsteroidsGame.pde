private Spaceship player = new Spaceship();
private Star[] sky = new Star[500];
private boolean leftPressed, rightPressed, accelerating = false;
private boolean backgroundON = true;
public boolean getAccelerating() {
  return accelerating;
}
public void setup() 
{
  size(600, 600);
  for(int i = 0; i < sky.length; i++) {
    sky[i] = new Star();  
  }
  for(int i = 0; i < 41; i++) {
    sky[i] = new Planet();
  }
}
public void draw() 
{
  if(backgroundON) {
    background(0);
  }
  for(int i = 0; i < sky.length; i++) {
    sky[i].show();  
  }
  player.move();
  player.show();
  if(leftPressed) {
    player.turn(-5);
  }
  if(rightPressed) {
    player.turn(5);
  }
  if(accelerating) {
    player.accelerate(0.1);  
  }
}
public void keyPressed() {
  if(key == 'a' || key == 'A') {
    leftPressed = true;
  }
  if(key == 'd' || key == 'D') {
    rightPressed = true;  
  }
  if(keyCode == SHIFT) {
    backgroundON = false;
    fill(255, 255, 255, 150);
    ellipse((float)player.getCenterX(), (float)player.getCenterY(), 80, 80);
    player.hyperspace();
    backgroundON = true;
  }
  if(key == 'w' || key == 'W'){
    accelerating = true;
  }
}
public void keyReleased() {
  if(key == 'a' || key == 'A') {
    leftPressed = false;
  }
  if(key == 'd' || key == 'D') {
    rightPressed = false;  
  }
  if(key == 'w' || key == 'W'){
    accelerating = false;
  }
}
