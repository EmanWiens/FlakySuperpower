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
  size(1024, 768);
   

  smooth(0);

  prevTime = millis();

  float playerSize = 32;
  player = new Player(width / 2, height / 2, playerSize, playerSize);
  UI = new UI_Handler();

  spawner = new BulletSpawner();
  pigTex = loadImage("pigTex.png");
  grassTex = loadImage("grassTex.jpg");
  fenceTex = loadImage("fenceTex.png");
  //farmerTex = loadImage("f");
  rockTex = loadImage("rockTex.png");
  

  imageMode(CENTER);
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

    if (player.baby.active)
    {
      player.update(dt);

      spawner.update(dt);
    } else
    {
      float x= player.baby.x;
      float y = player.baby.y;

      float size = 8f;

      float speed = random(128f, 256f);

      PVector dir = PVector.fromAngle(random(0, TWO_PI));

      float lifespan = random(0.1f, 1f);

      color start = color(255, 35, 35, 255f);
      color end = color(255, 35, 35, 0);

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


void drawTiles() {

  float w = 32;
  float h = 32;

  int maxX = (int)(width / w) + 1;
  int maxY = (int)(height / h) + 1;
  
  for (int i = 0; i < maxX; i++)
  {
    for (int j = 0; j < maxY; j++)
    {
      image(grassTex, i * w, j * h, w, h);
    }
  }
  
  fill(115, 35, 35f, 255f);
  rect(0, 0, width, h);
  rect(0, 0, w, height); 
  rect(0, height - h, width, h);
  rect(width - w, 0, w, height);
  
  
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
