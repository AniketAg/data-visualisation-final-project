import org.gicentre.utils.gui.TextInput;
import org.gicentre.utils.stat.*;    // For chart classes.
import org.gicentre.utils.colour.*;  // For bar chart colour table.
String the_year2a = "201703";
String the_year2b = "201803";
String the_year3a = "2017";
String the_year3b = "2018";
int count1 = 0;
int count2 = 0;
int drawn_first_graph = 0;
TextInput textInput;
boolean isFinished;
boolean clickedOnTextArea;
BarChart barChart, barChart2;
float[] data, data2, colours, colours2;
boolean found;
int crime1 = 0;
int crime2 = 0;
int crime3 = 0;
int crime4 = 0;
int crime5 = 0;
int crime6 = 0;
int crime7 = 0;
int crime8 = 0;
int crime9 = 0;
int[] secondGraphCrimes = new int[33];
boolean over;
boolean overSecondGraph;
boolean graphTwoDrawn;

void drawSecondGraph(String date1, String date2) {

  for (int i = 0; i < 33; i++) {
    secondGraphCrimes[i] = 0;
  }

  for (TableRow row : crime_table.rows()) {
    if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Barking and Dagenham")) {
      secondGraphCrimes[0] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Barnet")) {
      secondGraphCrimes[1] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Bexley")) {
      secondGraphCrimes[2] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Brent")) {
      secondGraphCrimes[3] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Bromley")) {
      secondGraphCrimes[4] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Camden")) {
      secondGraphCrimes[5] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("City of London")) {
      secondGraphCrimes[6] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Croydon")) {
      secondGraphCrimes[7] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Ealing")) {
      secondGraphCrimes[8] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Enfield")) {
      secondGraphCrimes[9] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Greenwich")) {
      secondGraphCrimes[10] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Hackney")) {
      secondGraphCrimes[11] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Hammersmith and Fulham")) {
      secondGraphCrimes[12] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Haringey")) {
      secondGraphCrimes[13] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Harrow")) {
      secondGraphCrimes[14] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Havering")) {
      secondGraphCrimes[15] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Hillingdon")) {
      secondGraphCrimes[16] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Hounslow")) {
      secondGraphCrimes[17] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Islington")) {
      secondGraphCrimes[18] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Kensington and Chelsea")) {
      secondGraphCrimes[19] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Kingston upon Thames")) {
      secondGraphCrimes[20] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Lambeth")) {
      secondGraphCrimes[21] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Lewisham")) {
      secondGraphCrimes[22] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Merton")) {
      secondGraphCrimes[23] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Newham")) {
      secondGraphCrimes[24] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Redbridge")) {
      secondGraphCrimes[25] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Richmond upon Thames")) {
      secondGraphCrimes[26] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Southwark")) {
      secondGraphCrimes[27] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Sutton")) {
      secondGraphCrimes[28] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Tower Hamlets")) {
      secondGraphCrimes[29] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Waltham Forest")) {
      secondGraphCrimes[30] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Wandsworth")) {
      secondGraphCrimes[31] += row.getInt("Count");
    } else if ((row.getString("Month").contains(date1) || row.getString("Month").contains(date2)) &&
      row.getString("LANAME").equals("Westminster")) {
      secondGraphCrimes[32] += row.getInt("Count");
    }
  }

  data2 = new float[] {secondGraphCrimes[0], secondGraphCrimes[1], secondGraphCrimes[2], secondGraphCrimes[3], secondGraphCrimes[4], 
    secondGraphCrimes[5], secondGraphCrimes[6], secondGraphCrimes[7], secondGraphCrimes[8], secondGraphCrimes[9], secondGraphCrimes[10], 
    secondGraphCrimes[11], secondGraphCrimes[12], secondGraphCrimes[13], secondGraphCrimes[14], secondGraphCrimes[15], secondGraphCrimes[16], 
    secondGraphCrimes[17], secondGraphCrimes[18], secondGraphCrimes[19], secondGraphCrimes[20], secondGraphCrimes[21], secondGraphCrimes[22], 
    secondGraphCrimes[23], secondGraphCrimes[24], secondGraphCrimes[25], secondGraphCrimes[26], secondGraphCrimes[27], 
    secondGraphCrimes[28], secondGraphCrimes[29], secondGraphCrimes[30], secondGraphCrimes[31], secondGraphCrimes[32]}; 

  colours2 = new float[data2.length];
  ColourTable cTable2 = new ColourTable();
  cTable2.addDiscreteColourRule(0, 126, 152, 80);  // Normal colour = 0
  cTable2.addDiscreteColourRule(1, 72, 89, 42);  // Highlight colour = 1
  barChart2 = new BarChart(this);      
  barChart2.setData(data2);
  barChart2.setBarColour(colours2, cTable2);  
  barChart2.setBarGap(1); 
  barChart2.showValueAxis(true); 
  fill(255);
  noStroke();
  rect(576, 408, 380, 190);
  barChart2.draw(576, 408, 380, 190);
  graphTwoDrawn = true;
}

