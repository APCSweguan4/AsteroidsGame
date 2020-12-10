private ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
private ArrayList <Bullet> bullets = new ArrayList <Bullet>();
private Spaceship player = new Spaceship();
private Star[] sky = new Star[500];
private boolean leftPressed, rightPressed, accelerating, hyperspacing = false;
private boolean playerAlive = true;
private int countdown = 30;
private int shotCooldown = 0;
private int deathCountdown = 60;
private int invinTimer = 120;
private int lives = 3;
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
  player.invinsibility();
}
public void draw() 
{
  if (lives == 0) {
     playerAlive = false;  
  }
  if (playerAlive) {
    if (player.getInvinsible() && (invinTimer > 0)) {
      invinTimer--;
    } else { 
      invinTimer = 300;
      if (player.getInvinsible()) {
        player.invinsibility();
      }
    }
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
        if (player.getInvinsible() == false) {
          if (lives > 0) { 
            lives--;
            if(lives >= 1) {
              deathAni();
            }
          }
        }
      } else {
        if (!hyperspacing) {
          asteroids.get(i).move();
        }
        asteroids.get(i).show();
      }
    }
    for (int i = 0; i < bullets.size(); i++) {
      if (!hyperspacing) {
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
    if (player.getInvinsible() && (invinTimer > 0)) {
      if (!hyperspacing)
        player.invinRing();
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
  } else {
    if (deathCountdown > 0) {
      deathCountdown--;
    }
    gameOver();
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
  if (!playerAlive && (key == 'r' || key == 'R')) {
    deathCountdown = 60;
    playerAlive = true;
    for (int i = 0; i < sky.length; i++) {
      sky[i] = new Star();
    }
    for (int i = 0; i < 41; i++) {
      sky[i] = new Planet();
    }
    bullets = new ArrayList <Bullet>();
    asteroids = new ArrayList <Asteroid>();
    for (int i = 0; i < ((int)(Math.random() * 8) + 3); i++) {
      asteroids.add(new Asteroid());
    }
    player = new Spaceship();
    invinTimer = 120;
    player.invinsibility();
    lives = 3;
  }
  if (key == 'd') {
    playerAlive = false;
    lives = 0;
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
public void gameOver() {
  if (deathCountdown > 0) {
    if (deathCountdown % 15 == 0) {
      fill(205, 205, 205, 100);
      stroke(205, 205, 205, 100);
      ellipse((float)player.getCenterX(), (float)player.getCenterY(), 50, 50);
    }
    if (deathCountdown % 10 == 0) {
      fill(0);
      stroke(0);
      ellipse((float)player.getCenterX(), (float)player.getCenterY(), 50, 50);
    }
  }
  if (deathCountdown == 0) {
    background(0);
    for (int i = 0; i < sky.length; i++) {
      sky[i].show();  
    }
    for (int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).show();  
      asteroids.get(i).move();
    }
  }
  if (lives == 0) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    textSize(80);
    text("GAME OVER", 65, 300);
    stroke(255);
    fill(255);
    textSize(20);
    text("Press 'R' To Restart", 205, 350);
  }
}

public void deathAni() {
  gameOver();
  deathCountdown = 60;
  playerAlive = true;
  player = new Spaceship();
  invinTimer = 120;
  player.invinsibility();
}
