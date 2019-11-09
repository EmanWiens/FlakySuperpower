# FlakySuperpower

## Brainstorm 
- Bullet hailstorm, rewind when you die. 
- Protect something that has 1 health. 
- Lose or gain 1hp. 
- You are the health of the health of the player. 
- either have a superpower or lose 1 hp. 
- Hp is time. 
- Hp is an item, steal it like in tag. 
- infinite runner. 
- powers cost Hp. 
- Collect Hp and use as currency. 
- 

  private final PVector[] dirVec =   {new PVector(0, 1), new PVector(1, 0), new PVector(1, 1),
                          new PVector(0, -1), new PVector(-1, 0), new PVector(-1, -1),
                          new PVector(-1, 1), new PVector(1, -1)};

private int stepToFood(Food f) {
    PVector currVec;
    int vecIndex = 0;
    float shortestDist = Float.MAX_VALUE, tempDist = 0;
    
    for (int dir = 0; dir < dirVec.length; dir++) {
      currVec = new PVector(pos.x + speed * dirVec[dir].x, pos.y + speed * dirVec[dir].y);
      
      tempDist = currVec.dist(f.pos);
      if (tempDist < shortestDist) {
        vecIndex = dir;
        shortestDist = tempDist;
      }
    }
    
    return vecIndex;
  }


  dirIndex = stepToFood(simH.food.get(closestFood()));
      pos.x += dirVec[dirIndex].x * speed;
      pos.y += dirVec[dirIndex].y * speed;