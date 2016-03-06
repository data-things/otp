
int precipice = 1; // variable for slider - for pucker and bloat lines (0.5= straight line)
int[] controls = {
  inspiring, eye_opening, educational, confusing, thought_provoking, depressing, different, weird, familiar, calm, creepy, exciting
};

int minCenter =50; // center circle as minimum to hold shape together
int maxCenter= diam/2; // slider is mapped to exterior diameter of circle

int duration =35;

PVector pv[];

void drawPath() {
  pv=new PVector[controls.length];

  PVector p = new PVector(0, 0);

  for (int i=0; i<pv.length; i++) {
    float value= slValues[i];  //create a new float called value to use for mapping the slider values

    p = new PVector(0, 0);
    p.y = map(value, wordSliderMin, wordSliderMax, minCenter, maxCenter);
    p.rotate(map(i, 0, controls.length, 0, TWO_PI));
    pv[i]=p;
  }

  translate(translateCenter, height/2);
  //stroke(0);
  fill(0, 200, 255);

  float bloat=map (precipice, 0, 10, 0.3, 1); // mapping slider parameters from 0-10 to 0-1 for pucker bloat to work (0.1 to make it less extreme)

  beginShape(); // draws a line strip, similar to a polyline
  PVector last=null;
  for (PVector vec : pv) {
    if (last!=null) {
      vertex(last.x, last.y);
      quadraticVertex((vec.x+last.x)*bloat, (vec.y+last.y)*bloat, vec.x, vec.y); // this is the pucker/bloat code
    }
    last=vec;

    //draws lines from center to all points:
    //line(0, 0, last.x, last.y);
  }

// this draws the last line as bloat (because vec is empty, it needs to be set back to pv and drawn to last)
  PVector vec=pv[0];
  vertex(last.x, last.y);
  quadraticVertex((vec.x+last.x)*bloat, (vec.y+last.y)*bloat, vec.x, vec.y); // this is the pucker/bloat code

  // RESIZE the shape based on slider called duration (for now, could be duration?_)
//  float dur = map(duration, 0, 60, 1, 2);
//  scale(dur);

  endShape();
}

