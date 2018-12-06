PShape insect, body, leg1, leg2, leg3, leg4;  // These are the Pshape objects needed to create a  shape of insect
//These Pvectors will be used  make the insect move
PVector dstart;
PVector dmove;
PVector dspeed;
float randommove = random(-.1, .1);

//The following setups a new 2d array for randomly drawing different sized circles for the top of the tree.
int ntreetop = 5;
int[][] treedata = new int[ntreetop][ntreetop];

void setup() { 
  size(400, 400);
  CreateInsect();
  dstart = new PVector(50, 325); //starting location for the insect
  dmove = new PVector(1, randommove); //how fast the insect will increase the speed
  dspeed = new PVector(0.1, 0.1); //The speed an object moves.


  for (int n = 0; n < ntreetop; n++) {
    for (int n2 = 0; n2 < ntreetop; n2++) {
      treedata[n][n2] = int(random(200, 250));
    }
  }
}

void draw() {
  background(0, 200, 255); //sky
  fill(0, 255, 0);
  noStroke();
  rect(0, 300, 400, 400); //grass
  fill(150, 100, 55);
  rect(20, 25, 55, 300); //tree trunk
  fill(0, 150, 75);
  stroke(0, 100, 50);
  strokeWeight(5);

  //This for loop displays multiple tops to the tree 
  for (int tt = 0; tt < ntreetop; tt++) {
    for (int tt2 = 0; tt2 < ntreetop; tt2++) {
      float rstart = random(15, 50);
      ellipse(rstart, rstart, treedata[tt][tt2], treedata[tt][tt2]);
    }
  }

  pushMatrix();
  translate(300, 100);
  rotate(frameCount/50.0);
  noStroke();
  shiningsun(0, 0, 50, 20);  //draws a jagged edged circle that moves so the sun shines
  popMatrix();

  // this loops 10 times to draw insects at varying locations, sizes and rotations
  //for (int d = 0; d < 10; d += 1) {
  pushMatrix();
  translate(dstart.x, 325);
  rotate(TWO_PI/4);
  //scale(random(-2.1, 2.1));
  scale(1.5);
  shape(insect);
  popMatrix();

  if (dstart.x >  420) {
    //This is checking to see if the insect reached the side and resets the start position to make the insect walk across again
    dstart.set(0, 325);
  }

  dmove.add(dspeed);
  dmove.limit(3);
  dstart.add(dmove);

  //}
}

void shiningsun(float x, float y, float sunsize, int sides) {
  //This function draws the sun with the number of sides. 20 sides makes it look fairly round but helps to show when its moving
  //if it was round you could not tell it was being moved
  float angle = TWO_PI/sides; //This variable determines how many times to do the for loop
  fill(255, 255, 0);
  beginShape();
  for (float i = 0; i < TWO_PI; i += angle) {
    float sx = x + cos(i) * sunsize;
    float sy = y + sin(i) * sunsize;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void   CreateInsect() {
  // This function is creating the PShape insect as a group of shapes that can be used later to easily recreate this new shape
  color c = color(64, 64, 64);
  insect = createShape(GROUP);

  body = createShape(ELLIPSE, 40, 40, 5, 20);
  body.setFill(c);
  leg1 = createShape(LINE, 35, 47, 45, 52);
  leg1.setStroke(c);
  leg1.setStrokeWeight(2);
  leg2 = createShape(LINE, 35, 52, 45, 47);
  leg2.setStroke(c);
  leg2.setStrokeWeight(2);
  leg3 = createShape(LINE, 35, 32, 45, 37);
  leg3.setStroke(c);
  leg3.setStrokeWeight(2);
  leg4 = createShape(LINE, 35, 37, 45, 32);
  leg4.setStroke(c);
  leg4.setStrokeWeight(2);


  // Add the body and wing shapes to the dragonfly group
  insect.addChild(body);
  insect.addChild(leg1);
  insect.addChild(leg2);
  insect.addChild(leg3);
  insect.addChild(leg4);
}
