class Child extends Entity {
  float drag;
  final float  DISTANCE_UNTIL_PLAYER_FOLLOW = 64;
  PowerUpHandler powerH;
  boolean shield = false;
  private float shieldDiam;

  public Child(float x, float y, float w, float h) {
    super(x, y, w, h);
    powerH = new PowerUpHandler(this);
    shieldDiam = w * 2.5f;
  }

  public void render() {
    image(pigTex, x, y, WIDTH, HEIGHT);
    
    if (shield) {
      fill(54, 81, 91, 100);
      ellipse(x, y, shieldDiam, shieldDiam);
    }
  }


  public void update(float dt) {

    PVector dir = new PVector(player.x - x, player.y - y);


    if (dir.mag() > DISTANCE_UNTIL_PLAYER_FOLLOW)
    {
      dir.normalize();

      float speed = player.speed;
      x += dir.x * speed * dt;
      y += dir.y * speed * dt;
    } else if (dir.mag() < (player.WIDTH + player.HEIGHT) / 2) {
      dir.normalize();

      float speed = -player.speed;
      x += dir.x * speed * dt;
      y += dir.y * speed * dt;
    }

    for (int i = 0; i < spawner.bullets.size(); i++) {
      if (spawner.bullets.get(i).isColliding(this) && spawner.bullets.get(i).active) {
        if (!shield) {
          this.active = false;
          UI.gameOver = true;
        } else {
          shield = false;
          powerH.deactivate(powerH.shield);
        }
        
        spawner.bullets.get(i).active = false;
      }
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
  }
}
