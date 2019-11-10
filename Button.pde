class Button extends Entity {
  String name; 
  int cost; 
  boolean purchased;

  public Button(String name, int cost, float x, float y, float WIDTH, float HEIGHT) {
    super(x, y, WIDTH, HEIGHT);
    this.name = name; 
    this.cost = cost;
    purchased = false;
  }

  public void update(float dt) {
  }

  public void update() {
  }

  public boolean hit(float x, float y) {
    return x > this.x && x < this.x + (WIDTH * width) && y > this.y && y < this.y + (HEIGHT * height);
  }

  public void purchased() { 
    purchased = true; 
    name = "Purchased.";
  }
  
  public void notPurchased() {
    purchased = true; 
    name = "Purchase: " + cost;
  }

  public void setPos(float x, float y) {
    this.x = x; 
    this.y = y;
  }

  public void render() {
    stroke(150);
    fill(150);
    rect(x, y, WIDTH * width, HEIGHT * height);

    stroke(255);
    fill(255);
    text(name, x + (WIDTH * width) / 2 - textWidth(name) / 2, y + (HEIGHT * height / 2) + textAscent() / 3);
  }
}
