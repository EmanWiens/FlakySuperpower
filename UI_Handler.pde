class UI_Handler {
  boolean paused = false;
  public UI_Handler() {
  }

  void draw() {
    float textX = width*0.05;
    float textY = height*0.1;
    String p = "Paused";
    float textSize = height*0.05;

    fill(255);
    textSize(textSize);

    if (paused) {
      text(p, textX, textY);
    }
    String score = "Score";
    float pointsX =(width - textWidth(score)) - width*0.1;
    float pointsY = height*0.1;
    //  println(score.length());
    text(score +": " + player.points, pointsX, pointsY);
  }
  void update() {
    paused = Input.key_p;
  }
}
