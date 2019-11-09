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
void setup()
{

  size(800, 600);
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
  if (!UI.paused && player.baby.isSafe()) {  
    player.update(dt);

    spawner.update(dt);
  }

  UI.update();
}

void render()
{
  background(0);
  if (!UI.paused) {
    drawTiles();
    player.render();
    spawner.render();
  }
  //else
  UI.draw();
}


void drawTiles(){
 
  float w = 256;
  float h = 256;
  

     image(grassTex, 0, 0, w,h); 
       

    // rect(i * w, j * h, w,h);      

   
 
 

 
}
