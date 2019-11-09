class Child extends Entity {
  
  //private PVector move;
  float drag;
  
  public Child(float x, float y, float w, float h){
    super(x,y,w,h);
    
    this.drag = 100f;
  }
   
 public void render(){
   
   rect(x,y,WIDTH,HEIGHT);
   //line(this.x, this.y, x, y);
 };
  public void render(float _x, float _y){
   
   rect(x,y,WIDTH,HEIGHT);
   stroke(255);
   //line(this.x, this.y, _x, _y);
 };
 
 public void update(float dt){
 
   
 };

 public void update(float _x, float _y, PVector move, float dt){
   
   PVector p_v = new PVector(_x, _y);
   PVector c_v = new PVector(this.x, this.y);
   
   float a = PVector.angleBetween(p_v, c_v);
   
  
    System.out.println("a:" + a);
    //System.out.println("move:" + move);
    //stroke( 255, 255, 0);
    //line(move.x, move.y, x,y );
    
     

    //System.out.println("cos:" + cos(a));
    //System.out.println("sin:" + sin(a));
    
   if(checkDist(p_v, c_v) ){
    //System.out.println("cos:" + cos(a));
    //System.out.println("sin:" + sin(a));
    this.x += cos(a) * move.x * dt;
    this.y += sin(a) * move.y * dt;
   }else {
     //System.out.println(checkDist(p_v, dir));
   }
  
   
     
  
 };
 public boolean checkDist(PVector playerVector, PVector childVector){
   
   System.out.println(childVector.dist(playerVector));
   return childVector.dist(playerVector) >= 50;
     
   
   
 }
       
}
