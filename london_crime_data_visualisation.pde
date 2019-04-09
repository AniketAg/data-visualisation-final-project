import org.gicentre.geomap.*;    // Needed for loading and displaying vector map.
import org.gicentre.utils.move.*; //Needed for ZoomPan

GeoMap geoMap;
PFont heading_font, font;
PImage image;
PImage img;

Table crimeSummary, kingstonUponThames, croydon, bromley,hounslow, ealing, 
havering, hillingdon, harrow, brent, barnet , lambeth, southwark, lewisham, greenwich, 
bexley, enfield, waltham, redbridge, sutton, richmondUponThames, merton, wandsworth, 
hammersmith, kensington, westminster, camden, towerHamlets, islington, hackney, haringey, newham, barking;


int page_num;

float min_data = MAX_FLOAT;
float max_data = MIN_FLOAT;

void setup() {
  size(1900, 1000);
  image = loadImage("data/ct.jpg");
  image.resize(width, height);
  img = loadImage("data/cg.jpg");
  img.resize(width, height);
 
  //read geoMap Data
  geoMap = new GeoMap(10, 100, width-20, height - 110, this); //(x,y,w,h)
  geoMap.readFile("LondonBorough");
  geoMap.writeAttributesAsTable(34); //Displays 34 rows of attributes in the table

  //Load Table
  crimeSummary = loadTable("CrimeCount2017-19.csv", "header,csv");
  kingstonUponThames = loadTable("KingstonUponThames.csv", "header, csv");
  croydon = loadTable("Croydon.csv", "header, csv");
  bromley = loadTable("Bromley.csv", "header, csv");
  hounslow = loadTable("Hounslow.csv", "header, csv");
  ealing = loadTable("Ealing.csv", "header, csv");
  havering = loadTable("Havering.csv", "header, csv");
  hillingdon = loadTable("Hillingdon.csv", "header, csv");
  harrow = loadTable("Harrow.csv", "header,csv");
  brent = loadTable("Brent.csv", "header,csv");
  barnet = loadTable("Barnet.csv", "header,csv");
  lambeth = loadTable("Lambeth.csv", "header,csv");
  southwark = loadTable("Southwark.csv", "header,csv");
  lewisham = loadTable("Lewisham.csv", "header,csv");
  greenwich = loadTable("Greenwich.csv", "header,csv");
  bexley = loadTable("Bexley.csv", "header,csv");
  enfield = loadTable("Enfield.csv", "header,csv");
  waltham = loadTable("Waltham.csv", "header,csv");
  redbridge = loadTable("Redbridge.csv", "header,csv");
  sutton = loadTable("Sutton.csv", "header,csv");
  richmondUponThames = loadTable("RichmondUponThames.csv", "header,csv");
  merton = loadTable("Merton.csv", "header,csv");
  wandsworth = loadTable("Wandsworth.csv", "header,csv");
  hammersmith = loadTable("Hammersmith.csv", "header,csv");
  kensington = loadTable("Kensington.csv", "header,csv");
  westminster = loadTable("Westminster.csv", "header,csv");
  camden = loadTable("Camden.csv", "header,csv");
  towerHamlets = loadTable("TowerHamlets.csv", "header,csv");
  islington = loadTable("Islington.csv", "header,csv");
  hackney = loadTable("Hackney.csv", "header,csv");
  haringey = loadTable("Haringey.csv", "header,csv");
  newham = loadTable("Newham.csv", "header,csv");
  barking = loadTable("Barking.csv", "header,csv");

  
  //text properties
  font = createFont("data/Dyonisius.ttf", 28);
  heading_font = createFont("data/Dyonisius.ttf", 48);
  textAlign(CENTER);

  page_num = 0;

  for (int row = 0; row < kingstonUponThames.getRowCount(); row++) {
    min_data = min(min_data, kingstonUponThames.getFloat(row, "crimeCount"));
    max_data = max(max_data, kingstonUponThames.getFloat(row, "crimeCount"));
  }
}

