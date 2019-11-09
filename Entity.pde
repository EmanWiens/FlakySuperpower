abstract class Entity
{
  float x; 
  float y;

  final float WIDTH;
  final float HEIGHT;

  boolean active;

  Entity(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.WIDTH = w;
    this.HEIGHT = h;
    active = true;
  }

  abstract void update(float dt);
  abstract void render();


  boolean isColliding(Entity other)
  {
    boolean result = false;
    PVector me = new PVector(x, y);
    PVector otherE = new PVector(other.x, other.y);

    //if(x < other.x - other.WIDTH || x + WIDTH > other.x && y > other.y - other.HEIGHT || y + HEIGHT < other.y)
    if (me.dist(otherE) < WIDTH / 2 + other.WIDTH/2)
    {
      result = true;
    }

    return result;
  }
}
