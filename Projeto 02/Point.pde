// Essa é a classe que representa os pontos de controle da curvas
class Point {
  float x, y, raio; // x e y representam aonde o ponto vai estar e o raio representa o tamanho
  
  Point (float xx, float yy){ // Com isso eu posso criar um ponto em qualquer posição
    x = xx;
    y = yy;
    raio = 10; // No entanto, o raio sempre vai ser 12.
  }
  
  Point (Point p1, Point p2, float t){ // Aqui, dado os valores de 2 pontos, calculo a interpolação linear
    x = (1-t)*p1.x + t*p2.x;
    y = (1-t)*p1.y + t*p2.y;    
  }
  
  void setCoord(float new_x, float new_y){ // Aqui eu posso setar novas coordenadas para os pontos.
    x = new_x;
    y = new_y;
  }
  
  void display(boolean cor){ // Método usado para exibit o ponto na tela.
    noStroke();
    if(cor)
      fill(#1E90FF); // Se cor = true, aplico uma cor no ponto.
    else
      fill(200); // Caso contrário, o ponto será "cinza"
    circle(x, y, raio);// crio o ponto de fato.
  }
  
  boolean inside(){ // Função que serve para editar os pontos (remover, modificar)
    float dx = mouseX-this.x;
    float dy = mouseY-this.y;
    return dx*dx + dy*dy <= raio*raio;
  }
}
