float dat[];
String dateID = year()+"/"+month()+"/"+day()+" "+hour()+":"+minute()+":"+second();

// creates csv file from slider data and adds a new row on each save
void saveDataCSV() {
  Table table=new Table();

// creates columns for the table
  table.addColumn("id");
  table.addColumn("word");
  table.addColumn("duration");
  table.addColumn("age");
  table.addColumn("email");
  table.addColumn("precipice");
  for (int i=0; i<slValues.length; i++) table.addColumn(slName[i]);

// creates new rows for table
  TableRow newRow=table.addRow();   
  newRow.setString("id", dateID);
  newRow.setString("word", word);
  newRow.setInt("duration", duration);
  newRow.setInt("age", ageslider);
  newRow.setString("email", email);
  newRow.setInt("precipice", precipice);

for (int j=1; j<slValues.length; j++) {
  for (int i=0; i<slValues.length; i++) newRow.setInt(slName[i], slValues[i]);
}

// loads table again to add more rows to it
  Table oldTable=loadTable("data/values.csv", "header");
  newRow=oldTable.addRow();   
  newRow.setString("id", dateID);
  newRow.setString("word", cp5.get(Textfield.class,"word").getText());
  newRow.setInt("duration", duration);
  newRow.setInt("age", ageslider);
  newRow.setString("email", cp5.get(Textfield.class,"email").getText());

  newRow.setInt("precipice", precipice);
  
for (int j=1; j<slValues.length; j++) {
  for (int i=0; i<slValues.length; i++) newRow.setInt(slName[i], slValues[i]);
}

 // saves new row to old table
  saveTable(oldTable, "data/values.csv");
}

