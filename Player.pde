class Player extends Entity
{

  //float x; 
  //float y;

  //final float WIDTH;
  //final float HEIGHT;
  PowerUpHandler powerH;
  ArrayList<Bullet> pBullets;
  int points = 0;

  Player(float x, float y, float w, float h)
  {
    super(x, y, w, h);
    //this.x = x;
    //this.y = y;
    //this.WIDTH = w;
    //this.HEIGHT = h;
    powerH = new PowerUpHandler();
    pBullets = new ArrayList<Bullet>();
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
    
    if (Input.key_1) {
      powerH.usePowerUp(1 - 1);
    } else if (Input.key_2) {
      powerH.usePowerUp(2 - 1);
    } else if (Input.key_3) {
      powerH.usePowerUp(3 - 1);
    } else if (Input.key_4) {
      powerH.usePowerUp(4 - 1);
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
    if (x - WIDTH/2 < width*0)
    {
      move.x += 1;
    }

    move.normalize();
    move.mult(speed);

    x += move.x * dt;
    y += move.y * dt;

    for (int i = 0; i < spawner.bullets.size(); i++) {
      if (spawner.bullets.get(i).isColliding(this) && spawner.bullets.get(i).active) {
        spawner.bullets.get(i).active = false;
        points ++;
      }
    }
  }

  void render()
  {
    fill(255, 0, 0, 255);
    ellipse(x, y, WIDTH, HEIGHT);
  }
}