// Moves between pages depending in which key is pressed.
void keyPressed()
{
  if (key=='1')
  {
    drawn_first_graph =1; 
    page_number = 1;
    did = false;
    called = true;
    found = false;
    isFinished = false;
    graphTwoDrawn = false;
  } else if (key =='2')
  {
    drawn_first_graph = 0;
    page_number = 2;
    graphTwoDrawn= false;
    PFont font = createFont("Dyonisius.ttf", 10);
    textInput = new TextInput(this, font, 10);
    isFinished = false;
    if (found) barChart.draw(579, 137, 400, 180);
  }

  if (clickedOnTextArea) {
    if ((key == RETURN) || (key == ENTER))
    {
      if (textInput.getText().length() >= 4) {
        crime1 = 0;
        crime2 = 0;
        crime3 = 0;
        crime4 = 0;
        crime5 = 0;
        crime6 = 0;
        crime7 = 0;
        crime8 = 0;
        crime9 = 0;

        boolean contatins = false;

        for (TableRow row : crime_table.rows()) {
          if (row.getString("LANAME").contains(textInput.getText())) {
            contatins = true;
            if (row.getString("MajorText").equals("Burglary")) {
              crime1 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Criminal Damage")) {
              crime2 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Drugs")) {
              crime3 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Fraud & Forgery")) {
              crime4 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Other Notifiable Offences")) {
              crime5 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Robbery")) {
              crime6 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Sexual Offences")) {
              crime7 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Theft & Handling")) {
              crime8 += row.getInt("Count");
            } else if (row.getString("MajorText").equals("Violence Against The Person")) {
              crime9 += row.getInt("Count");
            }
          }
        }

        if (contatins) {
          // println("tak");
          data = new float[] {crime1, crime2, crime3, crime4, crime5, crime6, crime7, crime8, crime9};  
          colours = new float[data.length];
          ColourTable cTable = new ColourTable();
          cTable.addDiscreteColourRule(0, 165, 130, 80);  // Normal colour = 0
          cTable.addDiscreteColourRule(1, 98, 78, 50);  // Highlight colour = 1
          barChart = new BarChart(this);       

          barChart.setData(data);
          barChart.setBarColour(colours, cTable);  
          barChart.setBarLabels(new String[] {"Burg", "CrimDmg", "Drugs", "Fraud", "OtherOf", "Robbery", "SexOf", "Theft", "Violence"});
          barChart.setBarGap(2); 
          barChart.showValueAxis(true); 
          barChart.showCategoryAxis(true);
          fill(255);
          noStroke();
          rect(579, 137, 380, 180);
          barChart.draw(579, 137, 400, 180);
          found =true;
        }
      }
    } else
    {
      if (!isFinished) textInput.keyPressed();
    }
  }
}

