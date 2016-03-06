PFont font = createFont("arial", 16);

ControlP5 cp5;
RadioButton radio;

int inspiring, eye_opening, educational, confusing, thought_provoking, depressing, different, weird, familiar, calm, creepy, exciting = 0; // declare sliders here
int slValues[];
String slName[] = {
  "inspiring", "eye_opening", "educational", "confusing", "thought_provoking", "depressing", "different", "weird", "familiar", "calm", "creepy", "exciting"
}; // declare sliders names here to add as table header

String word = new String();
String age = new String(); // should this be string or int (is it storing data from the radio buttons?)
String email = new String(); 

int ageslider = 0;

int wordSliderMin = 0; // change word slider minimum value here
int wordSliderMax = 3; // change word slider maximum value here
int startValue = 1; // change start value of sliders here

int yPos = 50; // slider alignment left
int yPos2 = yPos+80; 

// updates the slider values
void updateValues() {
  if (slValues==null) slValues=new int [controls.length];
  slValues[0]=inspiring;
  slValues[1]=eye_opening;
  slValues[2]=educational;
  slValues[3]=confusing;
  slValues[4]=thought_provoking;
  slValues[5]=depressing; 
  slValues[6]=different;
  slValues[7]=weird; 
  slValues[8]=familiar;
  slValues[9]=calm;
  slValues[10]=creepy;
  slValues[11]=exciting;
}

void gui() {  

  cp5 = new ControlP5(this)
    // these attributes apply to all controls: 
    .setColorForeground(color(200)) .setColorBackground(color(125)) .setColorLabel(color(245));
  
int w = 270; // width of word sliders
int h = 20; // height of word sliders

  cp5.addSlider("inspiring")
    .setPosition(yPos2, 110) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("eye_opening")
    .setPosition(yPos2+20, 140) .setWidth(w-20) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("educational")
    .setPosition(yPos2+20, 170) .setWidth(w-20) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("confusing")
    .setPosition(yPos2, 200) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("thought_provoking")
    .setPosition(yPos2+60, 230) .setWidth(w-60) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("depressing")
    .setPosition(yPos2+10, 260) .setWidth(w-10) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("different")
    .setPosition(yPos2, 290) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("weird")
    .setPosition(yPos2, 320) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("familiar")
    .setPosition(yPos2, 350) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("calm")
    .setPosition(yPos2, 380) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);
  
  cp5.addSlider("creepy")
    .setPosition(yPos2, 410) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);

  cp5.addSlider("exciting")
    .setPosition(yPos2, 440) .setWidth(w) .setHeight(h) .setRange(wordSliderMin, wordSliderMax) .setValue(startValue).setNumberOfTickMarks(4);


  // add other word
  cp5.addTextfield("word")
    .setPosition(yPos, 500) .setWidth(350) .setHeight(30).setColorBackground(color(200)) //.setColorLabel(color(125))
      .setFont(font) .setFocus(true);
      

  // pucker/bloat slider
  cp5.addSlider("precipice")
    .setPosition(yPos, 570) .setWidth(350) .setHeight(h) .setRange(0, 10) .setValue(3).setNumberOfTickMarks(11);


  //  duration ???
  cp5.addSlider("duration")
    .setPosition(yPos, 690) .setWidth(350) .setHeight(h) .setRange(0, 60) .setValue(20); // not sure about the values

// age slider
  cp5.addSlider("ageslider")
    .setPosition(yPos, 750) .setWidth(350) .setHeight(h) .setRange(14, 50) .setValue(24).setNumberOfTickMarks(5);

  // email textfield
  cp5.addTextfield("email")
    .setPosition(yPos, 840) .setWidth(350) .setHeight(30).setColorBackground(color(200)) //.setColorLabel(color(125))
      .setFont(font) .setFocus(true);

  // save slider info to csv as well as generate visualisation shape
  cp5.addBang("save")
    .setPosition(yPos, 920) .setSize(200, 30);  //.setColorLabel(color(125));

  // resets all sliders
  cp5.addBang("reset")
    .setPosition(300, 920) .setSize(100, 30);  //.setColorLabel(color(125));


//radio = cp5.addRadioButton("radioButton")
//         .setPosition(yPos,750)
//         .setSize(20,20)
//         .setColorForeground(color(200))
//         .setColorBackground(color(125))
//         .setColorLabel(color(245))
//         .setItemsPerRow(5)
//         .setSpacingColumn(60)
//         .addItem("under 14",1)
//         .addItem("14-25",2)
//         .addItem("25-35",3)
//         .addItem("35-55",4)
//         .addItem("over 55",5)
//         ;

  textFont(font);
}

// create the event handler for radio buttons:
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(radio)) {
    print("got an event from "+theEvent.getName()+"\t");
    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
    println("\t "+theEvent.getValue());
   // myColorBackground = color(int(theEvent.group().value()*50),0,0);
  }
}
