class RichardLeeManager{
  private PImage Lee;

  
  public RichardLeeManager(String s){
    Lee = loadImage(s);
  }
  
  public void display(int x, int y, int w, int h){

    image(Lee, x, y, w, h);
  }
}
