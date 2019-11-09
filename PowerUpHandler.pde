class PowerUpHandler {
  private String[] powerUpString = { "shield", "Circle bullets", "Auto shoot"};
  private final int shield = 0, circleBullets = 1, autoShoot = 2;
  Boolean active[] = { false, false, false };

  public PowerUpHandler() {
  }

  public void activatePowerUp(int i) {
    if (i > 0 && i < powerUpString.length)
      active[i] = true;
  }

  public void usePowerUp(int i) {
    if (i > 0 && i < powerUpString.length)
      switch (i) {
      case shield: 
        // give a shield to the baby

        break;
      case circleBullets: 
        // hail of bullets coming from you or the baby 

        break;
      case autoShoot: 
        // shoot the enemies or bullets 

        break;
      }
  }
}
