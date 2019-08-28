import org.gicentre.geomap.*;

GeoMap geoMap;
Table crime_table;
Table house_prices;
int temp_count;
Table tempT  = new Table();
PImage bg;
PImage bg2;
color c1 = #60FF05;
color c2 = #9A05FF;
color c3 = #FF0540;
color c4 = #0539FF;
color c5 = #05FFFD;
color c6 = #05FF6B;
color c7 = #FEFF05;
color c8 = #FF1A05;
boolean called = false;
boolean did = false;
int whatpressed = 1;
PFont font;
String the_year = "2017";
String the_month = "03";
int year_pressed_position = 1;
int month_pressed_position = 3;
boolean play_mode = false;
int time;
int wait = 2000;
int page_number;

image_buttons button;
image_buttons button2;
image_buttons button3;
image_buttons button4;
image_buttons button5;
image_buttons button6;
image_buttons button7;
image_buttons button8;
image_buttons button9;

image_buttons yr1;
image_buttons yr2;
image_buttons yr3;
image_buttons m1;
image_buttons m2;
image_buttons m3;
image_buttons m4;
image_buttons m5;
image_buttons m6;
image_buttons m7;
image_buttons m8;
image_buttons m9;
image_buttons m10;
image_buttons m11;
image_buttons m12;

image_buttons btn_play;
image_buttons btn_stop;
image_buttons btn_map;
image_buttons btn_graph;
image_buttons btn_date1;
image_buttons btn_date2;
image_buttons btn_date3;
image_buttons btn_date4;

void loadCrimeData() {
  crime_table = loadTable("borough_crime_levels.csv", "header");
}

int getNumberOfAllCrimesButThis(int date, String borough) {
  int crimesCounter = 0;
  for (TableRow row : crime_table.rows()) {
    if (row.getInt("Month") == date && row.getString("LANAME").equals(borough)) {
      crimesCounter += row.getInt("Count");
    }
  }
  return crimesCounter;
}

/*@date = has to be in format yyyyMM
 *@crimeType = has to be on of the cimes avaliabe in datasheet
 *@borough = has to be one of the boroughs avaliable in datasheet
 */
int getNumOfCrimesOverall(int date, String crimeType, String borough) {
  int crimesCounter = 0;
  tempT.clearRows();
  tempT.addColumn("Month");
  tempT.addColumn("MajorText");
  tempT.addColumn("LANAME");
  tempT.addColumn("Count");

  for (TableRow row : crime_table.rows()) {
    if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeType)
      && row.getString("LANAME").equals(borough)) {
      crimesCounter += row.getInt("Count");
      TableRow newRow = tempT.addRow();
      newRow.setInt("Month", row.getInt("Month"));
      newRow.setString("MajorText", row.getString("MajorText"));
      newRow.setString("LANAME", row.getString("LANAME"));
      newRow.setInt("Count", row.getInt("Count"));
    }
  }
  return crimesCounter;
}

int getNumOfCrimesSpecific(int date, String crimeType, String borough) {
  int crimesCounter = 0;
  for (TableRow row : tempT.rows()) {
    if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeType)
      && row.getString("LANAME").equals(borough)) {
      crimesCounter += row.getInt("Count");
    }
  }
  return crimesCounter;
}

