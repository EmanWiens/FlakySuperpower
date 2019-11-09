class Child extends Entity {
  
  private PVector move;
  float drag;
  
  public Child(float x, float y, float w, float h){
    super(x,y,w,h);
    //this.move = new PVector(0,0);
    //this.drag = 100f;
  }
   
 public void render(){
   
   rect(x,y,WIDTH,HEIGHT);

 };
  
 
 public void update(float dt){
 
   
 };

 public void update(float x, float y){
  
  this.x =x; this.y = y;
  
 };

       
}
