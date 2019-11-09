class Bullet extends Entity
{
  //float x;
  //float y;

  //final float WIDTH;
  //final float HEIGHT;


  final float SPEED;

  final PVector DIR; 

  Bullet(float x, float y, float w, float h, float speed, PVector dir)
  {
    super(x, y, w, h);
    //this.x = x;
    //this.y = y;
    //this.WIDTH = w;
    //this.HEIGHT = h;
    this.SPEED = speed;
    this.DIR = dir.normalize();
  }

  void update(float dt)
  {
    x += DIR.x * SPEED * dt;
    y += DIR.y * SPEED * dt;
  }

  void render()
  {
    fill(0, 255f, 255f, 255f);
    //rect(x, y, WIDTH, HEIGHT);
    image(rockTex, x,y, WIDTH,HEIGHT);
  }
}