//code for detecting which bar has been selected
//used from the Session 8 - Transforming data / Lecture notes
void mouseMoved()
{
  if (found) {
    // Reset all colours to non-highlighted
    for (int i=0; i<data.length; i++)
    {
      colours[i] = 0;
    }

    // See if mouse is over a bar.
    PVector dataUnderMouse = barChart.getScreenToData(new PVector(mouseX, mouseY));

    if (dataUnderMouse != null)
    {
      int selectedBar = int(dataUnderMouse.x);
      float dataValue = dataUnderMouse.y;

      if (dataValue < data[selectedBar])
      {
        over = true;
        colours[selectedBar ] = 1;

        fill(255);
        noStroke();
        rect(579, 137, 380, 180);
        barChart.draw(579, 137, 400, 180);

        fill(0);
        if (selectedBar == 0) {
          text("Burglary: " + crime1, 681, 151);
        } else if (selectedBar == 1) {
          text("Criminal Damage: " + crime2, 681, 151);
        } else if (selectedBar == 2) {
          text("Drugs: " + crime3, 681, 151);
        } else if (selectedBar == 3) {
          text("Fraud & Forgery: " + crime4, 681, 151);
        } else if (selectedBar == 4) {
          text("Other Notifiable Offences: " + crime5, 681, 151);
        } else if (selectedBar == 5) {
          text("Robbery: " + crime6, 681, 151);
        } else if (selectedBar == 6) {
          text("Sexual Offences: " + crime7, 681, 151);
        } else if (selectedBar == 7) {
          text("Theft & Handling: " + crime8, 681, 151);
        } else if (selectedBar == 8) {
          text("Violence Against The Person: " + crime9, 681, 151);
        }
      } else {
        over = false;
      }
    }
  }


  if (page_number == 2 && data2!=null) {
    // Reset all colours to non-highlighted

    for (int i=0; i<data2.length; i++)
    {
      colours2[i] = 0;
    }

    // See if mouse is over a bar.
    PVector dataUnderMouse = barChart2.getScreenToData(new PVector(mouseX, mouseY));

    if (dataUnderMouse != null)
    {
      int selectedBar = int(dataUnderMouse.x);
      float dataValue = dataUnderMouse.y;

      if (dataValue < data2[selectedBar])
      {
        overSecondGraph = true;
        colours2[selectedBar] = 1;
        fill(255);
        noStroke();
        rect(576, 408, 380, 190);
        barChart2.draw(576, 408, 380, 190);

        fill(0);
        if (selectedBar == 0) {
          text("Barking and Dagenham: " + secondGraphCrimes[0], 678, 436);
        } else if (selectedBar == 1) {
          text("Barnet: " + secondGraphCrimes[1], 678, 436);
        } else if (selectedBar == 2) {
          text("Bexley: " + secondGraphCrimes[2], 678, 436);
        } else if (selectedBar == 3) {
          text("Brent: " + secondGraphCrimes[3], 678, 436);
        } else if (selectedBar == 4) {
          text("Bromley: " + secondGraphCrimes[4], 678, 436);
        } else if (selectedBar == 5) {
          text("Camden: " + secondGraphCrimes[5], 678, 436);
        } else if (selectedBar == 6) {
          text("City of London: " + secondGraphCrimes[6], 678, 436);
        } else if (selectedBar == 7) {
          text("Croydon: " + secondGraphCrimes[7], 678, 436);
        } else if (selectedBar == 8) {
          text("Ealing: " + secondGraphCrimes[8], 678, 436);
        } else if (selectedBar == 9) {
          text("Enfield: " + secondGraphCrimes[9], 678, 436);
        } else if (selectedBar == 10) {
          text("Greenwich: " + secondGraphCrimes[10], 678, 436);
        } else if (selectedBar == 11) {
          text("Hackney: " + secondGraphCrimes[11], 678, 436);
        } else if (selectedBar == 12) {
          text("Hammersmith and Fulham: " + secondGraphCrimes[12], 678, 436);
        } else if (selectedBar == 13) {
          text("Haringey: " + secondGraphCrimes[13], 678, 436);
        } else if (selectedBar == 14) {
          text("Harrow: " + secondGraphCrimes[14], 678, 436);
        } else if (selectedBar == 15) {
          text("Havering: " + secondGraphCrimes[15], 678, 436);
        } else if (selectedBar == 16) {
          text("Hillingdon: " + secondGraphCrimes[16], 678, 436);
        } else if (selectedBar == 17) {
          text("Hounslow: " + secondGraphCrimes[17], 678, 436);
        } else if (selectedBar == 18) {
          text("Islington: " + secondGraphCrimes[18], 678, 436);
        } else if (selectedBar == 19) {
          text("Kensington and Chelsea: " + secondGraphCrimes[19], 678, 436);
        } else if (selectedBar == 20) {
          text("Kingston upon Thames: " + secondGraphCrimes[20], 678, 436);
        } else if (selectedBar == 21) {
          text("Lambeth: " + secondGraphCrimes[21], 678, 436);
        } else if (selectedBar == 22) {
          text("Lewisham: " + secondGraphCrimes[22], 678, 436);
        } else if (selectedBar == 23) {
          text("Merton: " + secondGraphCrimes[23], 678, 436);
        } else if (selectedBar == 24) {
          text("Newham: " + secondGraphCrimes[24], 678, 436);
        } else if (selectedBar == 25) {
          text("Redbridge: " + secondGraphCrimes[25], 678, 436);
        } else if (selectedBar == 26) {
          text("Richmond upon Thames: " + secondGraphCrimes[26], 678, 436);
        } else if (selectedBar == 27) {
          text("Southwark: " + secondGraphCrimes[27], 678, 436);
        } else if (selectedBar == 28) {
          text("Sutton: " + secondGraphCrimes[28], 678, 436);
        } else if (selectedBar == 29) {
          text("Tower Hamlets: " + secondGraphCrimes[29], 678, 436);
        } else if (selectedBar == 30) {
          text("Waltham Forest: " + secondGraphCrimes[30], 678, 436);
        } else if (selectedBar == 31) {
          text("Wandsworth: " + secondGraphCrimes[31], 678, 436);
        } else if (selectedBar == 32) {
          text("Westminster: " + secondGraphCrimes[32], 678, 436);
        }
      } else {
        overSecondGraph = false;
      }
    }
  }
}

