// A simple Particle class.
// For the most part, it should be similar
// to the particle class we created in class
// as an example of particle effects.
// Trying to comment as we discussed


//Establishing class Particle
class Particle
{
// Allocate memory for instance variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector deceleration;
  float lifeSpan;
  int choice;

  //Constructor accepts a PVector as a paramater
  Particle(PVector p) 
  {
    //Initializing variables
    acceleration = new PVector(0,.02);
    deceleration = new PVector(0,-.02);
    //starting velocity is set to give a psuedo random 
    //direction.
    velocity = new PVector(0,0);
    //new PVector(random(-1,0),random(-2,0));
    //It took me a while to remember how to pull all the
    //contents of one PVector and put it into another without
    //doing it the hard way. Had to look at the processing 
    //references.
    location = p.get();
    lifeSpan = 900;
  }

  // Method to accelerate or decelerate to 
  // vector location as well as create color
  // and shapes that face the direction
  // they're moving...
  
  //This doesn't work the way I wanted it to but I like the visual
  //effect better this way actually.
  void update() 
  {
    choice = int(random(2)) + 1;
    switch(choice)
    {
     case 1: 
     velocity.add(acceleration);
     stroke(255,lifeSpan);
     fill(255, 200, 0, lifeSpan);
     triangle(location.x,location.y,location.x + 3, location.y +6, location.x + 6, location.y);
     break;
     
     case 2:
     velocity.add(deceleration);
     stroke(255,lifeSpan);
     fill(255, 200, 0, lifeSpan);
     triangle(location.x,location.y,location.x + 3, location.y -6, location.x + 6, location.y);
     break;
     
     default:
     velocity.add(acceleration);
    }
   /*  if(location.x > 800)
    {
      fill(50,0,255, lifeSpan);
    }
     else if( location.x < 0)
    {
      fill(50,0,255, lifeSpan);
    }*/
    location.add(velocity);
    lifeSpan -= 1;
  }
  
  //I created this applyForce to implement in ParticleSystem so 
  //I can get the triangles to follow the mouse's 
  //x-coordinates.
  
  void applyForce(PVector followTheMouse)
  {
  acceleration.add(followTheMouse);
  deceleration.add(followTheMouse);
  }

  // To test and see if you can still see the particle
  boolean isDead() 
  {
    if(lifeSpan <= 0)
    {
      return true;
    }
      else 
    {
      return false;
    }
  }
}