void draw() {
  
  if (page_num == 0) {
    
  background(image);    // Ocean colour
  stroke(0, 40);               // Boundary colour
  fill(#16F0E3);        // Land colour

  geoMap.draw();            // Draw the entire map.

  //Heading
  fill(#ffffff);
  textFont(heading_font);
  textAlign(CENTER);
  text("Crime summary of London Boroughs from 2017/03 to 2019/02", width/2, 70);

  // Query the country at the mouse position.
  int id = geoMap.getID(mouseX, mouseY);

  if (id != -1) {
    fill(#F01633);
    geoMap.draw(id);

    String name = geoMap.getAttributeTable().findRow(str(id), 0).getString("NAME");
    fill(#ffffff);
    textSize(3*13);
    text(name, mouseX, mouseY-20);
    textSize(2*10);

    //goes through the rows in the table, compares ids and shows crime count
    for (int row=0; row<crimeSummary.getRowCount(); row++) {
      int crimeCount = crimeSummary.getInt(row, "crimeCount"); 
      int csID = crimeSummary.getInt(row, "id");
      if (id == csID) {
        text("Crime Count:" + crimeCount, mouseX, mouseY-5);
      }
    }
  }
  
  } else if (page_num == 1) {
   
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = kingstonUponThames.getFloat(row, "crimeCount");
    int cID = kingstonUponThames.getInt(row, "cid");
    String majCat = kingstonUponThames.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }
  
  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Kingston Upon Thames", width/2,50);  
  
  int x = 75;   
  int y = height/2;
  
  pushMatrix();
  translate(x,y);
  rotate(4.71239);
  translate(-x,-y);
  textSize(3*20);
  textFont(font);
  text("Major Crime Categories", x,y);
  popMatrix();
  

  } else if (page_num == 2) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = croydon.getFloat(row, "crimeCount");
    int cID = croydon.getInt(row, "cid");
    String majCat = croydon.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Croydon", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  } else if (page_num == 3) {
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = bromley.getFloat(row, "crimeCount");
    int cID = bromley.getInt(row, "cid");
    String majCat = bromley.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Bromley", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
} else if (page_num == 4) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = hounslow.getFloat(row, "crimeCount");
    int cID = hounslow.getInt(row, "cid");
    String majCat = hounslow.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Hounslow", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 5) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = ealing.getFloat(row, "crimeCount");
    int cID = ealing.getInt(row, "cid");
    String majCat = ealing.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Ealing", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 6) {
   
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = havering.getFloat(row, "crimeCount");
    int cID = havering.getInt(row, "cid");
    String majCat = havering.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Havering", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 7) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = hillingdon.getFloat(row, "crimeCount");
    int cID = hillingdon.getInt(row, "cid");
    String majCat = hillingdon.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Hillingdon", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 8) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = harrow.getFloat(row, "crimeCount");
    int cID = harrow.getInt(row, "cid");
    String majCat = harrow.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Harrow", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 9) {
    background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = brent.getFloat(row, "crimeCount");
    int cID = brent.getInt(row, "cid");
    String majCat = brent.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Brent", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 10) {
    background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = barnet.getFloat(row, "crimeCount");
    int cID = barnet.getInt(row, "cid");
    String majCat = barnet.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {
      fill(#9A05FF);
    } else if (cID == 11) {
      fill(#FF0540);
    }

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Barnet", width/2, 50);    
  
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  } else if (page_num == 11) {
    background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = lambeth.getFloat(row, "crimeCount");
    int cID = lambeth.getInt(row, "cid");
    String majCat = lambeth.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Lambeth", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  } else if (page_num == 12) {
    
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = southwark.getFloat(row, "crimeCount");
    int cID = southwark.getInt(row, "cid");
    String majCat = southwark.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Southwark", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 13) {
    
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = lewisham.getFloat(row, "crimeCount");
    int cID = lewisham.getInt(row, "cid");
    String majCat = lewisham.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Lewisham", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 14) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = greenwich.getFloat(row, "crimeCount");
    int cID = greenwich.getInt(row, "cid");
    String majCat = greenwich.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Greenwich", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();  
} else if (page_num == 15) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = bexley.getFloat(row, "crimeCount");
    int cID = bexley.getInt(row, "cid");
    String majCat = bexley.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Bexley", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
} else if (page_num == 16) {
  
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = enfield.getFloat(row, "crimeCount");
    int cID = enfield.getInt(row, "cid");
    String majCat = enfield.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
     }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Enfield", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 17) {
   
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = enfield.getFloat(row, "crimeCount");
    int cID = enfield.getInt(row, "cid");
    String majCat = enfield.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Waltham Forest", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 18) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = redbridge.getFloat(row, "crimeCount");
    int cID = redbridge.getInt(row, "cid");
    String majCat = redbridge.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Redbridge", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix(); 
} else if (page_num == 19) {
   background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = sutton.getFloat(row, "crimeCount");
    int cID = sutton.getInt(row, "cid");
    String majCat = sutton.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Sutton", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
 } else if (page_num == 20) {
 
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = richmondUponThames.getFloat(row, "crimeCount");
    int cID = richmondUponThames.getInt(row, "cid");
    String majCat = richmondUponThames.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Richmond Upon Thames", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  } else if (page_num == 21) {
    
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = merton.getFloat(row, "crimeCount");
    int cID = merton.getInt(row, "cid");
    String majCat = merton.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Merton", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 22) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = wandsworth.getFloat(row, "crimeCount");
    int cID = wandsworth.getInt(row, "cid");
    String majCat = wandsworth.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Wandsworth", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 23) {
 background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = hammersmith.getFloat(row, "crimeCount");
    int cID = hammersmith.getInt(row, "cid");
    String majCat = hammersmith.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Hammersmith and Fulham", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 24) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = kensington.getFloat(row, "crimeCount");
    int cID = kensington.getInt(row, "cid");
    String majCat = kensington.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Kensington and Chelsea", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 25) {
  
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = westminster.getFloat(row, "crimeCount");
    int cID = westminster.getInt(row, "cid");
    String majCat = westminster.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 200, 250);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
    fill(#FF0540);     
  }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -120, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 105, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Westminster", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();

  } else if (page_num == 26) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = camden.getFloat(row, "crimeCount");
    int cID = camden.getInt(row, "cid");
    String majCat = camden.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 270);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    
    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Camden", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 27) {
  
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = towerHamlets.getFloat(row, "crimeCount");
    int cID = towerHamlets.getInt(row, "cid");
    String majCat = towerHamlets.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Tower Hamlets", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
}
else if (page_num == 28) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = islington.getFloat(row, "crimeCount");
    int cID = islington.getInt(row, "cid");
    String majCat = islington.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Islington", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  } else if (page_num == 29) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = hackney.getFloat(row, "crimeCount");
    int cID = hackney.getInt(row, "cid");
    String majCat = hackney.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Hackney", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 30) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = haringey.getFloat(row, "crimeCount");
    int cID = haringey.getInt(row, "cid");
    String majCat = haringey.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
    }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Haringey", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();
  }
  else if (page_num == 31) {
  
  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = newham.getFloat(row, "crimeCount");
    int cID = newham.getInt(row, "cid");
    String majCat = newham.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
    fill(#FF0540);     
  }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }
  
  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Newham", width/2,50);    int x = 75;  int y = height/2;      pushMatrix();   translate(x,y);   rotate(4.71239);   translate(-x,-y);   textSize(3*20);   textFont(font);   text("Major Crime Categories", x,y);   popMatrix();
} 
else if (page_num == 32) {

  background(img);
  for (int row = 0; row < 11; row++) {
    float crimeCount = barking.getFloat(row, "crimeCount");
    int cID = barking.getInt(row, "cid");
    String majCat = barking.getString(row, "majorCategory");
    float rectLength = map(crimeCount, min_data, max_data, 100, 350);

    if (cID == 1) {
      fill(#60FF05);
    } else if (cID == 2) {
      fill(#9A05FF);
    } else if (cID == 3) {
      fill(#FF0540);
    } else if (cID == 4) {
      fill(#0539FF);
    } else if (cID == 5) {
      fill(#05FFFD);
    } else if (cID == 6) {
      fill(#05FF6B);
    } else if (cID == 7) {
      fill(#FEFF05);
    } else if (cID == 8) {
      fill(#FF1A05);
    } else if (cID == 9) {
      fill(#EAE8F5);     
    } else if (cID == 10) {       
      fill(#9A05FF);     
    } else if (cID == 11) {       
      fill(#FF0540);     
  }
    

    rect(width/2, 75 + row * 50, rectLength, 20);
    fill(#ffffff);
    textAlign(RIGHT);
    textSize(3*13);
    text(majCat, width/2 -110, 87+row*50);
    int count = (int) crimeCount;
    textAlign(LEFT);
    text(count, width/2 - 95, 90+row*50);
  }

  textAlign(CENTER);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);
  textSize(2*24);
  fill(#ffffff);
  text("Barking and Dagenham", width/2, 50);    
  int x = 75;  
  int y = height/2;      
  pushMatrix();   
  translate(x, y);   
  rotate(4.71239);   
  translate(-x, -y);   
  textSize(3*20);   
  textFont(font);   
  text("Major Crime Categories", x, y);   
  popMatrix();  }
  else if (page_num == 33) {
  background(img);
  textSize(3*30);
  text("No Data Available", width/2, height/2);
  textSize(3*13);
  text("Press the SPACEBAR to return to the map!", width/2, height-50);

  }
}

void mouseClicked() {
  int id = geoMap.getID(mouseX, mouseY);
  if (id == 1) {
    page_num = 1;
  } else if (id == 2) {
    page_num = 2;
  } else if (id == 3) {
    page_num = 3;
  } else if (id == 4) {
    page_num = 4;
  } else if (id == 5) {
    page_num = 5;
  } else if (id == 6) {
    page_num = 6;
  } else if (id == 7) {
    page_num = 7;
  } else if (id == 8) {
    page_num = 8;
  } else if (id == 9) {
    page_num = 9;
  } else if (id == 10) {
    page_num = 10;
  } else if (id == 11) {
    page_num = 11;
  } else if (id == 12) {
    page_num = 12;
  } else if (id == 13) {
    page_num = 13;
  } else if (id == 14) {
    page_num = 14;
  } else if (id == 15) {
    page_num = 15;
  } else if (id == 16) {
    page_num = 16;
  } else if (id == 17) {
    page_num = 17;
  } else if (id == 18) {
    page_num = 18;
  } else if (id == 19) {
    page_num = 19;
  } else if (id == 20) {
    page_num = 20;
  } else if (id == 21) {
    page_num = 21;
  } else if (id == 22) {
    page_num = 22;
  } else if (id == 23) {
    page_num = 23;
  } else if (id == 24) {
    page_num = 24;
  } else if (id == 25) {
    page_num = 25;
  } else if (id == 26) {
    page_num = 26;
  } else if (id == 27) {
    page_num = 27;
  } else if (id == 28) {
    page_num = 28;
  } else if (id == 29) {
    page_num = 29;
  } else if (id == 30) {
    page_num = 30;
  } else if (id == 31) {
    page_num = 31;
  } else if (id == 32) {
    page_num = 32;
  } else if (id == 33) {
    page_num = 33;
  }
}
void keyPressed() {
  if (key == 'b' || key == 'B' || key == ' ') {
    page_num = 0;
  }
}
