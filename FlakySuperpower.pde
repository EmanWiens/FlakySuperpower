import processing.sound.*;


PImage grassTex;
PImage pigTex;
PImage coinTex;
PImage farmerTex;
PImage rockTex;
PImage titleImg;
float  prevTime;
SoundFile gameMusic;

final float playerSize = 50;
PVector[][] tileArray;
final int tileNum = 5;
Player player;
CoinSpawner coinSpawner;
BulletSpawner spawner;
UI_Handler UI;
boolean startScreen;
String gameName = "Save your bacon!";
String startButtonText = "Get Rowdy!";
String instructionText = "Instructions";
Button startGameButton, instructionsButton, backButton;
boolean instructions;

boolean mousePress;
PVector mousePressPos, tempMousePos;
float mousePressRatio = .025;
final float maxAngle = 45;
Button pauseButton; 

ParticleSystem particleSystem;

void setup()
{
  size(1024, 700);
  smooth(0);

  prevTime = millis();
  startScreen = true;
  // init();

  //float playerSize = 50;
  player = new Player(width / 2, height / 2, playerSize, playerSize);
  UI = new UI_Handler();

  spawner = new BulletSpawner();
  pigTex = loadImage("pigTex.png");
  grassTex = loadImage("grassTex.jpg");
  coinTex = loadImage("coinTex.png");
  farmerTex = loadImage("farmerTex.png");
  rockTex = loadImage("rockTex.png");
  titleImg = loadImage("titleScreenImage.png");

  //gameMusic = new SoundFile(this, "testMusic.wav");
  //gameMusic.loop();
  imageMode(CENTER);

  textSize(height * UI.TEXT_WIDTH);
  fill(255);
  stroke(255);
  startGameButton = new Button(startButtonText, 0, (.5 - (textWidth(startButtonText)/2) / width) * width, .8 * height, textWidth(startButtonText) / width, (textAscent() / height));

  instructionsButton = new Button(instructionText, 0, (.5 - ((textWidth(instructionText) / width))/2 *1.5) * width, 0.39 * height, (textWidth(instructionText) / width) * 1.5, (textAscent() / height)* 1.5);
  instructionsButton.c = color(#A0C7F0);
  backButton = new Button("BACK", 0, (.5 - ((textWidth(instructionText) / width))/2 *1.5) * width, 0.8 * height, (textWidth(instructionText) / width) * 1.5, (textAscent() / height)* 1.5);

  String pause = "||"; 
  pauseButton = new Button(pause, 0, (.95 - (textWidth(pause)/2) / width) * width, .05 * height, textWidth(pause) / width, (textAscent() / height));
  pauseButton.c = color(150);
}

void showStartScreen() {
  background(0);
  image(titleImg, width/2, height/2, width, height);

  textSize(height * UI.TEXT_WIDTH * 2);
  stroke(#6C99C9);
  fill(#6C99C9);
  text(gameName, .5 * width - textWidth(gameName) / 2, .23 * height);
  textSize(height * UI.TEXT_WIDTH);
  startGameButton.render();
  instructionsButton.render();
}

void init() {
  particleSystem = new ParticleSystem();
  //float playerSize = 50;
  player = new Player(width / 2, height / 2, playerSize, playerSize);
  // UI = new UI_Handler();
  UI.reset();
  instructions = false;
  spawner = new BulletSpawner();
  coinSpawner = new CoinSpawner();
  mousePress = false;
  mousePressPos = new PVector(0, 0);
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
  if (!startScreen) {
    if (!UI.paused) {  

      if (player.baby.active)
      {
        player.update(dt);

        spawner.update(dt);
        coinSpawner.update(dt);
      } else {
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

    if (Input.key_r) 
      init();
  }
}

void render()
{
  // background(0);
  noStroke();

  if (startScreen)
    showStartScreen();
  else if (!startScreen) {
    if (!UI.paused) {
      drawTiles();
      particleSystem.render();
      player.render();
      spawner.render();
      coinSpawner.render();
    }

    UI.draw();
    if (instructions) {
      instructions();
    } 
    
    pauseButton.render();

    if (mousePress && !startScreen) {
      noStroke();
      fill(0, 0, 0, 150);
      tempMousePos = new PVector(mouseX, mouseY);
      ellipse(mousePressPos.x, mousePressPos.y, mousePressRatio * width, mousePressRatio * width);
      float angle;
      float delta_x = mousePressPos.x - tempMousePos.x;
      float delta_y = mousePressPos.y - tempMousePos.y;
      angle = atan2(delta_y, delta_x);

      if (angle <= radians(1.5 * maxAngle) && angle >= radians(-1.5 * maxAngle)) {
        Input.mouse_right = false;
        Input.mouse_left = true;
      } else if (angle >= radians(2.5 * maxAngle) || angle <= -radians(2.5 * maxAngle)) {
        Input.mouse_right = true;
        Input.mouse_left = false;
      } else {
        Input.mouse_right = false;
        Input.mouse_left = false;
      }

      if (angle >= radians(.5 * maxAngle) && angle <= radians(3.5 * maxAngle)) {
        Input.mouse_up = true;
        Input.mouse_down = false;
      } else if (angle <= radians(-.5 * maxAngle) && angle >= radians(-3.5 * maxAngle)) {
        Input.mouse_up = false;
        Input.mouse_down = true;
      } else {
        Input.mouse_up = false;
        Input.mouse_down = false;
      }
    }
  }
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
      if (UI.buttons.get(i).hit(mouseX, mouseY) && player.coins >= UI.buttons.get(i).cost && !player.baby.powerH.owned[i]) {

        if (i != player.baby.powerH.speed) {
          UI.buttons.get(i).purchased();
          player.coins -= UI.buttons.get(i).cost;
          player.baby.powerH.activate(i);
        } else if (player.speed <= player.MAX_SPEED) {
          player.coins -= UI.buttons.get(i).cost;
          player.baby.powerH.activate(i);
        } else if (player.speed >= player.MAX_SPEED)
          UI.buttons.get(i).purchased();
      }
    }
  }

  if (!startScreen && pauseButton.hit(mouseX, mouseY)) {
    Input.key_p = !UI.paused;
  }
  if (startGameButton.hit(mouseX, mouseY) && startScreen) {
    init();
    startScreen = false;
  } else if (UI.backToMenu.hit(mouseX, mouseY) && !startScreen && UI.gameOver) {
    startScreen = true;
  } else if (instructionsButton.hit(mouseX, mouseY) && !instructions && startScreen) {
    init();
    instructions = true;
    startScreen = false;
  } else if (instructions && backButton.hit(mouseX, mouseY) && !startScreen)
  {
    instructions = false;
    startScreen = true;
  }

  mousePress = false;
  Input.mouse_up = false; 
  Input.mouse_down = false;
  Input.mouse_left = false;
  Input.mouse_right = false;
}

void mousePressed() {
  mousePress = true;
  mousePressPos = new PVector(mouseX, mouseY);
}
