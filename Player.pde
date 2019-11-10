class Player extends Entity
{
  int rocks = 0;
  int coins = 0;
  int childDist = 25;
  Child baby;
  ArrayList<Bullet> pBullets;
  final float MAX_SPEED = 512f;

  float speed = 256f;

  PVector move = new PVector(0, 0);

  Player(float x, float y, float w, float h)
  {
    super(x, y, w, h);

    baby = new Child(x + 32, y + 32, w/2, h /2);
    pBullets = new ArrayList<Bullet>();
  }

  void update(float dt)
  {
    move.x = move.y = 0;

    if (Input.key_up || Input.key_w || Input.mouse_up) {
      move.y -= 1;
    }
    if (Input.key_down || Input.key_s || Input.mouse_down) {
      move.y += 1;
    }
    if (Input.key_left || Input.key_a || Input.mouse_left) {
      move.x -= 1;
    }
    if (Input.key_right || Input.key_d || Input.mouse_right) { 
      move.x += 1;
    }

    if (y + HEIGHT/2 >= height) {
      move.y -= 1;
    }
    if (y - HEIGHT/2 <= height*0) {
      move.y += 1;
    }
    if (x + WIDTH/2 > width) {
      move.x -= 1;
    }
    if (x - WIDTH/2 < width*0) {
      move.x += 1;
    }

    move.normalize();
    move.mult(speed);

    float tempY = y; 
    float tempX = x;

    x += move.x * dt;
    y += move.y * dt;

    if (tempY != y || tempX != x) {


      if (random(0f, 1f) > 0.1f)
      {
        float angle = move.heading() + PI;

        angle += random(-PI/4f, PI/4f);

        particleSystem.createParticle(x, y, 8, 192, PVector.fromAngle(angle), 0.2f, color(40f, 200, 40f, 255f), color(165, 42, 42, 255));
      }
    }

    baby.update(dt);

    for (int i = 0; i < spawner.bullets.size(); i++) {
      if (spawner.bullets.get(i).isColliding(this) && spawner.bullets.get(i).active) {
        spawner.bullets.get(i).active = false;
        rocks ++;
      }
    }
    for (int i = 0; i < coinSpawner.coins.size(); i++) {
      if (coinSpawner.coins.get(i).isColliding(this) && coinSpawner.coins.get(i).active) {
        coinSpawner.coins.get(i).active = false;
        coins ++;
        rocks++;
        //System.out.println(coins);
      }
    }
  }

  void render()
  {
    pushMatrix();
    translate(x, y);
    rotate(move.heading());
    image(farmerTex, 0, 0, WIDTH, HEIGHT);

    popMatrix();
    baby.render();
  }
}
