class EvalBox {
  float x, y, h, w; //variáveis do ponto x e y e a altura mais a largura
  String label;
  
  EvalBox(float xx, float yy, float ww, float hh, String lbl1){ //CONSTRUTOR PARECIDO COM O DO BUTAO SO QUE SEM A ACTION
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    label = lbl1;
  }
  
  void display(){
    noStroke();
    fill(#F8F8FF); //cor do retangulo
    rect(x, y, w, h, 5); //inicializando o retangulo
    textFont(f); //declarando a fonte
    textAlign(CENTER); //colocando o texto no centro do retangulo
    fill(#004369); //cor do texto
    text(label + global_eval, x + w/2, y + h/2 + textSize/4); //coordenadas do local do texto e varial contadora do eval
  }
}
