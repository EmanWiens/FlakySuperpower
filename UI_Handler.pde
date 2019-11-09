class UI_Handler {
  boolean paused = false;
  final float TEXT_WIDTH = 0.05;
  final float TEXT_HEIGHT = 0.1;
  final float section_HEIGHT = .15;

  public UI_Handler() {
  }

  void draw() {
    float textX = width*TEXT_WIDTH;
    float textY = height*TEXT_HEIGHT;
    String p = "Paused";
    float textSize = height*TEXT_WIDTH;

    fill(255);
    stroke(255);
    textSize(textSize);

    if (paused) {
      text(p, textX, textY);
      
      for (int i = 0; i * section_HEIGHT * height < height; i++) {
        line(0, i * section_HEIGHT * height, width, i * section_HEIGHT * height);
      }
    }
    String score = "Score";
    float pointsX =(width - textWidth(score)) - width * TEXT_HEIGHT;
    float pointsY = height * TEXT_HEIGHT;
    //  println(score.length());
    text(score +": " + player.points, pointsX, pointsY);
  }

  void update() {
    paused = Input.key_p;
  }
}
