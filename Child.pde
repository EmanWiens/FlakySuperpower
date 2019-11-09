class Child extends Entity {
  boolean safe = true;
  float drag;

  public Child(float x, float y, float w, float h) {
    super(x, y, w, h);
    
  }

  public void render() {

   // rect(x, y, WIDTH, HEIGHT);
    image(pigTex, x,y, WIDTH,HEIGHT);
  };


  public void update(float dt) {
  };

  public void update(float x, float y) {

    this.x =x; 
    this.y = y;

    for (int i = 0; i < spawner.bullets.size(); i++) {
      if (spawner.bullets.get(i).isColliding(this) && spawner.bullets.get(i).active) {
        this.safe = false;
      }
    }
  }

  boolean isSafe() {
    return this.safe;
  }
}
