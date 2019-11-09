class BulletSpawner
{
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  float chanceToShoot = 0.5f;
  float elapsed = 0;


  void update(float dt)
  {
    if (elapsed > 0.5f)
    {
      elapsed = 0;

      if (random(0f, 1f) > chanceToShoot)
      {
        float x = random(0, SCREEN_WIDTH);
        float y =  -5;
        float w = 8;
        float h = 8;

        float speed = 256;
        PVector dir = new PVector(0, 1);

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
