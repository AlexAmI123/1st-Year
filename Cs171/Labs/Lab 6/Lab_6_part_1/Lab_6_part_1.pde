void setup()
{
 size(400, 400);
 background(255,255,255);
}
void draw()
{
   float step=(2*PI)/120; // 50 steps on interval [0,2PI]

   float theta_start=0; // Starting theta value

   float old_sx=map(theta_start,0,2*PI,4,width-4); // Calculate screen x position fromtheta
   float old_sy1=map(sin(theta_start),-1,1,height-4,4); // Calculate screen y positioncoresponding sine theta
   float old_sy2=map(cos(theta_start),-1,1,height-4,4); // ADD YOUR CODE Calculate screen y position coresponding cosine theta

 for(float theta=step;theta<=(2*PI)+step;theta+=step) // Loop theta values on range[0+1step,2PI]
 {  
   float screen_x=map(theta,0,2*PI,4,width-4); // Calculate screen x position fromtheta
   float screen_y1=map(sin(theta),-1,1,height-4,4); // Calculate screen y positioncoresponding sine theta
   float screen_y2=map(cos(theta),-1,1,height-4,4);// ADD YOUR CODE
   /*  stroke(255,0,0);
   line(old_sx,old_sy1,screen_x,screen_y1); // Draw line from old point to the newpoint

   stroke(0,255,0);
   line(old_sx,old_sy2,screen_x,screen_y2); // Draw line from old point to the newpoint
    */
    stroke(0,0,255);
    line(old_sy1,old_sy2,screen_y1,screen_y2); // sine vs cosine
    old_sx=screen_x; // The current new points updates oldpoints
    old_sy1=screen_y1;
    old_sy2=screen_y2;    

 } // Repeat for each theta value
} //Redraw the new screen
