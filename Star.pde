class Star{
  float myX, myY, mySize, myOpacity;
  Star(){
   myX = (float)(Math.random()*500);
   myY = (float)(Math.random()*500);
   mySize = (float)(Math.random()*3)+0.5;
   myOpacity = (float)(Math.random()*150)+100;
  }
  void show(){
   fill(255,255,255, myOpacity);
   stroke(255,255,255, myOpacity);
   ellipse(myX, myY, mySize, mySize); 
  }
}
