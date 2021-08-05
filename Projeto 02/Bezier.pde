PFont f;
Curva[] curvas = new Curva[0]; // Array para guardar as curvas
int pos; // a posição da curva no array (qual curva estou mexendo)
int point_edit = -1; // Controla qual o ponto está sendo editado.
Menu menu;
boolean vis_points = true, vis_polig = true, vis_curve = true; // Controle de visualização dos pontos, poligonos e curvas
int textSize;
int state; 
int global_eval, temp_eval; // Qntd total de evalution e qntd temporária.

public void setup(){
  size(1400, 1000);
  menu = new Menu(0, 0, width/4, height); // Menu
  pos = 0; // sem curvas
  global_eval = 1000; // qntd inicial de avaliações
  curvas = (Curva[])append(curvas, new Curva());
  textSize = 16;
  f = createFont("JetBrains Mono", textSize, true); 
  state = 0;
}

public void draw(){
  background(#FFFFFF); // seto o background
  for(Curva curva : curvas)
    curva.display();
  menu.display();
}

void mouseClicked(){ // Ação do clique do mouse
  if(mouseButton == LEFT){ // se for o botão esquerdo
    if(menu.inside(mouseX, mouseY)){ // checo se estou em algum botão do menu
      for(Button button : menu.buttons)
        if(button.inside(mouseX, mouseY))
          button.exec(); // se estiver, executo ele
      if(menu.input.inside(mouseX, mouseY))
        menu.input.exec(); // se estive no inpút, executo ele
    }
    else // se não estiver no menu add um novo ponto
      curvas[pos].add_point(new Point(mouseX, mouseY));
  }
  
  if(mouseButton == RIGHT){ // se for o botão direito
    for(int i = 0; i < curvas[pos].points.length; i++){
      if(curvas[pos].points[i].inside())
        curvas[pos].delete_point(i); // deleta o ponto da curva
    }
  }
}

void mouseDragged(){ // Controlar o movimento da curva
  if(mouseButton != LEFT)
    return;
  
  if(point_edit == -1){
    for(int i = 0; i < curvas[pos].points.length; i++){
      if(curvas[pos].points[i].inside())
        point_edit = i;
    }
  }
  
  if(point_edit != -1)
    curvas[pos].points[point_edit].setCoord(mouseX, mouseY);
}

void mouseReleased(){
  point_edit = -1;
}

void keyPressed(){
  if(state == 1){
    if(key == ENTER || key == RETURN){
      global_eval = temp_eval;
      for(Curva curva : curvas)
        curva.set_eval(global_eval);
      state = 0;
    }
    else if(key == BACKSPACE){
      temp_eval /= 10;
    }
    else if(key >= '0' && key <= '9'){
      temp_eval *= 10;
      temp_eval = temp_eval + (key-'0');
    }
  }
}

void add_curva(){ // Vai adicionar uma nova curva no final do array
  curvas = (Curva[])append(curvas, new Curva());
  curvas[pos].set_on(false); // seta a curva atual como "off"
  pos++;
  for(int i = curvas.length - 2; i >= pos; i--)
    curvas[i+1] = curvas[i];
  curvas[pos] = new Curva();
  curvas[pos].set_on(true);
}

void delete_curva(){
  if(curvas.length == 1){
    curvas[0] = new Curva();
    return;
  }
  
  for(int i = pos; i < curvas.length-1; i++)
    curvas[i] = curvas[i+1];
  curvas = (Curva[])shorten(curvas);
  
  if(pos == curvas.length)
    pos = 0;
  curvas[pos].set_on(true);
}
