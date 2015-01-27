class Mover
{
  PVector location;
  PVector velocity; 
  PVector acceleration;
  PVector gravity;
  
  float topSpeed;
  
  // Constructor for mover, accepts two float parameters
  Mover(float x, float y)
  {
    float randomOne = randomGaussian();
    float randomTwo = randomGaussian();
    location = new PVector (x,y);
    velocity = new PVector (0,0);
    gravity = new PVector (0, .001);
    acceleration = new PVector(randomOne, randomTwo);
    topSpeed = 10;
  }
  
}
