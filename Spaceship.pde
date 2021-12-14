class Spaceship extends Floater {
  int myRadius;
  public Spaceship() {
    myRadius = 12;
    corners = 7;  //the number of corners, a triangular floater has 3   
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 16;
    yCorners[0] = 0;
    xCorners[1] = 0;
    yCorners[1] = 12;
    xCorners[2] = -4;
    yCorners[2] = 5;
    xCorners[3] = -9;
    yCorners[3] = 7;
    xCorners[4] = -9;
    yCorners[4] = -7;
    xCorners[5] = -4;
    yCorners[5] = -5;
    xCorners[6] = 0;
    yCorners[6] = -12;
    myColor = 255;   
    myCenterX = 250; 
    myCenterY = 250;   
    myXspeed = 0; 
    myYspeed = 0; //holds the speed of travel in the x and y directions   
    myPointDirection = 0; //holds current direction the ship is pointing in degrees
  }

  public void showFlame() {
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    stroke(17, 198, 206);
    fill(17, 198, 206);
    triangle(xCorners[3], yCorners[3], xCorners[4], yCorners[4], ((xCorners[3] + xCorners[4])/2) - 15, (yCorners[3] + yCorners[4])/2);
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void SpaceshipSpeedCap() {
    if (myYspeed > 3) {
      myYspeed = 3;
    }
    if (myYspeed < -3) {
      myYspeed = -3;
    }
    if (myXspeed > 3) {
      myXspeed = 3;
    }
    if (myXspeed < -3) {
      myXspeed = -3;
    }
  }
  public void checkAstShipCollision() {
    for (int i = 0; i < asteroidField.size(); i++) {
      if (timeSinceCollision >= 30) {
        if (dist((float)asteroidField.get(i).myCenterX, (float)asteroidField.get(i).myCenterY, (float)myCenterX, (float)myCenterY) < asteroidField.get(i).astRadius + myRadius) {
          timeSinceCollision = 0;
          if (asteroidField.get(i).getAstSize() < 4) {
            asteroidField.add(new Asteroid(asteroidField.get(i).getAstSize() + 1, asteroidField.get(i).getAstType(), asteroidField.get(i).getMyCenterX() + asteroidField.get(i).getAstRadius()/2, asteroidField.get(i).getMyCenterY() - asteroidField.get(i).getAstRadius()/2, asteroidField.get(i).getXspeed(), asteroidField.get(i).getYspeed()));
            asteroidField.add(new Asteroid(asteroidField.get(i).getAstSize() + 1, asteroidField.get(i).getAstType(), asteroidField.get(i).getMyCenterX() - asteroidField.get(i).getAstRadius()/2, asteroidField.get(i).getMyCenterY() + asteroidField.get(i).getAstRadius()/2, asteroidField.get(i).getXspeed(), asteroidField.get(i).getYspeed()));
          }
          asteroidField.remove(i);
        }
      }
    }
  }
  public void setX(int n) {
    myCenterX = n;
  }
  public void setY(int n ) {
    myCenterY = n;
  }
  public void setYspeed(double n) {
    myYspeed = n;
  }
  public void setXspeed(double n) {
    myXspeed = n;
  }
  public double getXspeed() {
    return myXspeed;
  }
  public double getYspeed() {
    return myYspeed;
  }
  public void setMyColor(int n) {
    myColor = n;
  }
}