void drawPopup(int date, int x, int y, String name, int total, String crimeName) {
  fill(240, 200);  
  rect(x, y, 260, 193);  
  fill(180, 200);
  rect(x, y, 260, 30);
  fill(0);
  font = loadFont("SegoeUI-16.vlw");
  textFont(font);
  text(name, x + 3, y+25);
  font = loadFont("SegoeUI-12.vlw");
  textFont(font);
  text("Total of " + crimeName + " crimes: " + total, x + 3, y+50);

  if (whatpressed == 1) {
    int counter1 = 0;
    int counter2 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Burglary In A Dwelling")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Burglary In Other Buildings")) {
        counter2 += row.getInt("Count");
      }
    }

    text("Burglary In A Dwelling: " + counter1, x + 3, y+70);
    text("Burglary In Other Buildings: " + counter2, x + 3, y+85);
  } else if (whatpressed == 2) {
    int counter1 = 0;
    int counter2 = 0;  
    int counter3 = 0;  
    int counter4 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Criminal Damage To Dwelling")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Criminal Damage To Motor Vehicle")) {
        counter2 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Criminal Damage To Other Building")) {
        counter3 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Criminal Damage")) {
        counter4 += row.getInt("Count");
      }
    }

    text("Criminal Damage To Dwelling: " + counter1, x + 3, y+70);
    text("Criminal Damage To Motor Vehicle: " + counter2, x + 3, y+85);
    text("Criminal Damage To Other Building: " + counter3, x + 3, y+100);
    text("Other Criminal Damage: " + counter4, x + 3, y+115);
  } else if (whatpressed == 3) {
    int counter1 = 0;
    int counter2 = 0;  
    int counter3 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Drug Trafficking")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Drugs")) {
        counter2 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Possession Of Drugs")) {
        counter3 += row.getInt("Count");
      }
    }

    text("Drug Trafficking: " + counter1, x + 3, y+70);
    text("Other Drugs: " + counter2, x + 3, y+85);
    text("Possession Of Drugs: " + counter3, x + 3, y+100);
  } else if (whatpressed == 4) {
    int counter1 = 0;
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Fraud & Forgery")) {
        counter1 += row.getInt("Count");
      }
    }

    text("Other Fraud & Forgery: " + counter1, x + 3, y+70);
  } else if (whatpressed == 5) {
    int counter1 = 0;
    int counter2 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Going Equipped")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Notifiable")) {
        counter2 += row.getInt("Count");
      }
    }

    text("Going Equipped: " + counter1, x + 3, y+70);
    text("Other Notifiable: " + counter2, x + 3, y+85);
  } else if (whatpressed == 6) {
    int counter1 = 0;
    int counter2 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Business Property")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Personal Property")) {
        counter2 += row.getInt("Count");
      }
    }

    text("Business Property: " + counter1, x + 3, y+70);
    text("Personal Property: " + counter2, x + 3, y+85);
  } else if (whatpressed == 7) {
    int counter1 = 0;
    int counter2 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Sexual")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Rape")) {
        counter2 += row.getInt("Count");
      }
    }

    text("Other Sexual: " + counter1, x + 3, y+70);
    text("Rape: " + counter2, x + 3, y+85);
  } else if (whatpressed == 8) {

    int counter1 = 0;
    int counter2 = 0;  
    int counter3 = 0;  
    int counter4 = 0;  
    int counter5 = 0;  
    int counter6 = 0;  
    int counter7 = 0;  
    int counter8 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Handling Stolen Goods")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Motor Vehicle Interference & Tampering")) {
        counter2 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Theft")) {
        counter3 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Theft Person")) {
        counter4 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Theft From Motor Vehicle")) {
        counter5 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Theft From Shops")) {
        counter6 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Theft/Taking Of Motor Vehicle")) {
        counter7 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Theft/Taking Of Pedal Cycle")) {
        counter8 += row.getInt("Count");
      }
    }

    text("Handling Stolen Goods: " + counter1, x + 3, y+70);
    text("Motor Vehicle Interference & Tampering: " + counter2, x + 3, y+85);
    text("Other Theft: " + counter3, x + 3, y+100);
    text("Other Theft Person: " + counter4, x + 3, y+115);
    text("Theft From Motor Vehicle: " + counter5, x + 3, y+130);
    text("Theft From Shops: " + counter6, x + 3, y+145);
    text("Theft/Taking Of Motor Vehicle: " + counter7, x + 3, y+160);
    text("Theft/Taking Of Pedal Cycle: " + counter8, x + 3, y+175);
  } else if (whatpressed == 9) {
    int counter1 = 0;
    int counter2 = 0;  
    int counter3 = 0;  
    int counter4 = 0;  
    int counter5 = 0;  
    int counter6 = 0;  
    int counter7 = 0;  
    for (TableRow row : crime_table.rows()) {
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Assault With Injury")) {
        counter1 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Common Assault")) {
        counter2 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Harassment")) {
        counter3 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Murder")) {
        counter4 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Offensive Weapon")) {
        counter5 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Other Violence")) {
        counter6 += row.getInt("Count");
      }
      if (row.getInt("Month") == date && row.getString("MajorText").equals(crimeName)
        && row.getString("LANAME").equals(name) && row.getString("MinorText").equals("Wounding/GBH")) {
        counter7 += row.getInt("Count");
      }
    }

    text("Assault With Injury: " + counter1, x + 3, y+70);
    text("Common Assault: " + counter2, x + 3, y+85);
    text("Harassment: " + counter3, x + 3, y+100);
    text("Murder: " + counter4, x + 3, y+115);
    text("Offensive Weapon: " + counter5, x + 3, y+130);
    text("Other Violence: " + counter6, x + 3, y+145);
    text("Wounding/GBH: " + counter7, x + 3, y+160);
  }
}

