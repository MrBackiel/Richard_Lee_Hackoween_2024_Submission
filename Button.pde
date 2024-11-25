class Button{
  private float x;
  private float y;
  private float w;
  private float h;
  
  public Button(float xb, float yb, float wb, float hb){
    x = xb;
    y = yb;
    w = wb;
    h = hb;
  }
  
  public void display(){
    fill(255,140,0);
    rect(x,y,w,h);
  }
  
  public void label(String l){
    fill(0);
    textAlign(CENTER,CENTER);
    text(l, x, y, w, h);
    fill(0);
  }
  
  public boolean isInside(float mx, float my) {
    if (mx > x && mx < x + w) {
      if (my > y && my < y + h) {
        return true;
      }
    }
    return false;
  }
  
}
