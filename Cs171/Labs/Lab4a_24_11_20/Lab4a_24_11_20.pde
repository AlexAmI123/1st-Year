// import Jama.*;
// Solve 3x+2y=3
// -2x-y=-1
// AX=B
// X=InvA B


void setup()
{
 size(100,100);

 double [][] Aline12={{1, 1, 1}, // Create a 2D array to store A
                      {1, 2, 3},
                      { 1, 5, -3}};

 Matrix A = new Matrix(Aline12); // Copy array to A Matrix data structure

 double [][] B1ine12 = {{9}, // Create a 2D array to store B
                       {23},
                       {-7}};

 Matrix B = new Matrix(B1ine12); // Copy array to B Matrix data structure
 
 Matrix X=(A.inverse()).times(B); // Solve for X
 X.print(5,2);
}
