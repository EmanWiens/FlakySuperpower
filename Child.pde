class Child extends Entity {
  float drag;

  final float  DISTANCE_UNTIL_PLAYER_FOLLOW = 64;

  public Child(float x, float y, float w, float h) {
    super(x, y, w, h);
  }

  public void render() {

    // rect(x, y, WIDTH, HEIGHT);
    image(pigTex, x, y, WIDTH, HEIGHT);
  };


  public void update(float dt) {

    PVector dir = new PVector(player.x - x, player.y - y);


    if (dir.mag() > DISTANCE_UNTIL_PLAYER_FOLLOW)
    {
      dir.normalize();

      float speed = player.speed;
      x += dir.x * speed * dt;
      y += dir.y * speed * dt;
    } else if (dir.mag() < (player.WIDTH + player.HEIGHT) / 2)
    {
      dir.normalize();

      float speed = -player.speed;
      x += dir.x * speed * dt;
      y += dir.y * speed * dt;
    }

    for (int i = 0; i < spawner.bullets.size(); i++) {
      if (spawner.bullets.get(i).isColliding(this) && spawner.bullets.get(i).active) {
        this.active = false;
      }
    }
  }
}
