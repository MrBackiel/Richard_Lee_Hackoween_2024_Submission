class ObstacleManager{
  private float rndspawn;
  private int fallRate;
  private int startPos;
  private int health;
  private boolean downed;
  private PImage web;
  private PImage ghost;
  private PImage bat;
  
  public ObstacleManager(int fr, int h){
    rndspawn = random(0, 350);
    fallRate = fr;
    startPos = -50;
    health = h;
    web = loadImage("web.png");
    ghost = loadImage("ghost.png");
    bat = loadImage("bat.png");
  }
  
  public void ghost(){
    if (startPos >= 400){
      resetObst();
    }
    startPos = startPos + fallRate;
    image(ghost, rndspawn, startPos, 50, 50);
  }
  public void bat(){
    if (startPos >= 400){
      resetObst();
    }
    startPos = startPos + fallRate;
    image(bat, rndspawn, startPos, 50, 50);
  }
  public void web(){
    if (startPos >= 400){
      resetObst();
    }
    startPos = startPos + fallRate;
    image(web, rndspawn, startPos, 50, 50);
  }
  
  public void resetObst(){
    rndspawn = random(0, 350);
    startPos = -50;
  }
  
  public void checkHit(float mov, float y){
    if(rndspawn > mov && rndspawn < mov + 75 && startPos + 50 >= y){
      resetObst();
      downed = true;
    }
  }
  
  public boolean hit(){
    if(downed == true){
      return true;
    }
    return false;
  }
}
