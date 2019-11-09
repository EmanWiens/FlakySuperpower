class Particle
{
  float x;
  float y;
  
  float speed;
  
  PVector dir;
  
  float size;
  
  
  final float LIFESPAN;
  float currentLife;
  
  
  color startColor;
  color endColor;
  
  color currColor;
  
  
  Particle(float x, float y, float size, float speed, PVector dir, float lifespan, color start, color end)
  {
      this.x = x;
      this.y = y;
      this.speed = speed;
      this.dir = dir.normalize();
      this.LIFESPAN = this.currentLife = lifespan;
      this.startColor = start;
      this.endColor = end;
      
      this.size = size;
  }
  
  void update(float dt)
  {
    float t = currentLife / LIFESPAN;
    currColor = lerpColor(startColor, endColor, 1f - t);
    
    x += dir.x * speed * dt;
    y += dir.y * speed * dt;
    
    currentLife -= dt;
  }
  
  void render()
  {
     fill(currColor);
     circle(x, y, size);
  }
}

class ParticleSystem
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  void createParticle(float x, float y, float size, float speed, PVector dir, float lifespan, color start, color end)
  {
    Particle p = new Particle(x, y, size, speed, dir, lifespan, start, end);
    
    particles.add(p);
  }
  
  void update(float dt)
  {
    ArrayList<Particle> toRemove = new ArrayList<Particle>();
    for(Particle p : particles)
    {
      p.update(dt);  
      if(p.currentLife <= 0)
      {
         toRemove.add(p);
      }
    }
    particles.removeAll(toRemove);
  }
  
  void render()
  {
    for(Particle p : particles)
    {
      p.render();  
    }
  }  
}
