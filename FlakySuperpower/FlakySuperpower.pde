float prevTime;

final float SCREEN_WIDTH  = 800;
final float SCREEN_HEIGHT = 600;

Player player;

BulletSpawner spawner;

void setup()
{
  
    size(800, 600);
    prevTime = millis();
    
    float playerSize = 32;
    player = new Player(SCREEN_WIDTH / 2, SCREEN_HEIGHT - playerSize, playerSize, playerSize);
    
    
    spawner = new BulletSpawner();
}

void draw()
{
    float currTime = millis();
    float dt = (currTime - prevTime) / 1000f;
    prevTime = currTime;
    
    
    update(dt);
    render();
}

void update(float dt)
{
    player.update(dt);
    
    spawner.update(dt);
}

void render()
{
    background(0);
    
    player.render();
    
    spawner.render();
}
