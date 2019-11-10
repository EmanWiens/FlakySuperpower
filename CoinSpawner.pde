
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
          int x = int(random(100, width-100)); int y = int(random(100, height -100 ));
          
          coins.add(new Coin(x, y, 20, 20 ));  
          
          //System.out.println("spawned");
        }
        
    
  }
      elapsed += dt;
      
        for( int i = 0; i< coins.size();  i++){
          coins.get(i).update(dt);
          
        }
  }
  
  void render(){
    for( Coin c: coins){
     
      if(c.active){
        c.render();
    }
    
  }
  
  for( int i = 0; i< coins.size();  i++){
     
      if(!coins.get(i).active){
        coins.remove(i);
        i--;
    }
    
  }
}
}
