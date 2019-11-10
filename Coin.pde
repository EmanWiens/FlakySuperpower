class Coin extends Entity{
  
  
  
  Coin(float x, float y, float w, float h){
    super(x,y,w,h);
  }
  
  void render(){
     
    fill(255,255, 0);
    ellipse(x,y, WIDTH,HEIGHT);
    
  }
  
  void update(float dt){
    
  }
  
}
