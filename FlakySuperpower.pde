float prevTime;

final float SCREEN_WIDTH  = 800;
final float SCREEN_HEIGHT = 600;

Player player;

BulletSpawner spawner;
UI_Handler UI;

ParticleSystem particleSystem = new ParticleSystem();

void setup()
{

  
  size(800, 600);
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
  if (!UI.paused) {  
    
    if(player.baby.isSafe())
    {
      player.update(dt);
  
      spawner.update(dt);
    }
    else
    {
      float x= player.baby.x;
      float y = player.baby.y;
      
      float size = 8f;
      
      float speed = random(128f, 256f);
      
      PVector dir = PVector.fromAngle(random(0, TWO_PI));
      
      float lifespan = random(0.1f, 1f);
      
      color start = color(200f, 150f, 150f, 255f);
      color end = color(200f, 150f, 150f, 0f);
      
      particleSystem.createParticle(x, y, size, speed, dir, lifespan, start, end);
    }
    
    particleSystem.update(dt);
  }
  
  
  

  UI.update();
}

void render()
{
  background(0);
  noStroke();
  if (!UI.paused) {

    
    
    particleSystem.render();
    
    player.render();
    spawner.render();
  }
  //else
  UI.draw();
}
