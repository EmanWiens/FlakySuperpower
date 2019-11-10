class PowerUpHandler {
  private String[] powerUpString = { "shield", "Circle bullets"};
  private final int shield = 0, circleBullets = 1, total = 2;
  private final int cost[] = { 10, 20 };
  Boolean active[] = { false, false };
  Child child; 

  public PowerUpHandler(Child child) {
    this.child = child; 
  }

  public int getCost(int i) { 
    return cost[i];
  }

  public void activatePowerUp(int i) {
    if (i > 0 && i < powerUpString.length)
      active[i] = true;
  }

  public String getName(int i) {
    if (i >= 0 && i < powerUpString.length)
      return powerUpString[i]; 
    else return null;
  }

  public void activate(int i) {
    if (i >= 0 && i < powerUpString.length) {
      active[i] = true;
      usePowerUp(i);
    }
  }
  
  public void deactivate(int i) {
    active[i] = false;
    UI.buttons.get(i).notPurchased();
  }

  public void usePowerUp(int i) {
    if (i >= 0 && i < powerUpString.length) {
      switch (i) {
      case shield: 
        // give a shield to the baby
        child.shield = true;
        break;
      case circleBullets: 
        // hail of bullets coming from you or the baby 
        
        break;
      }
    }
  }
}
