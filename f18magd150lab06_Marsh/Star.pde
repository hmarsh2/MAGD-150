class Star {
  float r, g, b;
  float xloc;
  float yloc ;
  float movex;
  float movey;
 
Star() { 
  xloc=random(width);
  yloc=random(height);
  movex = random(1,5);
  movey = random(1, 5);
}
 
void changecolor() {
//randomly choose a color for the star
  r = random(1, 255);
  g = random(1, 255);
  b = random(1, 255);
  fill(r, g, b);
}
 
void movestar() {
  xloc = xloc + movex;
  yloc = yloc + movey;
}
 
void drawstar() {
  stroke(255);
  strokeWeight(5); 
  //draw each line that makes the star shape
  beginShape();
   vertex(xloc, yloc);
   vertex(xloc+14, yloc+30);
   vertex(xloc+47, yloc+35);
  vertex(xloc+23, yloc+57);
  vertex(xloc+29, yloc+90);
  vertex(xloc, yloc+75);
  vertex(xloc-29, yloc+90);
  vertex(xloc-23, yloc+57);
  vertex(xloc-47, yloc+35);
  vertex(xloc-14, yloc+30);
  endShape(CLOSE);
}
}
