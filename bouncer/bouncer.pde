float x = width/2;
float y = height/2;
Mover m;

void setup()
  {
    size(640,360);
    smooth();
    m = new Mover(x,y);
  }

  // Most of this code (ellipse creation, fill, float declaration, and method calls) was
  // originally implemented in Mover but placed here because the program was not working as intended.
void draw() 
  {
    background(0);
    stroke(255);
    strokeWeight(2);
    float randomOne = random(7) + 10;
    stroke(1);
    fill(900,200,0);
    ellipse(m.location.x,m.location.y, randomOne, randomOne);
    checkEdges();
    update();
  }
  
  // This was initially in Mover but couldn't get the program to work when calling Mover's method
  // From here. The idea of update() is to get the ellipse to accelerate, apply gravity to the 
  // ellipse, and put a limit to how fast it can go.
void update() 
  {
   m.velocity.add(m.acceleration);
   //m.velocity.add(m.gravity); 
   m.velocity.limit(m.topSpeed); 
  }
  
 /* void display() 
  {
    float randomOne = random(7) + 10;
    stroke(1);
    fill(900,200,0);
    ellipse(m.location.x,m.location.y, randomOne, randomOne);
  }*/
  
  // This was initially in Mover but couldn't get the program to work when calling Mover's method
  // From here. The idea of checkEdges() is to keep the ellipse within the bounds of the screen 
  // by getting it to "bounce".
  
  void checkEdges()
  {
    if (m.location.x >= width)
    {
      PVector flip = new PVector(-1,1);
      m.velocity.dot(flip);
    }
    else if(m.location.x <= width)
    {
      PVector flip = new PVector(-1,1);
      m.velocity.dot(flip);
    }
    
    if (m.location.y >= height)
    {
      PVector flip = new PVector(1,-1);
      m.velocity.dot(flip);
    }
    else if(m.location.y <= height)
    {
      PVector flip = new PVector(1,-1);
      m.velocity.dot(flip);
    }
  }
  
  // Supposed to create an instance of mover when the mouse is clicked.
  /* 
  void mouseClicked()
  {
  Mover move = new Mover();
  move.display();
  move.update();
  move.checkEdges(); 
  }
*/
