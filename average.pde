

// load table, load columns and calculate average, use average to display
int emotions[][];
int sum[];
float slAvg[];
float avgPrec;

//returns the mean of the values in an array
float averageMe(float[] me)
{
   float sum = 0;
   for (float f:me)
      sum = sum + f; // or sum+=f; or sum=+f; ???

   return sum / me.length;
}

void average() {

  Table average= loadTable("data/values.csv", "header");

  // marius' code to calculate the average per column
  
  //iterates the named columns and stores average
  for (int i=0; i<slAvg.length; i++) {
    float val[]=average.getFloatColumn(slName[i]); //String slName[] { declaring slider names } 
    slAvg[i]= averageMe(val);
    
    println(slName[i]+" average is: "+slAvg[i]);
  }

  // calculates the average of the precipice column
  float val2[]=average.getFloatColumn("precipice");
  avgPrec=averageMe(val2);
  println("avgPrec: "+avgPrec);

  
}

