class UI_Handler {
  boolean paused = false;
  final float TEXT_WIDTH = 0.05;
  final float TEXT_HEIGHT = 0.1;
  final float buttonHeight = .1, buttonWidth = .30, buttonXOffset = .5;
  final float section_HEIGHT = .15;
  ArrayList<Button> buttons; 
  Boolean gameOver;
  final String gameOverString = "Game Over! :(";
  final String pressR = "Press R to reset";
  Button backToMenu;
  final String backToMenuText = "Back to menu";

  public UI_Handler() {
    reset();
    
    textSize(height * TEXT_WIDTH);
    fill(255);
    stroke(255);
    backToMenu = new Button(backToMenuText, 0, (.5 - textWidth(backToMenuText) / width) * width, .66 * height, textWidth(backToMenuText) / width * 2, (textAscent() / height) * 2);
  }
  
  void reset() {
    buttons = new ArrayList<Button>();
    gameOver = false;
    
    if (player != null && player.baby != null && player.baby.powerH != null)
      for (int i = 0; i < player.baby.powerH.total; i++) {
        buttons.add(new Button("Purchase: " + player.baby.powerH.getCost(i), player.baby.powerH.getCost(i), 0, 0, buttonWidth, buttonHeight));
        buttons.get(i).c = color(#FF8ECA);
      }
      
    Input.key_p = false;
    Input.key_space = false;
  }

  void draw() {
    float textX = width * TEXT_WIDTH;
    float textY = height * TEXT_HEIGHT;
    String p = "Paused";
    float textSize = height * TEXT_WIDTH;

    fill(255);
    stroke(255);
    textSize(textSize);
    
    float sectY = 0;
    String temp = null;

    if (paused && !gameOver) {
      // background(#6ACDFA); //bleu
      background(#76533E); // brown
      text(p, width * .5 - textWidth(p) / 2, textY);
      
      for (int i = 0; (sectY = (i + 1) * section_HEIGHT * height) < height; i++) {
        fill(255);
        stroke(255);
        textSize(textSize);
        
        temp = player.baby.powerH.getName(i);
        if (temp != null)
          text(player.baby.powerH.getName(i), textX, sectY + (buttonHeight * height) / 2 + textAscent());
        
        if (i < buttons.size()) {
          buttons.get(i).setPos(buttonXOffset * width, sectY + (buttonHeight * height) / 4);
          buttons.get(i).render();
        }
      }
    }
    
    if (gameOver) {
      fill(0);
      stroke(0);
      textSize(textSize * 2);
      text(gameOverString, width / 2 - textWidth(gameOverString) / 2, height / 2);
      
      float tempHeight = textAscent();
      textSize(textSize / 1.5);
      text(pressR, width / 2 - textWidth(pressR) / 2, height / 2 + tempHeight);
      
      backToMenu.render();
    }
    
    fill(255);
    stroke(255);
    textSize(textSize);
    String score = "Score: " + player.rocks;
    float pointsX = (0 + textWidth(score)) - width * TEXT_HEIGHT;
    float pointsY = height * TEXT_HEIGHT;
    text(score, pointsX, pointsY);
    
    fill(255);
    stroke(255);
    textSize(textSize);
    String coins = "Coins: " + player.coins;
    float coinsX = (width - textWidth(coins)) - width * TEXT_HEIGHT;
    float coinsY = height * TEXT_HEIGHT;
    text(coins, coinsX, coinsY);
  }
  
  void resetButton(int i) {
    buttons.get(i).notPurchased();
  }

  void update() {
    if (!gameOver)
      paused = Input.key_p;    
    
    for (int i = 0; i < buttons.size(); i++) {
      buttons.get(i).update();
    }
  }
}

void instructions(){
  background(#A0C7F0);
  textSize(23);
  String summary = "OBJECTIVE: \n You are a farmer. \n Your prized pig, 'Piggy Smalls', is the envy of all other farmers. \n Protect Piggy Smalls from the rocks thrown by your jealous neighbors.";
  String objective = "Collect gold coins to purchase powerups to protect your pig.";
  String buttons = "BUTTONS: \n Use 'w', 'a', 's', 'd', or arrow keys to move. \n Use 'p' or 'space' to pause and open the Powerup Menu"; 
  
  text(summary, 15,50);
  text(objective, 15, 220);
  text(buttons, 15, 280);
  
  backButton.render();
}
