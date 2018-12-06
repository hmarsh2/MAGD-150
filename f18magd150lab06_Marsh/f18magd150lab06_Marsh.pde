//This program was built with ideas from both example 10-7 Many Drops 
//from the text book and how to draw a star from D. Shiffman 4.7 video

//Create an array of stars
Star[] stars = new Star[100];
int totalStars=0;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(0);
//initialize one star
  stars[totalStars] = new Star();
 
//increment each time through draw
  totalStars++;
 
 if (halfway(totalStars)) {
   fill(150);
   rect(0, 0, 400, 40);
 }
 
//when the end of the array happens, start over
if (totalStars >= stars.length) {
  totalStars = 0;
}
screensaver(); 
}

boolean halfway(int numStars) {
  //This function returns either true of false to indicate if the
  //program is halfway throught displaying all the stars
   if (numStars >= stars.length/2) {
     return true;
} else {
   return false;
}
}

void screensaver() {
  // This calls the class method to select a random color for the star, 
  //then it calls a class method to move the stars and then draw the stars
for (int i=0; i < totalStars; i++) {
  stars[i].changecolor();
  stars[i].movestar(); 
  stars[i].drawstar();
  }
}