void mousePressed() {
  if (mouseX>670 && mouseX<670+269 &&
    mouseY>106 && mouseY<106+21) {      
    clickedOnTextArea = true;
  } else {
    clickedOnTextArea = false;
    if (page_number == 2) {
      fill(232, 244, 246);
      rect(671, 107, 269, 21);
      textInput.setText("");
    }
  }
}

void drawCrimesTitles() {
  fill(50);
  font = createFont("Dyonisius.ttf",10);
  textFont(font);
  text("Burglary In A Dwelling", 50, 145);
  text("Burglary In Other Buildings", 50, 160);
  text("Criminal Damage To Dwelling", 50, 175);
  text("Criminal Damage To Motor Vehicle", 50, 190);
  text("Criminal Damage To Other Building", 50, 205);
  text("Other Criminal Damage", 50, 220);
  text("Drug Trafficking", 50, 235);
  text("Other Drugs", 50, 250);
  text("Possession Of Drugs", 50, 265);
  text("Going Equipped", 50, 280);
  text("Other Notifiable", 50, 295);
  text("Business Property", 50, 310);
  text("Personal Property", 50, 325);
  text("Other Sexual", 50, 340);
  text("Rape", 50, 355);
  text("Handling Stolen Goods", 50, 370);
  text("Motor Vehicle Interference & Tampering", 50, 385);
  text("Other Theft", 50, 400);
  text("Other Theft Person", 50, 415);
  text("Theft From Motor Vehicle", 50, 430);
  text("Theft From Shops", 50, 445);
  text("Theft/Taking Of Motor Vehicle", 50, 460);
  text("Theft/Taking Of Pedal Cycle", 50, 475);
  text("Assault With Injury", 50, 490);
  text("Common Assault", 50, 505);
  text("Harassment", 50, 520);
  text("Murder", 50, 535);
  text("Offensive Weapon", 50, 550);
  text("Other Violence", 50, 565);
  text("Wounding/GBH", 50, 580);
  text("Other Fraud & Forgery", 50, 595);
}

