private ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
private ArrayList <Bullet> bullets = new ArrayList <Bullet>();
private Spaceship player = new Spaceship();
private Star[] sky = new Star[500];
private boolean leftPressed, rightPressed, accelerating, hyperspacing = false;
private int countdown = 30;
private int shotCooldown = 0;
public boolean getAccelerating() {
  return accelerating;
}
public void setup() 
{
  frameRate = 60;
  size(600, 600);
  for (int i = 0; i < sky.length; i++) {
    sky[i] = new Star();
  }
  for (int i = 0; i < 41; i++) {
    sky[i] = new Planet();
  }
  for (int i = 0; i < ((int)(Math.random() * 8) + 3); i++) {
    asteroids.add(new Asteroid());
  }
}
public void draw() 
{
  if (hyperspacing == false) {
    background(0);
  } else {
    if (countdown % 15 == 0) {
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
    if (countdown == 0) {
      hyperspacing = false;
    }
  }
  for (int i = 0; i < sky.length; i++) {
    sky[i].show();
  }
  for (int i = 0; i < asteroids.size(); i++) {
    if (dist((float)player.getCenterX(), (float)player.getCenterY(), (float)asteroids.get(i).getCenterX(), (float)asteroids.get(i).getCenterY()) < 27) {
      asteroids.remove(i);
    } else {
      if (!hyperspacing) {
        asteroids.get(i).move();
      }
      asteroids.get(i).show();
    }
  }
  for (int i = 0; i < bullets.size(); i++) {
    if(!hyperspacing) {
      bullets.get(i).die();
    }
    if (bullets.get(i).getLifetime() > 0) {
      if (!hyperspacing) {
        bullets.get(i).move();
      }
      bullets.get(i).show();
    } else {
      bullets.remove(i);
    }
  }
  for (int i = 0; i < bullets.size(); i++) {
    for (int nI = 0; nI < asteroids.size(); nI++) {
      if (dist((float)bullets.get(i).getCenterX(), (float)bullets.get(i).getCenterY(), (float)asteroids.get(nI).getCenterX(), (float)asteroids.get(nI).getCenterY()) < 25) {
        asteroids.remove(nI);
        bullets.remove(i);
        break;
      }
    }
  }
  player.move();
  player.show(hyperspacing);
  if (leftPressed) {
    player.turn(-5);
  }
  if (rightPressed) {
    player.turn(5);
  }
  if (accelerating) {
    player.accelerate(0.04);
  }
  if (shotCooldown > 0) {
    shotCooldown--;
  }
}
public void keyPressed() {
  if (key == 'a' || key == 'A') {
    leftPressed = true;
  }
  if (key == 'd' || key == 'D') {
    rightPressed = true;
  }
  if (keyCode == SHIFT) {
    countdown = 30;
    hyperspacing = true;
    player.hyperspace();
  }
  if (key == 'w' || key == 'W') {
    accelerating = true;
  }
  if (key == ' ') {
    if (shotCooldown == 0) {
      bullets.add(new Bullet(player));
    }
    shotCooldown = 10;
  }
}
public void keyReleased() {
  if (key == 'a' || key == 'A') {
    leftPressed = false;
  }
  if (key == 'd' || key == 'D') {
    rightPressed = false;
  }
  if (key == 'w' || key == 'W') {
    accelerating = false;
  }
}
