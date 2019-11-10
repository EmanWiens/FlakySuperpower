class UI_Handler {
  boolean paused = false;
  final float TEXT_WIDTH = 0.05;
  final float TEXT_HEIGHT = 0.1;
  final float buttonHeight = .1, buttonWidth = .30, buttonXOffset = .5;
  final float section_HEIGHT = .15;
  ArrayList<Button> buttons; 

  public UI_Handler() {
    buttons = new ArrayList<Button>();
    
    if (player != null && player.powerH != null)
      for (int i = 0; i < player.powerH.total; i++) {
        buttons.add(new Button("Purchase: " + player.powerH.getCost(i), player.powerH.getCost(i), 0, 0, buttonWidth, buttonHeight));
      }
  }

  void draw() {
    float textX = width * TEXT_WIDTH;
    float textY = height * TEXT_HEIGHT;
    String p = "Paused";
    float textSize = height * TEXT_WIDTH;

    fill(0);
    stroke(0);
    textSize(textSize);
    
    float sectY = 0;
    String temp = null;

    if (paused) {
      text(p, textX, textY);
      
      for (int i = 0; (sectY = (i + 1) * section_HEIGHT * height) < height; i++) {
        fill(255);
        stroke(255);
        textSize(textSize);
        
        temp = player.powerH.getName(i);
        if (temp != null)
          text(player.powerH.getName(i), textX, sectY + (buttonHeight * height) / 2 + textAscent());
          
        prevSectY = sectY;
        
        if (i < buttons.size()) {
          buttons.get(i).setPos(buttonXOffset * width, sectY + (buttonHeight * height) / 4);
          buttons.get(i).render();
        }
      }
    }
    
    String score = "Score";
    float pointsX =(width - textWidth(score)) - width * TEXT_HEIGHT;
    float pointsY = height * TEXT_HEIGHT;
    text(score +": " + player.points, pointsX, pointsY);
  }

  void update() {
    paused = Input.key_p;
    
    for (int i = 0; i < buttons.size(); i++) {
      buttons.get(i).update();
    }
  }
}
