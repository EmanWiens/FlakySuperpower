class Child extends Entity {
  
  private PVector move;
  
  
   float drag;
  public Child(float x, float y, float w, float h){
    super(x,y,w,h);
    this.move = new PVector(x,y);
    this.drag = 256f;
  }
   
 public void render(){
   
   rect(x,y,WIDTH,HEIGHT);
 
 };
 
 public void update(float dt){
 
   
 };
 
 public void update(PVector newMove){
   this.move = newMove;
    move.normalize();
    move.rotate(PI);
    
    move.mult(drag);
    this.x +=  move.x;
    this.y += move.y;
   
 };
 
     
}
