PImage grassTex;
PImage pigTex;
PImage fenceTex;
PImage farmerTex;
PImage rockTex;
float prevTime;

PVector[][] tileArray;
final int tileNum = 5;
Player player;

BulletSpawner spawner;
UI_Handler UI;

ParticleSystem particleSystem = new ParticleSystem();

void setup()
{
  size(800, 600);
  // fullScreen();
  
  smooth(0);
  
  prevTime = millis();

  float playerSize = 32;
  player = new Player(width / 2, height - playerSize, playerSize, playerSize);
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
  
  UI.draw();
}


void drawTiles(){
 
  float w = 128;
  float h = 128;
  
  for(int i = 0; i < width / w; i++)
  {
    for(int j = 0; j < width / w; j++)
    {
      image(grassTex, i * w, j * h, w, h);    
    }
  }
}

void mouseReleased() {
  if (UI.paused) {
    for (int i = 0; i < UI.buttons.size(); i++) {
      if (UI.buttons.get(i).hit(mouseX, mouseY) && player.points >= UI.buttons.get(i).cost) {
        player.points -= UI.buttons.get(i).cost;
        player.powerH.activate(i);
        UI.buttons.get(i).purchased();
      }
    }
  }
}
