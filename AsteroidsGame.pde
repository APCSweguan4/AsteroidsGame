private Spaceship player = new Spaceship();
private Star[] sky = new Star[500];
private boolean leftPressed, rightPressed, accelerating, hyperspacing = false;
private int countdown = 10;
public boolean getAccelerating() {
  return accelerating;
}
public void setup() 
{
  frameRate = 60;
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
  if(hyperspacing == false) {
    background(0);
  } else {
    if(countdown % 15 == 0) {
      fill(205, 205, 205, 10);
      stroke(205, 205, 205, 10);
      rect(-10, -10, 610, 610);
    }
    if (countdown % 10 == 0) {
      fill(0);
      stroke(0);
      rect(-10, -10, 610, 610);
    }
    countdown--;
    if(countdown == 0) {
      hyperspacing = false;  
    }
  }
  for(int i = 0; i < sky.length; i++) {
    sky[i].show();  
  }
  player.move();
  player.show(hyperspacing);
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
    countdown = 30;
    hyperspacing = true;
    player.hyperspace();
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
