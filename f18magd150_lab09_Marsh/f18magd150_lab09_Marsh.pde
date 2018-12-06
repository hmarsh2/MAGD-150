import processing.sound.*;

import processing.video.*;

//This imports the processing video and sound libraries
import processing.sound.*;
import processing.video.*;

String f = "FARMING";
Movie haybaling;
PImage corn;
SoundFile country;
PFont font1;

void setup() { 
  size(400, 400);
  font1 = createFont("Impact", 48);

//This loads a corn image to the variable corn so it can be displayed
//Picture credit goes to Holly Marsh - I took this picture in my senior year photography class
  corn = loadImage("corn.jpg");

//This loads a movie into the variable haybaling so it can be played on the screen.
//VIdeo credit goes to my dad who took this of me and my brother baling hay over the summer
//The loop() will continue until the sketch exits
  haybaling = new Movie(this, "haybaling.mov");
  haybaling.loop();
    haybaling.volume(0);

//This sound file came from www.bensound.com/royalty-free-music/2 . 
//It’s the song called country boy being loaded into variable country
//The song will loop until the sketch is exited.
  country = new SoundFile(this, "trimmed-bensound-countryboy.wav");
  country.loop();
}
 
void draw() {
  background(0);

//display corn image with a tint to make it darker. It will take up the whole background
  tint(100);
  image(corn, 0, 0, corn.width, corn.height);

 //this code is displaying the title for the sketch/documentary
   textFont(font1);
  textAlign(CENTER);
  fill(255); //white color 
  text(f, width/2, 45);
     noTint(); //changing back to no tinting so the video will play at full brightness


 //this is displaying the movie
   image(haybaling, 10, 50, 200, 150);

//This is displaying the corn image as a fraction of the size of the original but full brightness
  image(corn, 200, 225, corn.width/8, corn.height/8);

//This will make the music play a little faster than the original version
  country.rate(1.25);
}

void movieEvent(Movie haybaling) {
  haybaling.read();
}
