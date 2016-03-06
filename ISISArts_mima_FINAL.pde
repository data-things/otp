import java.text.*;
import java.util.*;
import processing.pdf.*;
import controlP5.*;
import processing.dxf.*;

boolean saveOneFrame = false;
boolean record = false;
boolean drawAvgPathFlag = false;

float y;
int diam=600; // diam of bg ellipses for scale
int translateCenter; // actual size needs to be in setup as it doesnt know the size yet

PGraphics pdf;

void setup () {
  
  slAvg=new float[slName.length]; // creates new variable for pathAvg basd on slName.length (which is a string of 10 names)
  
  size(displayWidth, displayHeight, P3D); //  P3D necessary for save as dxf
  translateCenter = (width/2)+250; // variable to change center 
  frameRate(24);
  smooth();
  gui();
}

float size=1;

void draw() {
  background(255);
  fill(245);
  rect(0, 0, 500, height);

  //average(); //TODO don't need to do this every frame.
  updateValues(); // needs to update values every frame (not in the setup where it only does it once)

  pushMatrix();
  translate (translateCenter, height/2, -10); // to push ellipses into the background
  stroke(225);
  noFill();
  ellipse(0, 0, diam, diam);
  ellipse(0, 0, diam/3, diam/3);
  ellipse(0, 0, (diam/3)*2, (diam/3)*2);
  popMatrix();

  // text for labeling sliders and buttons
  fill(0, 200, 255);
  text("ON THE PRECIPICE - CREATE YOUR OWN SOUVENIR:", 30, 50);
  text("How would you describe your experience?", 30, 90);

  fill(150);
  text("inspiring", 50, 125);
  text("eye-opening", 50, 155);
  text("educational", 50, 185);
  text("confusing", 50, 215);
  text("thought-provoking", 50, 245);
  text("depressing", 50, 275);
  text("different", 50, 305);
  text("weird", 50, 335);
  text("familiar", 50, 365);
  text("calm", 50, 395);
  text("creepy", 50, 425);
  text("exciting", 50, 455);

  fill(0, 200, 255);
  text("Which other words would you add?", 30, 490);
  //text ("On The Precipice explores the effect humans have had on the natural environment", 30, 500);
  text("How far are we from the precipice?", 30, 560);

  fill(125);
  textFont(font, 14);
  text("already beyond", 30, 610);
  text("never going to happen", 300, 610);

stroke(125);
line(30,640, 425,640);

  fill(0, 200, 255);
  textFont(font, 16);
  text("How long was your visit?", 30, 680);
  text("Please indicate your age:", 30, 740);


  textFont(font, 14);
  fill(125);
  text("under 14", 30, 790);
  text("14-20", 120, 790);
  text("21-35", 200, 790);
  text("36-50", 280, 790);
  text("over 50", 360, 790);

  textFont(font, 16);
  fill(0, 200, 255);
  text("Please enter your email:", 30, 830);
  text("Save your shape", 30, 910);
  text("Start new", 300, 910);


  // for save as pdf from here 
  if (saveOneFrame == true) {
    beginRecord(PDF, "shapes/Visitor"+year()+month()+day()+"_"+hour()+minute()+second()+".pdf");
  } // to here 
  
  pushMatrix();
    
  noStroke();
  
  drawPath();
  
  if (drawAvgPathFlag)
    drawAvgPath(); // if called here, interferes with drawPath?

  // drawing the white center circle
  fill(255);  
  ellipse(0, 0, 20, 20);

  // to save as pdf from here
  if (saveOneFrame == true) {
    endRecord();
    saveOneFrame = false;
  }  // to here

  popMatrix();
}


// save button
void save() {
  // save as PDF 
  saveOneFrame = true;
  println("Saved PDF.");

  // saves slider data (stored in table) to a csv file
  saveDataCSV();  
  println("Saved CSV.");
  
  //table has changed to recalculate average
  average();
  drawAvgPathFlag = true;
}

// resetting gui for start new button
void reset() {
  drawAvgPathFlag = false;
  gui();
}

