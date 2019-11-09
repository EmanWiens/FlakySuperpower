class BulletSpawner
{
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  float chanceToShoot = 0.7f;
  float elapsed = 0;


  void update(float dt)
  {
    if (elapsed > 0.3f)
    {
      elapsed = 0;
      
      //we are going to shoot this frame
      if (random(0f, 1f) > 1f - chanceToShoot)
      {
         //choose a side to shoot from
         //we will do this by deciding if we are shooting from a
         //horizontal edge or vertical edge
         //after that we will decide where along the edge we will fire from
          
        boolean vertical = random(0f, 1f) > 0.5f;
        
        
        float x;
        float y;
        float w = 16;
        float h = 16;
        
        float speed = 256;
        PVector dir = new PVector();
        
        if(vertical)
        {
          boolean top =  random(0f, 1f) > 0.5f;;
          
          if(top)
          {
            y = -5;
            x = random(0, width - w);
          }
          else
          {
            y = height + 5;
            x = random(0, width - w);
          }
        }
        else
        {
          boolean left = random(0f, 1f) > 0.5f;
          
          if(left)
          {
            x = -5;
            y = random(0, height - h);
          }
          else
          {
            x = width + 5;
            y = random(0, height - h);
          }
        }
          
        dir.x = player.baby.x - x;
        dir.y = player.baby.y - y;
        dir.normalize();
        

        

        Bullet b = new Bullet(x, y, w, h, speed, dir);
        bullets.add(b);
      }
    } else
    {
      elapsed += dt;
    }

    for (Bullet b : bullets)
    {
      b.update(dt);
    }
  }

  void render()
  {
    for (Bullet b : bullets)
    {
      if (b.active) 
        b.render();
    }
  }
}
