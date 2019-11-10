
class CoinSpawner{
  
  ArrayList<Coin> coins = new ArrayList<Coin>();
  float timeUntilCheck = 0.5f;
  float chanceToSpawn = 0.3f;
  float elapsed = 0;
  
  
  
  void update(float dt)
  {
    
      if (elapsed > timeUntilCheck)
    {
      elapsed = 0;
        
        
        if (random(0f, 1f) > 1f - chanceToSpawn && coins.size() <= 5)
        {
          int x = int(random(100, 500)); int y = int(random(100, 700));
          
          coins.add(new Coin(x, y, 20, 20 ));  
         System.out.println("spawned");
        }
        
    
  }
  elapsed += dt;
  }
  
  void render(){
    for( Coin c: coins){
     if(c. active){
      c.render();
     }
    }
    
  }
}