float getDifferenceInCrimes(String date1, String date2, String crimeType) {
  count1 = 0;
  count2 = 0;
  for (TableRow row : crime_table.rows()) {
    if (row.getString("Month").equals(date1) && row.getString("MinorText").equals(crimeType)) {
      count1 += row.getInt("Count");
    }
    if (row.getString("Month").equals(date2) && row.getString("MinorText").equals(crimeType)) {
      count2 += row.getInt("Count");
    }
  }
  return ( abs(count1 - count2) / ((count1 + count2)/2f) ) * 100 ;
}

void drawDifference(String crime, int x, int y) {
  fill(50);
  font = createFont("Dyonisius.ttf",10);
  textFont(font);
  boolean hasIncreased = false;  
  float difference = getDifferenceInCrimes(the_year2a, the_year2b, crime);
  if ((count1 - count2) <= 0) hasIncreased = true;
  if (Float.isNaN(difference))  difference = 0.0;
  if (!hasIncreased) {
    fill(100, 200, 35);
    stroke(0);
    rect(330+x, 142+y, difference, 5);
    fill(0);
    text("-"+ String.format("%.2f", difference) + "%", 395+x, 149+y);
  } else if (hasIncreased) {
    fill(200, 35, 35);
    stroke(0);
    rect(330+x, 142+y, -difference, 5);
    fill(0);
    text("+"+ String.format("%.2f", difference) + "%", 245+x, 149+y);
  }
}

void drawPage2() {
  if (drawn_first_graph == 0) {
    background(bg2);
    drawDifference("Burglary In A Dwelling", 0, 0-2);
    drawDifference("Burglary In Other Buildings", 0, 17-2);
    drawDifference("Criminal Damage To Dwelling", 0, 35-2);
    drawDifference("Criminal Damage To Motor Vehicle", 0, 50-2);
    drawDifference("Criminal Damage To Other Building", 0, 65-2);
    drawDifference("Other Criminal Damage", 0, 80-2);
    drawDifference("Drug Trafficking", 0, 96-2);
    drawDifference("Other Drugs", 0, 110-2);
    drawDifference("Possession Of Drugs", 0, 125-2);
    drawDifference("Going Equipped", 0, 139-2);
    drawDifference("Other Notifiable", 0, 155-2);
    drawDifference("Business Property", 0, 170-2);
    drawDifference("Personal Property", 0, 185-2);
    drawDifference("Other Sexual", 0, 200-2);
    drawDifference("Rape", 0, 215-2);
    drawDifference("Handling Stolen Goods", 0, 229-2);
    drawDifference("Motor Vehicle Interference & Tampering", 0, 245-2);
    drawDifference("Other Theft", 0, 260-2);
    drawDifference("Other Theft Person", 0, 275-2);
    drawDifference("Theft From Motor Vehicle", 0, 290-2);
    drawDifference("Theft From Shops", 0, 305-2);
    drawDifference("Theft/Taking Of Motor Vehicle", 0, 320-2);
    drawDifference("Theft/Taking Of Pedal Cycle", 0, 335-2);
    drawDifference("Assault With Injury", 0, 350-2);
    drawDifference("Common Assault", 0, 364-2);
    drawDifference("Harassment", 0, 378-2);
    drawDifference("Murder", 0, 393-2);
    drawDifference("Offensive Weapon", 0, 410-2);
    drawDifference("Other Violence", 0, 425-2);
    drawDifference("Wounding/GBH", 0, 440-2);
    drawDifference("Other Fraud & Forgery", 0, 455-2);
    drawCrimesTitles();
    drawn_first_graph =1;
    if (found) barChart.draw(579, 137, 400, 180-2);
  }
  updateNavBtn();
  updateDateBtns();
  updateDateBtns2();

  if (found) {
    fill(255);
    noStroke();
    if (!over) rect(579, 137, 380, 180);
    if (!over)  barChart.draw(579, 137, 400, 180);
  }

  if (!graphTwoDrawn) {  
    drawSecondGraph(the_year3a, the_year3b);
  }

  if (clickedOnTextArea && !isFinished) {
    fill(232, 244, 246);
    stroke(0);
    rect(670, 106, 269, 21);
    fill(0);
    textInput.draw(670, 106);
    return;
  }
}
