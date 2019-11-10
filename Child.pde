class Child extends Entity {
  float drag;
  final float  DISTANCE_UNTIL_PLAYER_FOLLOW = 75;
  PowerUpHandler powerH;
  boolean shield = false;
  private float shieldDiam;
  float clearDiam = 0.01f;
  float clearDiamInc = .01f;
  boolean clearRocksActive;
  float maxDiam = .5;

  public Child(float x, float y, float w, float h) {
    super(x, y, w, h);
    powerH = new PowerUpHandler(this);
    shieldDiam = w * 2.5f;
    clearRocksActive = false;
  }

  public void render() {
    image(pigTex, x, y, WIDTH, HEIGHT);
    
    if (shield) {
      fill(54, 81, 91, 100);
      ellipse(x, y, shieldDiam, shieldDiam);
    }
    
    if (clearRocksActive) {
      // stroke(255, 0, 0);
      fill(255, 0, 0, 25);
      // noFill();
      ellipse(x, y, width * clearDiam, width * clearDiam);
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
          // startScreen = true;
        } else {
          shield = false;
          powerH.deactivate(powerH.shield);
        }
        
        spawner.bullets.get(i).active = false;
      }
    }
    
    if (Input.key_q) {
      powerH.usePowerUp(powerH.clearRocks);
    } 
    
    if (clearRocksActive)
      clearRocks();
  }
  
  void clearRocks() {
    spawner.clearRocks(clearDiam);
    clearDiam += clearDiamInc;
    
    if (clearDiam >= 1) {
      clearRocksActive = false;
      powerH.deactivate(powerH.clearRocks);
      UI.resetButton(powerH.clearRocks); 
      clearDiam = 0;
    }
  }
}
