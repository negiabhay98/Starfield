//your code here
Particle[] star;
void setup()
{
  //your code here
  background(0);
  size(800, 800);
  star = new Particle[801];
  for (int i = 0; i <= 789; i++)
  {
    star[i] = new NormalParticle();
  }
  for (int i = 790; i <= 799; i++)
  {
    star[i] = new OddballParticle();
  }
  star[800] = new JumboParticle();

}
void draw()
{
  //your code here
  background(0);
  for(int i = 0; i < star.length; i++)
  {
    star[i].move();
    star[i].show();
  }
}
class NormalParticle implements Particle
{
  //your code here
  double myX, myY, speed, ang;
  int Col;
  NormalParticle()
  {
    myX = 400;
    myY = 400;
    speed = 3;
    ang = Math.random()*2*Math.PI;
    //Col = (int)(Math.random()*255); 
  }
  public void move()
  {
    myX = myX + Math.cos(ang)*speed;
    myY = myY + Math.sin(ang)*speed;
    if (myX < 0 || myX >800)
    {
      myX = 400; 
      if (Math.random()*2 > 1)
      {
        myY = 400;
      }
    }
    if (myY < 0 || myY > 800)
    {
      myY = 400; 
      if (Math.random()*2 > 1)
    {
      myX = 400;
    }
    }
  }
  public void show()
  {
    fill(255, 255, 255);
    noStroke();
    ellipse((float)myX, (float)myY, 5, 5);
  }
}
interface Particle
{
  //your code here
  public void show();
  public void move();
}
class OddballParticle implements Particle //uses an interface
{
  //your code here
  int Col;
  double myX, myY, speed, ang;
  OddballParticle()
  {
    myX = 400;
    myY = 400;
    speed = 3;
    ang = Math.random()*2*Math.PI;
    Col = (int)(Math.random()*255);
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*2);
    myY = myY + (int)(Math.random()*2);
  }
  public void show ()
  {
    fill((int)Math.random()*255, (int)Math.random()*255, (int)Math.random()*255);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}
class JumboParticle extends OddballParticle//uses inheritance
{
  //your code here
  JumboParticle()
  {
    speed = 1;
  }
  public void show()
  {
    fill(0, 200, 0);
    ellipse((float)myX, (float)myY, 20, 20);
  }
}

