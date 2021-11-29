boolean rightIsPressed = false;
boolean leftIsPressed = false;
boolean upIsPressed = false;
Star[] Starfield = new Star[250];
Spaceship bob = new Spaceship();
public void setup() {
  size(500, 500);
  for(int i = 0; i < Starfield.length; i++){
    Starfield[i] = new Star();
  }
}
public void draw() {
  background(0, 0, 0);
  for(int i = 0; i < Starfield.length; i++){
   Starfield[i].show(); 
  }
  bob.move();
  bob.show();
  if (rightIsPressed == true) {
    bob.turn(4);
  }
  if (leftIsPressed == true) {
    bob.turn(-4);
  }
  if (upIsPressed == true) {
    bob.accelerate(0.06);
    bob.showFlame();
  }
  bob.SpaceshipSpeedCap();
}

//Move Detection
public void keyPressed() {
  if (keyCode == RIGHT) {
    rightIsPressed = true;
  }
  if (keyCode == LEFT) {
    leftIsPressed = true;
  }
  if (keyCode == UP) {
    upIsPressed = true;
  }
  if(keyCode == SHIFT){
    bob.setX((int)(Math.random()*250));
    bob.setY((int)(Math.random()*250));
    bob.setXspeed(0);
    bob.setYspeed(0);
  }
}

public void keyReleased() {
  if (keyCode == RIGHT) {
    rightIsPressed = false;
  }
  if (keyCode == LEFT) {
    leftIsPressed = false;
  }
  if (keyCode == UP) {
    upIsPressed = false;
  }
}

public void SpaceshipSpeedCap(){
 if(bob.getYspeed() > 2.5){
  bob.setYspeed(2.5); 
 }
 if(bob.getXspeed() > 2.5){
  bob.setXspeed(2.5); 
 }
}
