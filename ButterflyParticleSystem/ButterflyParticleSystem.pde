//I would like to have the triangles follow the x coordinates
//of the mouse. I'll be attempting that here.

//Enjoy the short novel's worth of comments :P

ParticleSystem soManyTriangles;

void setup()
{
  size(800,400);
  soManyTriangles = new ParticleSystem(new PVector(width/2,200));
}

//YES, it works!!!
//Looks like a bunch of butterflies!
void draw() 
{
  background(0);
  float mousex = map(mouseX,0,width,-.0003,.0003);
  PVector followTheMouse = new PVector(mousex,0);
  soManyTriangles.applyForce(followTheMouse);  
  soManyTriangles.addParticle();
  soManyTriangles.run();
}


