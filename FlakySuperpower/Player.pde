class Player// extends Entity
{
  
    float x; 
    float y;
    
    final float WIDTH;
    final float HEIGHT;

    Player(float x, float y, float w, float h)
    {
        this.x = x;
        this.y = y;
        this.WIDTH = w;
        this.HEIGHT = h;
    }

    void update(float dt)
    {
       PVector move = new PVector(0, 0);
       
       float speed = 256f;
       
       if(Input.key_up)
       {
           move.y -= 1;
       }
       if(Input.key_down)
       {
           move.y += 1;
       }
       
       if(Input.key_left)
       {
           move.x -= 1;
       }
       if(Input.key_right)
       {
           move.x += 1;
       }
       move.normalize();
       move.mult(speed);
                 
       x += move.x * dt;
       y += move.y * dt;
    }

    void render()
    {
        fill(255, 0, 0, 255);
        ellipse(x, y, WIDTH, HEIGHT);
    }
}
