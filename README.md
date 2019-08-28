# data-visualisation-final-project
1 Introduction 

Developed scripts in Processing for the visualization of different types of crime that happened in various boroughs of
London during 2017-2019. The obtained dataset from the London Government website delivered an extensive amount of
various crimes. Although the range of provided data was of 24 months it has still allowed to perform exploratory data
analysis exploring many crime events. It's a novel visualization which combines aspects of bar charts and line charts.

2 Description 

The task was to come up with a novel visualisation and visualise the data that has not yet been visualised or data has not been visualised in a way that you visualize it. 

The data was obtained from London Government website. This data counts the number of crimes at three different geographic levels of London (borough, ward, LSOA) per month, according to crime type. Data is available in two files for each level of geography - the most up to date data covering the last available 24 months only and one covering all historic full calendar years. However I have considered data only for borough and a combined number of crimes of two years.   

There are 9 major types of crime that were considered are: Burglary, criminal damage, drugs, fraud & forgery, other offence, robbery, sexual offences, theft & Handling, Violence against person. 

The following data visualisation was made in Processing 3.5.3, the desktop version that uses Java as a programming language. For running the program, simply run in Processing. giCentre utilities and geoMap libraries are needed to run it. You can obtain them from http://www.gicentre.net/.

As you run the file you will be able to explore the crime statistics of different boroughs of London based on the data from 2017/03-2019/02. You can hover the mouse over the map to see the location and get the criminal count of various small crimes committed in the year and month selected. You can also select one particular crime that you want to visualise by choosing a particular crime type and click play button to see the details of that particular crime committed in various location in each month from 2017/03-2019/02.To know which crime type it is currently showing or which month/year it is showing the data for simply look for a small pointer which would indicate to what it is pointing to. When you go from one month to another you will also be able to see which city has the lowest criminal count and which one has the highest criminal count in the selected month. There is a label box on the top right hand side which shows the scale of crimes i.e. each colour represents the number of crimes committed.  

You can also click on the graph button above which would direct you to another page where you can see the comparison of various crimes committed in last two years. Also, you can visualise the Total crime statistics of all the boroughs. You can also visualize the crime statistics for a specific borough. 

To visualise the data I decided to use the geoMap libraries so that I can visualise the data on the basis of the locations. I have visualised the data on the basis of both MajorCategories and MinorCategories of data where I have shown how the crime has increased or decreased in locations from month to month and also show the difference between the criminal counts from one year to another. Using this information we will also be able to determine which locations have become safe neighbourhoods and which neighbourhoods are becoming unsafe.  

Strengths would be: 

 Able to show the criminal count of each location in last two years for each month for a particular category of Crime. 

 Also able to show which kind of crime is more common or happens more often than others. 

 Also able to show the total count of each crime and compare the crimes of various cities with each other 

 Also you can see which city has the most and the least number of crimes committed at a particular month-year-crime_type. 

 You can also see the change in the crime over the years in various crime types.  

 Able to see the total statistics of all the boroughs in the two years and the overall crime statistics for any specific borough. 

Weaknesses would be: 

 Doesn’t show the crime increase/decrease from one month to another in terms of percentage which I would like to include in it later on. 

 You can visualise neighbourhoods that are becoming safer or dangerous but the visualisation doesn’t explicitly mentions which neighbourhoods are becoming safer or dangerous. 

Github Link: https://github.com/AniketAg/data-visualisation-final-project   

References 
 
[1]  giCentre utilities and geoMap have been used to produce visualisations (  HYPERLINK "http://www.gicentre.net/"  http://www.gicentre.net/ ) 

[2]  Recorded Crime: Geographic Breakdown:   HYPERLINK "https://data.london.gov.uk/dataset/recorded_crime_summary"  https://data.london.gov.uk/dataset/recorded_crime_summary  

[3]  Learning how to use geoMap and giCentreUtils:   HYPERLINK "https://www.gicentre.net/geomap/using"  https://www.gicentre.net/geomap/using. Code used for creating image buttons comes from http://processingjs.org/learning/topic/imagebutton/ written by Casey Reas and Ben Fry. 
 
 
