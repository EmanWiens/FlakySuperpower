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
       
       if(Input.key_w)
       {
           move.y -= 1;
       }
       if(Input.key_s)
       {
           move.y += 1;
       }
       
       if(Input.key_a)
       {
           move.x -= 1;
       }
       if(Input.key_d)
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
