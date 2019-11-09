class Player extends Entity
{

  //float x; 
  //float y;

  //final float WIDTH;
  //final float HEIGHT;
  Child baby;
  Player(float x, float y, float w, float h)
  {
    super(x, y, w, h);
    //this.x = x;
    //this.y = y;
    //this.WIDTH = w;
    //this.HEIGHT = h;
    baby = new Child(x, y , w/5, h/5 );
  }

  void update(float dt)
  {
    PVector move = new PVector(0, 0);

    float speed = 256f;

    if (Input.key_up || Input.key_w)
    {
      move.y -= 1;
    }
    if (Input.key_down || Input.key_s)
    {
      move.y += 1;
    }
    if (Input.key_left || Input.key_a)
    {
      move.x -= 1;
    }
    if (Input.key_right || Input.key_d)
    {
      move.x += 1;
    }
    
    
    if (y + HEIGHT/2 >= height)
    {
      move.y -= 1;
    }
    if (y - HEIGHT/2 <= height*0)
    {
      move.y += 1;
    }
    if (x + WIDTH/2 > width)
    {
      move.x -= 1;
    }
    if(x - WIDTH/2 < width*0)
    {
      move.x += 1;
    }
    
    move.normalize();
    move.mult(speed);

  
    
    x += move.x * dt;
    y += move.y * dt;
    
    baby.update(x,y,move, dt);
   
    for (int i = 0; i < spawner.bullets.size(); i++) {
      if (spawner.bullets.get(i).isColliding(this))
        spawner.bullets.get(i).active = false;
    }
  }

  void render()
  {
    fill(255, 0, 0, 255);
    ellipse(x, y, WIDTH, HEIGHT);
    baby.render(x,y);
  }
}
