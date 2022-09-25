void setup()
{
size(450, 450);
}
void draw()
{
  background(255,255,255);
  
  fill(50,50,250);
  rect(frameCount%360+80,300,80,40);
  triangle(frameCount%360+80,300,frameCount%360+40,340,frameCount%360+80,340);
  triangle(frameCount%360+160,300,frameCount%360+200,340,frameCount%360+160,340); //Windows+roof
  
  fill(255,255,0);
  rect(frameCount%360+0,340,240,40); //Main body
  
  fill(0,0,0);
  circle(frameCount%360+60,380,40);
  circle(frameCount%360+180,380,40); //Both Wheels
  
 
  
}
