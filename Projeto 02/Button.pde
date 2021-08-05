class Button {
  float x, y, h, w; //declarando o ponto inferior esquerdo do retangulo mais a altura e a largura
  String label;
  int action; //action do botao
  
  Button (float xx, float yy, float ww, float hh, int aa, String lbl){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    label = lbl;
    action = aa;
  }
  
  void display(){
    noStroke();
    fill(#008B8B);
    rect(x, y, w, h, 5);
    textFont(f);
    fill(#FFFFFF);
    textAlign(CENTER);
    text(label, x + w/2, y + h/2 + textSize/4);
  }
  
  boolean inside(float xx, float yy){ //usando para checar se esta dentro do retangulo
    float dx = xx - x;
    float dy = yy - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h); //comparando se esta dentro dos limites de altura e largura
  }
  
  void exec(){
    if(action == 0){ //se for o botao new curve
      println();
      if(curvas[pos].points.length == 0) //se a curva atual for igual a  zero, nao adiciona curvatura
        return;
      add_curva(); //se nao, adiciona curva
    }
    else if(action == 1){ //se for o botao de del curve
      delete_curva();
    }  
    else if(action == 2){ //se for o botao next curve
      if(curvas[pos].points.length == 0){ // se o tamanho for zero eu deleto a curva para nao bugar
        delete_curva();
        return;
      }
      
      curvas[pos].set_on(false); //vou para a proxima curva e a atual nao esta em prioriade
      pos++; //passo uma posicao no vetor curvas
      if(pos == curvas.length) //se for a ultima posicao eu reseto o vetor
        pos = 0;
      curvas[pos].set_on(true); // e logo depois seto essa curva como a nova colorida
    }
    else if(action == 3){ //se for o botao de toggle points
      vis_points = !vis_points;
    }
    else if(action == 4){ //se for o botao toggle polig
      vis_polig = !vis_polig;  
    }
    else{ //botao de toggle curve
      vis_curve = !vis_curve;
    }
  }
}
