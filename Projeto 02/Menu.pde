String[] button_labels = {"ADD CURVE", "REMOVE CURVE", "NEXT CURVE", "SHOW/HIDE POINTS", "SHOW/HIDE POLIGONALS", "SHOW/HIDE CURVES"};

class Menu{
  float x, y, w, h;
  Button[] buttons;
  TextBox input;
  EvalBox evalBox;
  
  Menu (float xx, float yy, float ww, float hh){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    buttons = new Button[6];
    for(int i = 0; i < 6; i++)
      buttons[i] = new Button(x + w/6, y + (3*i + 1)*h/25, 4*w/6, 2*h/25, i, button_labels[i]);
    evalBox = new EvalBox(x + w/6, y + 19*h/25, 4*w/6, 2*h/25, "EVALUATIONS: ");
    input = new TextBox(x + w/6, y + 22*h/25, 4*w/6, 2*h/25, "CHANGE NUMBER OF EVAL.");
  }
  
  void display(){
    noStroke();
    fill(#A9A9A9);
    rect(x, y, w, h);
    for(Button button : buttons)
      button.display();
    evalBox.display();
    input.display();
    textFont(f, 13);
  }
  
  boolean inside(float xx, float yy){
    float dx = xx - x;
    float dy = yy - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h);
  }
}
