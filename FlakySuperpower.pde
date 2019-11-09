PImage grassTex;
PImage pigTex;
PImage fenceTex;
PImage farmerTex;
PImage rockTex;
float prevTime;

PVector[][] tileArray;
final float SCREEN_WIDTH  = 800;
final float SCREEN_HEIGHT = 600;
final int tileNum = 5;
Player player;

BulletSpawner spawner;
UI_Handler UI;

ParticleSystem particleSystem = new ParticleSystem();

void setup()
{

  
  size(800, 600);
  
  smooth(0);
  
  prevTime = millis();

  float playerSize = 32;
  player = new Player(SCREEN_WIDTH / 2, SCREEN_HEIGHT - playerSize, playerSize, playerSize);
  UI = new UI_Handler();

  spawner = new BulletSpawner();
  pigTex = loadImage("pigTex.png");
  grassTex = loadImage("grassTex.png");
  fenceTex = loadImage("fenceTex.png");
  //farmerTex = loadImage("f");
  rockTex = loadImage("rockTex.png");;
  

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
    drawTiles();

    
    
    particleSystem.render();
    
    player.render();
    spawner.render();
  }
  //else
  UI.draw();
}


void drawTiles(){
 
  float w = 32;
  float h = 32;
  
  for(int i = 0; i < width / w; i++)
  {
    for(int j = 0; j < width / w; j++)
    {
      image(grassTex, i * w, j * h, w, h);    
    }
  }
    
  
      
       

    // rect(i * w, j * h, w,h);      

   
 
 

 
}
