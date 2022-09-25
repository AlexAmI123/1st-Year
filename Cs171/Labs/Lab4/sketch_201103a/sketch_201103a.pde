Table table; // import the table class from processing.  //<>//
// getMedianTable is like the code we seen in the 3rd
// stats and probability lecture. In the code below we have to 
// adapt this code so that we can find the median for a 
// given column. The complication here is that we need to 
// take the data in the column as specified by col and 
// transfer this to an array. Then when our data from the column 
// is in the array we can use the same code as before for calculating the median. 

float getMedianTable(Table table, String col)
{
  // we need to start off by sorting the array or column
  // we need to make an array with the same number of 
  // values as the colums. 
  // we use table.getRowCount();
  
  float tempArray[] = new float[table.getRowCount()];
  
  // now we need to take the values from the col as specified
  // and copy them into our temp array. This will allow us to 
  // sort the array into ascending order (as required by the 
  // calculation for median) 
  // We must check every value in the column 
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  
  // calculate the middle index
  // between 0 and length of array - 1
  // the median is the 50 percentile 
  // so it is at 1/2 way in the sorted array. 
  int middle = (int)(tempSorted.length*0.5);
  println("The middle of tempSorted arrray is at index " + middle);
  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    median = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  
  return median;
}



  // calculate the mean of a column in the dataset
  float getMeanTable(Table table, String col){
    // This is the current mean. 
    float theMean = 0.0;
    float total = 0.0;
    // get the length of the dataset 

        long n = table.getRowCount();
    // We must check every value in the column 
    for (TableRow row : table.rows()){
      float curValue = row.getFloat(col);
      // we add up all of the values in the column
      total = total + curValue;
    }
    theMean = total/n;
    return theMean;
  }


  // Get the min value in a Table column as 
  // specified by the String parameter col 
  // function to find the minimum value 
  // in a column of data. We must specify
  // the column header name via col. 
  // This is the same as the min method we seen 
  // during the previous lectures. 
  
  float getMinTable(Table table, String col){
    // This is the largest value for Interger. 
    float curMin = Float.MAX_VALUE;
    // We must check every value in the column 
    for (TableRow row : table.rows()){
      if (row.getFloat(col) <curMin){
        curMin = row.getFloat(col);
      }
    }
    return curMin;
  }

  // Get the max value in a Table column as 
  // specified by the String parameter col 
  // function to find the max value 
  // in a column of data. We must specify
  // the column header name via col. 
  // This is the same as the max method we seen 
  // during the previous lectures. 
  
  float getMaxTable(Table table, String col)
  {
    // This is the largest value for Interger. 
    float curMax = Float.MIN_VALUE;
    // We must check every value in the column 
    for (TableRow row : table.rows()){
      if (row.getFloat(col) >curMax){
        curMax = row.getFloat(col);
   }
    }
    return curMax;
  }

void setup() {

  // LAB - 2/3 November 2020. 
  // Here we specify the file from which we will 
  // import or extract our data. We need to change the filename to
  // correspond to the names of the data files provided. 
  
  table = loadTable("veryLargeDataset.csv", "header"); 
  long n = table.getRowCount();
  println(table.getRowCount() + " total rows in table"); //printss the ammount of rows in the file

  for (TableRow row : table.rows()) {
   
    float DataA = row.getFloat("DataA");
    float DataB = row.getFloat("DataB");
 //   println(Index + "," + DataA + "," + DataB); //prints the contents of the columns
  

 
   float DataAMax = DataA.getMax(table,"DataA");
   float DataBMax = DataB.getMax(table,"DataB");
   float DataAMin = DataA.getMin(table,"DataA");
   float DataBMin = DataB.getMin(table,"DataB"); //gets the mins and maxs of the columns.
   
   
   println("The Max in the column DataA is " + DataAMax);
   println("The Max in the column DataB is " + DataBMax);
   println("The Min in the column DataA is " + DataAMin);
   println("The Min in the column DataB is " + DataBMin); //prints the mins and maxs of the columns 



float DataA = row.getFloat("DataA");
float theMeanA = 0;
float totalA = 0;
for (int i = 0; i< DataA.length; i++)
{
  totalA = totalA + DataA[i];
}
theMeanA = totalA/ (float)(DataA.length);

println("The mean value of DataA is " + theMeanA);

float DataB = row.getFloat("DataB");
float theMeanB = 0;
float totalB = 0;
for (int i = 0; i< DataB.length; i++)
{
  totalA = totalB + DataB[i];
}
theMeanA = totalB/ (float)(DataB.length);

println("The mean value of DataA is " + theMeanB);


/*
// This is the processing code for calculation of 
// StdDev in an float array. 
float calculateStdDev(float[] DataA, float theMeanA)
{ float total = 0; float diff = 0; int n = table.getRowCount();
// we need to look at each element in the array 
// subtract the mean from each element.  
for (int i = 0; i < table.getRowCount(); i++) 
  { 
      diff = pow((table.getRowCount() - theMeanB),2); 
      total = total + diff; 
  } 

float variance = total/(n - 1); 
float stdDevA = sqrt(variance); 
println("The std Dev value in row DataA is "+ stdDev);
return stdDevA; 
}



float calculateStdDev(float[] DataB, float theMeanB)
{ float total = 0; float diff = 0; int n = table.getRowCount();
// we need to look at each element in the array 
// subtract the mean from each element.  
for (int i = 0; i < table.getRowCount(); i++) 
  { 
      diff = pow((table.getRowCount() - theMeanB),2); 
      total = total + diff; 
  } 

float variance = total/(n - 1); 
float stdDevB = sqrt(variance); 
println("The std Dev value in row DataB is "+ stdDevB);
return stdDevB; 
}
*/
}
}
float getQ1Table(Table table, String col)
{
  // we need to start off by sorting the array or column
  // we need to make an array with the same number of 
  // values as the colums. 
  // we use table.getRowCount();
  
  float tempArray[] = new float[table.getRowCount()];
  
  // now we need to take the values from the col as specified
  // and copy them into our temp array. This will allow us to 
  // sort the array into ascending order (as required by the 
  // calculation for median) 
  // We must check every value in the column 
  double i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 0.25; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  
  // calculate the middle index
  // between 0 and length of array - 1
  // the median is the 50 percentile 
  // so it is at 1/2 way in the sorted array. 
  int middle = (int)(tempSorted.length*0.5);
  println("The middle of tempSorted arrray is at index " + middle);
  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    median = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  return median;
}

float getQ3Table(Table table, String col)
{
  // we need to start off by sorting the array or column
  // we need to make an array with the same number of 
  // values as the colums. 
  // we use table.getRowCount();
  
  float tempArray[] = new float[table.getRowCount()];
  
  // now we need to take the values from the col as specified
  // and copy them into our temp array. This will allow us to 
  // sort the array into ascending order (as required by the 
  // calculation for median) 
  // We must check every value in the column 
  double i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 0.75; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  
  // calculate the middle index
  // between 0 and length of array - 1
  // the median is the 50 percentile 
  // so it is at 1/2 way in the sorted array. 
  int middle = (int)(tempSorted.length*0.5);
  println("The middle of tempSorted arrray is at index " + middle);
  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    median = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  
  return median;
}



void draw()
{

}
