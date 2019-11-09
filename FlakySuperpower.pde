float prevTime;

final float SCREEN_WIDTH  = 800;
final float SCREEN_HEIGHT = 600;

Player player;

BulletSpawner spawner;
UI_Handler UI;
void setup()
{

  size(800,600);
  prevTime = millis();

  float playerSize = 32;
  player = new Player(SCREEN_WIDTH / 2, SCREEN_HEIGHT - playerSize, playerSize, playerSize);
  UI = new UI_Handler();

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
  if (!UI.paused && player.baby.isSafe()) {  
    player.update(dt);

    spawner.update(dt);
  }

  UI.update();
}

void render()
{
  background(0);
  if(!UI.paused){
  
  player.render();
  spawner.render();
}
//else
  UI.draw();

}
