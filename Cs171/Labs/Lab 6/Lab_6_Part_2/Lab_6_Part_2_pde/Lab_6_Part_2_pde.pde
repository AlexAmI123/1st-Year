float g=-9.81;
float k=0.2; // Spring constant
float m=0.25; // Mass kg
float dt=0.005; // Time step 50ms

float vy=0; // Initial velocity
float y=0.95; // Initial position

float vx=1.5; // Initial velocity
float x=0.5; // Initial position

float t=0; // Initial time

void setup()
{
   size(500, 500);
}
   void draw()

{
   background(255,255,255);
   
   vy=vy+(g-((k/m)*vy))*dt;
   y=y+(vy*dt);
   
   vx=vx+(-((k/m)*vx))*dt;
   x=x+(vx*dt);
   
   if(y<0) vy=-vy;
   
   if(x<=0) vx=-vx;
   if(x>=1) vx=-vx;
   
   t=t+dt;
   
   float sx=map(x,0,1,0,width);
   float sy=map(y,0,1,height-1,0);
   fill(255,0,0);
   ellipse(sx-5,sy-5,10,10);
} 
