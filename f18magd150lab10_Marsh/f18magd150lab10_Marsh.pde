//The images are ones I took last year.
//I am referencing a site regarding a warning my sketch gets when running
//it on my MacOS. It's a known bug.
//https://github.com/processing/processing/issues/5462 This is a reference to a 
//bug on MacOS for the following error:
//2018-11-22 11:20:46.566 java[778:83019] pid(778)/euid(501) is calling TIS/TSM in 
//non-main thread environment, ERROR : This is NOT allowed. Please call TIS/TSM in 
//main thread!!!

PImage straws, stexture;
PShape round;
float[][] hill;


void setup() {
  size(600, 400, P3D);
  background(0);  
  noStroke();
  
  //This section of code creates and saves a 2D texture
  straws = loadImage("straws - small.jpg");
  textureMode(NORMAL);
  for (float y = 0; y < 360; y +=5) {
    beginShape(TRIANGLE_STRIP);
    texture(straws);
    for (float x = 0; x < 570; x += 5) {
      float u = map(x, 0, 570, 0, 1);
      float v = map(y, 0, 360, 0, 1);
      vertex(x, y, u, v);
      vertex(x, y+5, u, v);
    }
    endShape();
  }
  save("texturedstraws.tif");

  //This builds an array to allow dimension in the mesh
  hill = new float[400][400];
  for (int y = 0; y < 400; y++) {
    for (int x = 0; x < 400; x++) {
      if (x < 150) {
        hill[x][y] = 5;
      } else if ((x > 149) && (x < 275)) {
        hill[x][y] = x*.1;
      } else if ((x > 274) && (x < 351)) {
        hill[x][y] = x/25;
      } else if (x > 350) {
        hill[x][y] = 5;
      } else
        hill[x][y] = 5;
    }
  }
}

void draw() {
  background(0);

  noFill();
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-width/2, -height/2);
  stexture = loadImage("swirls - small.jpg");

  //this builds a 3d mesh textured with the swirls image
  textureMode(NORMAL);
  for (int y = 0; y < 400; y++) {
    beginShape(TRIANGLE_STRIP);
    texture(stexture);
    for (int x = 0; x < 400; x++) {
      float u = map(x, 0, 400, 0, 1);
      float v = map(y, 0, 400, 0, 1);
      vertex(x*1.25, y, hill[x][y], u, v);
      vertex(x*1.25, (y+1), hill[x][y], u, v);
    }
    endShape();
  }
  popMatrix();

  pushMatrix();
  directionalLight(255, 50, 50, 0, 1, 0);
  translate(200, 200, 125);
  fill(255, 0, 0);
  sphere(40);
  popMatrix();

  fill(0, 0, 255);
  pointLight(30, 30, 240, 350, 135, 50);
  translate(370, 150, 15);
  box(50);
  
  //Using mouseX and mouseY makes the camera angle move
  camera(mouseX, mouseY, (height/2 / tan(PI/6)), mouseX, height/2, 0, 0, 1, 0);
}
