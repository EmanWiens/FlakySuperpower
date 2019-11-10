class Coin extends Entity{
  
  float elapsed;
  float timeUntilDespawn = 10;
  Coin(float x, float y, float w, float h){
    super(x,y,w,h);
    float elapsed = 0;
  }
  
  void render(){
     
    fill(255,255, 0);
    ellipse(x,y, WIDTH,HEIGHT);
    
  }
  
  void update(float dt){
    if(elapsed > timeUntilDespawn){
      this.active = false;
    }
    elapsed += dt;
  }
  
}
