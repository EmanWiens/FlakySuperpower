class PowerUpHandler {
  private String[] powerUpString = { "shield", "Circle bullets", "Auto shoot"};
  private final int shield = 0, circleBullets = 1, autoShoot = 2;
  ArrayList<PowerUp> allPowers;
  
  public PowerUpHandler() {
    allPowers = new ArrayList<PowerUp>();
    
    allPowers.add(new PowerUp(shield, powerUpString[shield], false));
    allPowers.add(new PowerUp(circleBullets, powerUpString[circleBullets], false));
    allPowers.add(new PowerUp(autoShoot, powerUpString[autoShoot], false));
  }
}
