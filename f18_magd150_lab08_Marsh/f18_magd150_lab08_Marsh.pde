PFont font1, font2, font3;
String dyslexic = "I am Dyslexic";
 float angle = 0;
 boolean saveframe;
 import processing.pdf.*;

void setup() { 
  size(400, 400);
  font1 = createFont("Arial Rounded Bold", 18);
  font2 = createFont("Impact", 24);
  font3 = createFont("Impact", 48);

}
 
void draw() {
    if (saveframe) {
     //saveframe will be set to true if the user presses the ‘s’ key
     //according to processing.org the #### will be replaced with the frame number
      beginRecord(PDF,  "dysframe-####.pdf");
  }  
  background(0);
    // setup several string variables to display on the screen
  String focus = "Focus on my";
  String a1 = "ABILITY";
  String not = "not my";
  String d1 = "dis-ABILITY";
  //For each of the strings, choose the text alignment, text color and location for the next. 
  //This will print the text in a static location.
  textFont(font1);
  textAlign(CENTER);
  fill(255); //white color for first text
  text(focus, width/2, 20);
  
  textFont(font3);
  textAlign(CENTER);
  fill(50, 220, 240); //blue color for ABILITY
  text(a1, width/2, 65);
  
  textFont(font1);
  textAlign(RIGHT);
  fill(255); //white
  text(not, width/2, 85);
  
  textFont(font2);
  textAlign(LEFT);
  fill(100); //gray
  text(d1, width/2, 110);

//The following set of lines makes the text string ‘I am Dyslexic’ spin a little more every time through draw.
  textFont(font1);
  textAlign(CENTER);
  fill(240, 120, 250); //pink
  pushMatrix();
    translate(290, 275);
    rotate(angle);
    text(dyslexic, 0, 0);
 popMatrix();

//(change the angle to rotate the text for the next time through draw();
angle = angle + TWO_PI/128;

textFont(font1);
textAlign(LEFT);
fill(240, 120, 250); //pink
int y = 175;

//this section loads text from a file and displays each line on the screen.
String[] dystext = loadStrings("dyslexic.txt");

for (int i = 0 ; i < dystext.length; i++) {
  text(dystext[i], 15, y);
  y = y + 20;
}
if (saveframe) {
   endRecord();
  saveframe = false;
}
}

void keyPressed() {
  //if the user presses the ‘s’ key it will turn the boolean variable to record a frame the next time through               
  //draw() and then save to a pdf file.
  if (key == 's') {
   saveframe = true;
  }
}
