// A class to utilize class Particle and make a 
// "system" of Particle objects using ArrayList.


//Establishing class ParticleSystem
class ParticleSystem
{
// Allocate memory for instance variables
  ArrayList<Particle> particles;
  PVector origin;

//ParticleSystem's constructor accepts a PVector as a 
//parameter.
  ParticleSystem(PVector location)
  {
    //Initiallizing PVector origin and ArrayList particles.
    //Particles should only consist of Particle objects.
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

//I created applyForce to implement in main so 
//I can get the triangles to follow the mouse's 
//x-coordinates.
  void applyForce(PVector direction)
  {
   for(Particle p: particles)
   {
     p.applyForce(direction);
   }
  }

//Adds a  Particle object to the ArrayList.
  void addParticle() 
  {
    //Had to watch a video to teach me how to use ArrayLists
    //and learn some methods it comes with.
    
    //This tells the particle where to be when it spawns.
    //Origin was defined as having the same location that was
    //established in class Particle.
    particles.add(new Particle(origin));
  }

  void run()
  {
    //Checks the size of Arraylist and subtracts one 
    //(because the index starts at 0), then, as long as 
    //the size of particles is greater than 0 the for loop
    //will go through and check for particles who's transparency
    //is less than or equal to 0
    for(int i = particles.size()-1; i >= 0; i--) 
    {
      //Why doesn't this work?
      //particles[i].run;
      //I'll have to do it your way...
      Particle p = particles.get(i);
      p.update();
      
      /*if(particles[i].isDead()) 
      {
        particles.remove(i);
      }*/
      if(p.isDead())
      {
        particles.remove(i);
      }
    }
  }
}
