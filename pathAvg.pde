
PVector pvAvg[];


void drawAvgPath() {
  pvAvg=new PVector[controls.length];

  for (int i=0; i<pvAvg.length; i++) {

    PVector p = new PVector(0, 0);
    // println(slAvg[i]);

    //using slAvg to draw the average path
    //    p.y = slAvg[i]*200;       // or    
    p.y = map(slAvg[i], 0, 3, minCenter, maxCenter);

    p.rotate(map(i, 0, controls.length, 0, TWO_PI));
    pvAvg[i]=p;
  }

  fill(210, 100);

  float avgBloat=map (avgPrec, 0, 3, 0, 1); // mapping slider parameters from 0-10 to 0-1 for pucker bloat to work (0.1 to make it less extreme)
  //float avgBloat2 = map(avgBloat, 0,1,0.25,0.75); // average out the pucker bloat a bit more?

  beginShape(); // draws a line strip, similar to a polyline
  PVector last=null;
  for (PVector vec : pvAvg) {
    if (last!=null) {
      vertex(last.x, last.y);
      quadraticVertex((vec.x+last.x)*avgBloat, (vec.y+last.y)*avgBloat, vec.x, vec.y); // this is the pucker/bloat code
    } 
    last=vec;
  }

  // this draws the last line as bloat (because vec is empty, it needs to be set back to pv and drawn to last)
  PVector vec=pvAvg[0];
  vertex(last.x, last.y);
  quadraticVertex((vec.x+last.x)*avgBloat, (vec.y+last.y)*avgBloat, vec.x, vec.y); // this is the pucker/bloat code

  endShape();
}