void showScale() {
  fill(c1, 200);
  stroke(#200101);
  rect(width - 150, height/2 -300+10, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("0", width -140+3, height/2 -300+10+3 + 3);

  fill(c2, 200);
  stroke(#200101);
  rect(width -150, height/2 -300+ 20+10, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("1-50", width -140+3, height/2 -300+3+10+ 23);

  fill(c3, 200);
  stroke(#200101);
  rect(width-150, height/2 -300+10+ 40, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("51-100", width-140+3 , height/2 -300+3+10+ 43);

  fill(c4, 200);
  stroke(#200101);
  rect(width-150, height/2 -300+10+ 60, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("101-250", width-140+3 , height/2 -300+3+10+ 63);
 
  fill(c5, 200);
  stroke(#200101);
  rect(width-150, height/2 -300+10+ 80, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("251-400", width-140+3 , height/2 -300+3+10+ 83);

  fill(c6, 200);
  stroke(#200101);
  rect(width-150, height/2 -300+10+ 100, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("401-550", width-140+3 , height/2 -300+10+3+ 103);
  
  fill(c7, 200);
  stroke(#200101);
  rect(width-150, height/2 -300+10+ 120, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("551-750", width-140+3 , height/2 -300+10+ 123+3);

  fill(c8, 200);
  stroke(#200101);
  rect(width-150, height/2 -300+10+ 140, 10, 10);
  textSize(20); 
  fill(0, 190);
  textAlign(LEFT, CENTER);
  text("750+", width-140+3 , height/2 -300+10+ 143+3);
}

void showPoint(int x, int y) {
  PImage img;
  img = loadImage("point.png");
  image(img, x+35, 375+y);
}

void showDateYearPoint(int x, int y) {
  PImage img;
  img = loadImage("point.png");
  image(img, x+563, 562+y);
}

void showDateMonthPoint(int x, int y) {
  PImage img;
  img = loadImage("point2.png");
  image(img, x+563, 645+y);
}

void setMapColourOverall(int date, String crimeType, GeoMap map) {
  int count;
  int highest = -1;
  String highestName = "";
  int lowest = -1;
  String lowestName = "";
  for (int i= 1; i <= map.getAttributes().getRowCount(); i++) {   
    String name = geoMap.getAttributes().getString(i, 2);
    count = getNumOfCrimesOverall(date, crimeType, name);
    if ( count <= 0) {
      fill(c1);  

      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count >= 1 && count <= 50) {
      fill(c2);  
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 50 && count <= 100) {
      fill(c3);    
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 100 && count <= 250) {
      fill(c4);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 250 && count <= 400) {
      fill(c5);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 400 && count <= 550) {
      fill(c6);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 550 && count <= 750) {
      fill(c7);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 750) {
      fill(c8);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else {
      fill(c1);   
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    }

    if (lowest == -1) {
      lowest = count;
      lowestName = geoMap.getAttributes().getString(i, 2);
    } else if (lowest > count) {
      lowest = count;
      lowestName = geoMap.getAttributes().getString(i, 2);
    }

    if (highest == -1) {
      highest = count;
      highestName = geoMap.getAttributes().getString(i, 2);
    } else if (highest < count) {
      highest = count;
      highestName = geoMap.getAttributes().getString(i, 2);
    }
  }
  //avoid showing if there's no data
  if (highest != 0) {
    fill(50);
    font = loadFont("SegoeUI-16.vlw");
    textFont(font);
    text(highestName, 773, 435);
    text("Crimes: " + highest, 773, 450);
    text(lowestName, 773, 375);
    text("Crimes: " + lowest, 773, 390);
  } else {
    fill(50);
    font = loadFont("SegoeUI-16.vlw");
    textFont(font);
    text("N/A", 773, 435);
    text("N/A", 773, 375);
  }
}

void setMapColourSpecific(int date, String crimeType, GeoMap map) {
  int count;

  for (int i= 1; i <= map.getAttributes().getRowCount(); i++) {   
    String name = geoMap.getAttributes().getString(i, 2);
    count = getNumOfCrimesSpecific(date, crimeType, name);
    if ( count <= 0) {
      fill(c1);  
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count >= 1 && count <= 50) {
      fill(c2);  
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 50 && count <= 100) {
      fill(c3);    
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 100 && count <= 250) {
      fill(c4);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 250 && count <= 400) {
      fill(c5);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 400 && count <= 550) {
      fill(c6);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 550 && count <= 750) {
      fill(c7);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else if ( count > 750) {
      fill(c8);
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    } else {
      fill(c1);   
      geoMap.draw(geoMap.getAttributes().getInt(i, 0));
    }
  }
}

void drawMainTitle() {
  fill(50);
  font = loadFont("SegoeUI-Bold-28.vlw");
  textFont(font);
  text(the_year + "/" + the_month, 50, 10);
  text("Crimes of London", 10, 40);
}

void drawCrimeTypeTitle() {
  fill(50);
  font = loadFont("SegoeUI-28.vlw");
  textFont(font);
  text("Crime Type", 50, 520);
}

void drawDatePickerTitle() {
  fill(50);
  font = loadFont("SegoeUI-28.vlw");
  textFont(font);
  text("Date Picker", 547, 550);
}

void drawLowHighCrimeTitle() {
  fill(50);
  font = loadFont("SegoeUI-Bold-16.vlw");
  textFont(font);
  text("Lowest Crime:", 773, 355);
  text("Highest Crime:", 773, 415);
}

void drawDescription() {
  fill(50);
  font = loadFont("SegoeUI-14.vlw");
  textFont(font);
  text("Explore the crime\nstatistics of different\nboroughs of London\nbased on the data from\n2017/03 - 2019/02\n\nPlease select the crime type\nto get its view on\nmap of London.\n\nHover the mouse over\nthe map to get the\nactual numbers of crime.\n\nUse the provided date\npicker to change the data\nbased on date.\n\nUse the navigation buttons\nto see other representations\nof data.", 30, 280);
}

void createCrimeButtons() {
  // Define and create image buttons
  PImage b = loadImage("data/btn_1_1.png");
  PImage r = loadImage("data/btn_1_2.png");
  int y = (height+100)/2 - b.height/2; 
  int w = b.width;
  int h = b.height;
  button = new image_buttons(50, y+170, w, h, b, r);

  PImage b2 = loadImage("data/btn_2_1.png");
  PImage r2 = loadImage("data/btn_2_2.png");
  button2 = new image_buttons(50+160, y+170, w, h, b2, r2);

  PImage b3 = loadImage("data/btn_3_1.png");
  PImage r3 = loadImage("data/btn_3_2.png");
  button3 = new image_buttons(50+320, y+170, w, h, b3, r3);

  PImage b4 = loadImage("data/btn_4_1.png");
  PImage r4 = loadImage("data/btn_4_2.png");
  button4 = new image_buttons(50, y+215, w, h, b4, r4);

  PImage b5 = loadImage("data/btn_5_1.png");
  PImage r5 = loadImage("data/btn_5_2.png");
  button5 = new image_buttons(50+160, y+215, w, h, b5, r5);

  PImage b6 = loadImage("data/btn_6_1.png");
  PImage r6 = loadImage("data/btn_6_2.png");
  button6 = new image_buttons(50+320, y+215, w, h, b6, r6);

  PImage b7 = loadImage("data/btn_7_1.png");
  PImage r7 = loadImage("data/btn_7_2.png");
  button7 = new image_buttons(50, y+260, w, h, b7, r7);

  PImage b8 = loadImage("data/btn_8_1.png");
  PImage r8 = loadImage("data/btn_8_2.png");
  button8 = new image_buttons(50+160, y+260, w, h, b8, r8);

  PImage b9 = loadImage("data/btn_9_1.png");
  PImage r9 = loadImage("data/btn_9_2.png");
  button9 = new image_buttons(50+320, y+260, w, h, b9, r9);
}

void createDatePickerButtons() {
  //create sldider buttons
  PImage bb = loadImage("data/scroll_images/btn_s__01.gif");
  PImage rr = loadImage("data/scroll_images/btn_s2__01.gif");
  int xx = 550;
  int yy = 570; 
  int ww = bb.width;
  int hh = bb.height;
  yr1 = new image_buttons(xx, yy, ww, hh, bb, rr);

  PImage bb2 = loadImage("data/scroll_images/btn_s__02.gif");
  PImage rr2 = loadImage("data/scroll_images/btn_s2__02.gif");
  yr2 = new image_buttons(xx+37, yy, ww, hh, bb2, rr2);

  PImage bb3 = loadImage("data/scroll_images/btn_s__03.gif");
  PImage rr3 = loadImage("data/scroll_images/btn_s2__03.gif");
  yr3 = new image_buttons(xx+73, yy, ww, hh, bb3, rr3);

  PImage bb4 = loadImage("data/scroll_images/btn_s__14.gif");
  PImage rr4 = loadImage("data/scroll_images/btn_s2__14.gif");
  m1 = new image_buttons(xx, yy+37, ww, hh, bb4, rr4);

  PImage bb5 = loadImage("data/scroll_images/btn_s__15.gif");
  PImage rr5 = loadImage("data/scroll_images/btn_s2__15.gif");
  m2 = new image_buttons(xx+37, yy+37, ww, hh, bb5, rr5);

  PImage bb6 = loadImage("data/scroll_images/btn_s__16.gif");
  PImage rr6 = loadImage("data/scroll_images/btn_s2__16.gif");
  m3 = new image_buttons(xx+73, yy+37, ww, hh, bb6, rr6);

  PImage bb7 = loadImage("data/scroll_images/btn_s__05.gif");
  PImage rr7 = loadImage("data/scroll_images/btn_s2__05.gif");
  m4 = new image_buttons(xx+109, yy+36, ww, hh, bb7, rr7);

  PImage bb8 = loadImage("data/scroll_images/btn_s__06.gif");
  PImage rr8 = loadImage("data/scroll_images/btn_s2__06.gif");
  m5 = new image_buttons(xx+142, yy+36, ww, hh, bb8, rr8);

  PImage bb9 = loadImage("data/scroll_images/btn_s__07.gif");
  PImage rr9 = loadImage("data/scroll_images/btn_s2__07.gif");
  m6 = new image_buttons(xx+179, yy+36, ww, hh, bb9, rr9);

  PImage bb10 = loadImage("data/scroll_images/btn_s__08.gif");
  PImage rr10 = loadImage("data/scroll_images/btn_s2__08.gif");
  m7 = new image_buttons(xx+214, yy+36, ww, hh, bb10, rr10);

  PImage bb11 = loadImage("data/scroll_images/btn_s__09.gif");
  PImage rr11 = loadImage("data/scroll_images/btn_s2__09.gif");
  m8 = new image_buttons(xx+250, yy+36, ww, hh, bb11, rr11);

  PImage bb12 = loadImage("data/scroll_images/btn_s__10.gif");
  PImage rr12 = loadImage("data/scroll_images/btn_s2__10.gif");
  m9 = new image_buttons(xx+287, yy+36, ww, hh, bb12, rr12);

  PImage bb13 = loadImage("data/scroll_images/btn_s__11.gif");
  PImage rr13 = loadImage("data/scroll_images/btn_s2__11.gif");
  m10 = new image_buttons(xx+323, yy+36, ww, hh, bb13, rr13);

  PImage bb14 = loadImage("data/scroll_images/btn_s__12.gif");
  PImage rr14 = loadImage("data/scroll_images/btn_s2__12.gif");
  m11 = new image_buttons(xx+359, yy+36, ww, hh, bb14, rr14);

  PImage bb15 = loadImage("data/scroll_images/btn_s__13.png");
  PImage rr15 = loadImage("data/scroll_images/btn_s2__13.png");
  m12 = new image_buttons(xx+395, yy+36, ww, hh, bb15, rr15);

  PImage btnplay1 = loadImage("data/btn_play.png");
  PImage btnplay2 = loadImage("data/btn_play2.png");
  btn_play = new image_buttons(xx+394, yy, ww, hh, btnplay1, btnplay2);

  PImage btnpstop1 = loadImage("data/btn_stop.png");
  PImage btnpstop2 = loadImage("data/btn_stop2.png");
  btn_stop = new image_buttons(xx+394, yy, ww, hh, btnpstop1, btnpstop2);

  PImage btnmap1 = loadImage("data/btn_map1.png");
  PImage btnmap2 = loadImage("data/btn_map2.png");
  int ww2 = btnmap1.width;
  int hh2 = btnmap1.height;
  btn_map = new image_buttons(xx+184, yy-570, ww2, hh2, btnmap1, btnmap2);

  PImage btngrp1 = loadImage("data/btn_graph1.png");
  PImage btngrp2 = loadImage("data/btn_graph2.png");
  btn_graph = new image_buttons(xx+328, yy-570, ww2, hh2, btngrp1, btngrp2);
}
void updateDateBtns() {
  btn_date1.display();
  btn_date1.update();
  btn_date2.display();
  btn_date2.update();
}
void updateDateBtns2() {
  btn_date3.display();
  btn_date3.update();
  btn_date4.display();
  btn_date4.update();
}

void drawDateBtns() {
  PImage btndate1 = loadImage("data/btn_date1_1.png");
  PImage btndate11 = loadImage("data/btn_date1_1.png");

  int ww2 = btndate1.width;
  int hh2 = btndate1.height;
  btn_date1 = new image_buttons(57, 69, ww2, hh2, btndate1, btndate11);

  PImage btndate2 = loadImage("data/btn_date2_1.png");
  PImage btndate22 = loadImage("data/btn_date2_1.png");
  btn_date2 = new image_buttons(356, 69, ww2, hh2, btndate2, btndate22);
}

void drawDateBtns2() {
  PImage btndate1 = loadImage("data/btn_grph2_1_1.png");
  PImage btndate11 = loadImage("data/btn_grph2_1_1.png");

  int ww2 = btndate1.width;
  int hh2 = btndate1.height;
  btn_date3 = new image_buttons(587, 362, ww2, hh2, btndate1, btndate11);

  PImage btndate2 = loadImage("data/btn_grph2_2_1.png");
  PImage btndate22 = loadImage("data/btn_grph2_2_1.png");
  btn_date4 = new image_buttons(886, 362, ww2, hh2, btndate2, btndate22);
}


void setup()
{
  size(1024, 680);
  bg = loadImage("bg.png");
  bg2 = loadImage("bg2.png");
  geoMap = new GeoMap(250, 10, 600, 500, this);    
  geoMap.readFile("londonBoroughs");

  // Set up text appearance.
  textAlign(LEFT, BOTTOM);
  textSize(18);
  page_number = 1;
  background(bg);
  loadCrimeData();
  //loadHousePrices();
  setMapColourOverall(Integer.parseInt(the_year + the_month), "Burglary", geoMap);
  createCrimeButtons();
  showScale();
  showPoint(80, 160);
  showDateYearPoint(0, 0);
  showDateMonthPoint(359, 0);
  drawMainTitle();
  drawCrimeTypeTitle();
  drawDatePickerTitle();
  drawLowHighCrimeTitle();
  drawDescription();
  createDatePickerButtons();
  drawDateBtns();
  drawDateBtns2();
}

void updatePlayButton() {
  if (!play_mode) {  
    btn_play.display(); 
    btn_play.update();
  } else {
    btn_stop.display();
    btn_stop.update();
  }
}

void updateScrollButtons() {
  yr1.display(); 
  yr1.update();   
  yr2.display();
  yr2.update();
  yr3.display();
  yr3.update();
  m1.display();
  m1.update();
  m2.display();
  m2.update();
  m3.display();
  m3.update();
  m4.display();
  m4.update();
  m5.display();
  m5.update();
  m6.display();
  m6.update();
  m7.display();
  m7.update();
  m8.display();
  m8.update();
  m9.display();
  m9.update();
  m10.display();
  m10.update();
  m11.display();
  m11.update();
  m12.display();  
  m12.update();
}

void updateNavBtn() {

  //update also nav buttons
  btn_map.display();
  btn_map.update();
  btn_graph.display();
  btn_graph.update();
}
void updateCrimeButtons() {
  button.update();
  button.display();
  button2.update();   
  button2.display();
  button3.update();
  button3.display();
  button4.update();
  button4.display();
  button5.update();
  button5.display();
  button6.update();
  button6.display();
  button7.update();
  button7.display();
  button8.update();
  button8.display();
  button9.update();
  button9.display();
}

void mouseClicked() {

  if (btn_play.pressed && play_mode == false) {    
    play_mode = true;  
    time = millis();//also update the stored time
  } else  if (btn_stop.pressed && play_mode == true) {
    play_mode = false;           
    time = millis();//also update the stored time
  }

  if (btn_map.pressed)
  {
    drawn_first_graph =1; 
    page_number = 1;
    did = false;
    called = true;
    found = false;
    isFinished = false;
    graphTwoDrawn = false;
  } else if (btn_graph.pressed)
  {
    drawn_first_graph = 0;
    page_number = 2;
    graphTwoDrawn= false;

    PFont font = createFont("SegoeUI-10", 10);
    textInput = new TextInput(this, font, 10);
    isFinished = false;
    if (found) barChart.draw(579, 137, 400, 180);
  }

  if (btn_date1.pressed)
  {
    the_year2a = "201703";
    the_year2b = "201803";
    drawn_first_graph = 0;
    isFinished = false;
    graphTwoDrawn= false;
  } else  if (btn_date2.pressed)
  {
    the_year2a = "201802";
    the_year2b = "201902";
    drawn_first_graph = 0;
    isFinished = false;
    graphTwoDrawn= false;
  }

  if (btn_date3.pressed)
  {
    the_year3a = "2017";
    the_year3b = "2018";    
    graphTwoDrawn= false;
  } else  if (btn_date4.pressed)
  {
    the_year3a = "2018";
    the_year3b = "2019";   
    graphTwoDrawn= false;
  }
}

void datesAutoPlay() {
  if (play_mode) {

    //check the difference between now and the previously stored time is greater than the wait interval
    if (millis() - time >= wait) {       
      if (the_month.equals("12")) {

        if (the_year.equals("2017")) {
          the_year = "2018";
          showDateYearPoint(37, 0);
          year_pressed_position = 2;          
          did = false;
          called= true;
        } else if (the_year.equals("2018")) {
          the_year = "2019";
          showDateYearPoint(72, 0);
          year_pressed_position = 3;
          did = false;
          called= true;
        } else {
          the_year = "2017";
          showDateYearPoint(0, 0);
          year_pressed_position = 1;
          did = false;
          called= true;
        }
        the_month = "01";
        showDateMonthPoint(0, 0);
        month_pressed_position = 1;
        did = false;
        called= true;
      } else if (the_month.equals("01")) {
        the_month = "02";
        showDateMonthPoint(37, 0);
        month_pressed_position = 2;
        did = false;
        called= true;
      } else if (the_month.equals("02")) {
        the_month = "03";
        showDateMonthPoint(72, 0);
        month_pressed_position = 3;
        did = false;
        called= true;
      } else if (the_month.equals("03")) {
        the_month = "04";
        showDateMonthPoint(108, 0);
        month_pressed_position = 4;
        did = false;
        called= true;
      } else if (the_month.equals("04")) {
        the_month = "05";
        showDateMonthPoint(143, 0);
        month_pressed_position = 5;
        did = false;
        called= true;
      } else if (the_month.equals("05")) {
        the_month = "06";
        showDateMonthPoint(179, 0);
        month_pressed_position = 6;
        did = false;
        called= true;
      } else if (the_month.equals("06")) {
        the_month = "07";
        showDateMonthPoint(215, 0);
        month_pressed_position = 7;
        did = false;
        called= true;
      } else if (the_month.equals("07")) {
        the_month = "08";
        showDateMonthPoint(251, 0);
        month_pressed_position = 8;
        did = false;
        called= true;
      } else if (the_month.equals("08")) {
        the_month = "09";
        showDateMonthPoint(287, 0);
        month_pressed_position = 9;
        did = false;
        called= true;
      } else if (the_month.equals("09")) {
        the_month = "10";
        showDateMonthPoint(323, 0);
        month_pressed_position = 10;
        did = false;
        called= true;
      } else if (the_month.equals("10")) {
        the_month = "11";
        showDateMonthPoint(359, 0);
        month_pressed_position = 11;
        did = false;
        called= true;
      } else if (the_month.equals("11")) {
        the_month = "12";
        showDateMonthPoint(396, 0);  
        month_pressed_position = 12;
        did = false;
        called= true;
      }

      time = millis();//also update the stored time
    }
  }
}

void chkWhichCrimeBtnPresses() {
  if (button.pressed) {
    whatpressed = 1;
    did = false;
    called= true;
  } else if (button2.pressed) {
    whatpressed = 2;
    did = false;
    called= true;
  } else if (button3.pressed) {
    whatpressed = 3;
    did = false;
    called= true;
  } else if (button4.pressed) {
    whatpressed = 4;
    did = false;
    called= true;
  } else if (button5.pressed) {
    whatpressed = 5;
    did = false;
    called= true;
  } else if (button6.pressed) {
    whatpressed = 6;
    did = false;
    called= true;
  } else if (button7.pressed) {
    whatpressed = 7;
    did = false;
    called= true;
  } else if (button8.pressed) {
    whatpressed = 8;
    did = false;
    called= true;
  } else if (button9.pressed) {
    whatpressed = 9;
    did = false;
    called= true;
  }
}

void chkWhichDateBtnPressed() {
  if (yr1.pressed) {
    the_year = "2017";
    showDateYearPoint(0, 0);
    year_pressed_position = 1;
    did = false;
    called= true;
  } else if (yr2.pressed) {
    the_year = "2018";
    showDateYearPoint(37, 0);
    year_pressed_position = 2;
    did = false;
    called= true;
  } else if (yr3.pressed) {
    the_year = "2019";
    showDateYearPoint(72, 0);
    year_pressed_position = 3;
    did = false;
    called= true;
  } else if (m1.pressed) {
    the_month = "01";
    showDateMonthPoint(0, 0);
    month_pressed_position = 1;
    did = false;
    called= true;
  } else if (m2.pressed) {
    the_month = "02";
    showDateMonthPoint(37, 0);
    month_pressed_position = 2;
    did = false;
    called= true;
  } else if (m3.pressed) {
    the_month = "03";
    showDateMonthPoint(72, 0);
    month_pressed_position = 3;
    did = false;
    called= true;
  } else if (m4.pressed) {
    the_month = "04";
    showDateMonthPoint(108, 0);
    month_pressed_position = 4;
    did = false;
    called= true;
  } else if (m5.pressed) {
    the_month = "05";
    showDateMonthPoint(143, 0);
    month_pressed_position = 5;
    did = false;
    called= true;
  } else if (m6.pressed) {
    the_month = "06";
    showDateMonthPoint(179, 0);
    month_pressed_position = 6;
    did = false;
    called= true;
  } else if (m7.pressed) {
    the_month = "07";
    showDateMonthPoint(215, 0);
    month_pressed_position = 7;
    did = false;
    called= true;
  } else if (m8.pressed) {
    the_month = "08";
    showDateMonthPoint(251, 0);
    month_pressed_position = 8;
    did = false;
    called= true;
  } else if (m9.pressed) {
    the_month = "09";
    showDateMonthPoint(287, 0);
    month_pressed_position = 9;
    did = false;
    called= true;
  } else if (m10.pressed) {
    the_month = "10";
    showDateMonthPoint(323, 0);
    month_pressed_position = 10;
    did = false;
    called= true;
  } else if (m11.pressed) {
    the_month = "11";
    showDateMonthPoint(359, 0);
    month_pressed_position = 11;
    did = false;
    called= true;
  } else if (m12.pressed) {
    the_month = "12";
    showDateMonthPoint(396, 0);  
    month_pressed_position = 12;
    did = false;
    called= true;
  }
}

void changeDatePointerLoc() {
  if (year_pressed_position == 1) {
    showDateYearPoint(0, 0);
  } else if (year_pressed_position == 2) {
    showDateYearPoint(37, 0);
  } else if (year_pressed_position == 3) {
    showDateYearPoint(72, 0);
  } 

  if (month_pressed_position == 1) {
    showDateMonthPoint(0, 0);
  } else if (month_pressed_position == 2) {
    showDateMonthPoint(37, 0);
  } else if (month_pressed_position == 3) {
    showDateMonthPoint(72, 0);
  } else if (month_pressed_position == 4) {
    showDateMonthPoint(108, 0);
  } else if (month_pressed_position == 5) {
    showDateMonthPoint(143, 0);
  } else if (month_pressed_position == 6) {
    showDateMonthPoint(179, 0);
  } else if (month_pressed_position == 7) {
    showDateMonthPoint(215, 0);
  } else if (month_pressed_position == 8) {
    showDateMonthPoint(251, 0);
  } else if (month_pressed_position == 9) {
    showDateMonthPoint(287, 0);
  } else if (month_pressed_position == 10) {
    showDateMonthPoint(323, 0);
  } else if (month_pressed_position == 11) {
    showDateMonthPoint(359, 0);
  } else if (month_pressed_position == 12) {
    showDateMonthPoint(396, 0);
  }
}

void draw()
{

  if (page_number == 1)
  {
  } else if (page_number == 2)
  {
    drawPage2();
    return;
  }

  updateScrollButtons();
  updateCrimeButtons();
  updateNavBtn();
  updatePlayButton();
  datesAutoPlay();
  chkWhichCrimeBtnPresses();
  chkWhichDateBtnPressed();
  changeDatePointerLoc();

  int id = geoMap.getID(mouseX, mouseY);
  stroke(0, 150);               // Boundary colour

  if (did == false) {
    if (called && id == -1) {
      background(bg);
      showScale();
      drawMainTitle();
      drawCrimeTypeTitle();
      drawDatePickerTitle();
      drawLowHighCrimeTitle();
      drawDescription();
      updateScrollButtons();
      updatePlayButton();
      updateCrimeButtons();
      updateNavBtn();

      if (whatpressed == 1) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Burglary", geoMap); 
        showPoint(80, 160);
      } else if (whatpressed == 2) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Criminal Damage", geoMap);  
        showPoint(240, 160);
      } else if (whatpressed == 3) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Drugs", geoMap);  
        showPoint(400, 160);
      } else if (whatpressed == 4) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Fraud & Forgery", geoMap);  
        showPoint(80, 205);
      } else if (whatpressed == 5) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Other Notifiable Offences", geoMap);  
        showPoint(240, 205);
      } else if (whatpressed == 6) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Robbery", geoMap);  
        showPoint(400, 205);
      } else if (whatpressed == 7) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Sexual Offences", geoMap);
        showPoint(80, 250);
      } else if (whatpressed == 8) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Theft & Handling", geoMap);  
        showPoint(240, 250);
      } else if (whatpressed == 9) {
        setMapColourOverall(Integer.parseInt(the_year + the_month), "Violence Against The Person", geoMap);  
        showPoint(400, 250);
      }
      called = false;
      did = true;
    }
  }

  // Query the county at the mouse position.
  if (id != -1)
  {

    String name = geoMap.getAttributes().getString(id, 2); 
    background(bg);
    showScale();
    drawMainTitle();
    drawCrimeTypeTitle();
    drawDatePickerTitle();
    drawLowHighCrimeTitle();
    drawDescription();
    updateScrollButtons();
    updateCrimeButtons();
    updateNavBtn();
    updatePlayButton();
    if (whatpressed == 1) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Burglary", geoMap); 
      showPoint(80, 160);
    } else if (whatpressed == 2) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Criminal Damage", geoMap);  
      showPoint(240, 160);
    } else if (whatpressed == 3) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Drugs", geoMap);  
      showPoint(400, 160);
    } else if (whatpressed == 4) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Fraud & Forgery", geoMap);  
      showPoint(80, 205);
    } else if (whatpressed == 5) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Other Notifiable Offences", geoMap);  
      showPoint(240, 205);
    } else if (whatpressed == 6) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Robbery", geoMap);  
      showPoint(400, 205);
    } else if (whatpressed == 7) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Sexual Offences", geoMap);
      showPoint(80, 250);
    } else if (whatpressed == 8) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Theft & Handling", geoMap);  
      showPoint(240, 250);
    } else if (whatpressed == 9) {
      setMapColourSpecific(Integer.parseInt(the_year + the_month), "Violence Against The Person", geoMap);  
      showPoint(400, 250);
    }

    fill(0);

    if (whatpressed == 1) {
      //  text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Burglary", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Burglary", name), "Burglary");
    } else if (whatpressed == 2) {
      //  text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Criminal Damage", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Criminal Damage", name), "Criminal Damage");
    } else if (whatpressed == 3) {
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Drugs", name), "Drugs");
    } else if (whatpressed == 4) {
      //text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Fraud & Forgery", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Fraud & Forgery", name), "Fraud & Forgery");
    } else if (whatpressed == 5) {
      //  text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Other Notifiable Offences", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Other Notifiable Offences", name), "Other Notifiable Offences");
    } else if (whatpressed == 6) {
      //  text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Robbery", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Robbery", name), "Robbery");
    } else if (whatpressed == 7) {
      //   text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Sexual Offences", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Sexual Offences", name), "Sexual Offences");
    } else if (whatpressed == 8) {
      // text(name  + " " +  getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Theft & Handling", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Theft & Handling", name), "Theft & Handling");
    } else if (whatpressed == 9) {
      // text(name + " " + getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Violence Against The Person", name) + "\n out of " + getNumberOfAllCrimesButThis(Integer.parseInt(the_year + the_month), name) + " Crimes", mouseX+5, mouseY +5);
      drawPopup(Integer.parseInt(the_year + the_month), mouseX +20, mouseY-5, name, getNumOfCrimesOverall(Integer.parseInt(the_year + the_month), "Violence Against The Person", name), "Violence Against The Person");
    }

    changeDatePointerLoc();
    called = true;
    did = false;
  }
}

class Button
{
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;

  void pressed() {
    if (over && mousePressed) {
      pressed = true;
    } else {
      pressed = false;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}

class image_buttons extends Button
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  image_buttons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {      
      currentimage = roll;
    } else if (over) {     
      currentimage = roll;
    } else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }

  void display() {
    image(currentimage, x, y);
  }
}
