class PowerUp {
  int id; 
  String name; 
  boolean active;
  int level;
  
  public PowerUp(int id, String name, boolean active) {
    this.id = id; 
    this. name = name;
    this.active = active;
    level = 0;
  }
  
  public void activate() { active = true; } 
  
  public void usePowerUp() {
    
  }
}
