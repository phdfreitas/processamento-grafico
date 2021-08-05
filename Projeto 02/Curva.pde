class Curva {
  Point[] points; // Basicamente a curva é feita por um array de pontos.
  int eval; // A quantidade de evaluation que a curva vai ter
  boolean on; // Serve para ativar/desativar a curva
  
  Curva (){
    this.eval = global_eval; // Toda curva terá o mesmo número de evaluation
    points = new Point[0]; // Points começa sendo um array vazio.
    on = true; // A nova curva, por padrão, é a que está ativa.
  }
  
  void add_point(Point p){ // Este método serve para adicionar um novo ponto no array de pontos.
    this.points = (Point[])append(this.points, p);
  }
  
  void delete_point(int ind){ // Função que deleta um ponto. Funciona fazendo um shift do array.
    for(int i = ind; i < points.length-1; i++){
      points[i] = points[i+1];
    }
    points = (Point[])shorten(points);
  }
  
  void set_on(boolean flag){ // Serve para alterar o valor de "on/off" da curva.
    on = flag;
  }
  
  void set_eval(int x){ // Altera o valor de evaluation da curva
    if(x <= 0)
      eval = 1;
    else 
      eval = x;
  }
  
  void display(){ // Método para controlar o que deve ser mostrado na curva.
    if(points == null || points.length == 0)
      return;
    
    if(vis_polig) // Poligonos
      this.display_polig();
    if(vis_points) // Pontos
      this.display_points();
    if(vis_curve) // A própria curva
      this.display_curve();
  }
  
  void display_points(){ // Método para exibir os pontos
    for(Point p : points)
      p.display(on);
  }
  
  void display_polig(){ // Método para exibir os poligonos
    if(on)
      stroke(#FF1493);
    else
      stroke(200);
    for(int i = 1; i < points.length; i++)
      line(points[i].x, points[i].y, points[i-1].x, points[i-1].y);
  }
  
  void display_curve(){
    Point[] curva = new Point[eval+1]; // Array que guarda os pontos de eval
    curva[0] = points[0];
    Point[] temp = new Point[points.length];
    float t;
    for(int it = 1; it <= eval; it++){ // Para o número total de avaliações
      arrayCopy(points, temp); // Copio o array de pontos na curva e passo para o array temporário.
      t = ((float)it)/eval;
      for(int nivel = 1; nivel <= points.length; nivel++){ // Dentro desses laços for, acontecem n interpolações, onde n = número de pontos.
        for(int pt = 0; pt < points.length - nivel; pt++){
          temp[pt] = new Point(temp[pt], temp[pt+1], t);
        }
      }
      curva[it] = temp[0];
    }
    
    if(on) // se for true, esta ativo
      stroke(#32CD32);
    else
      stroke(200);
    for(int i = 0; i < eval; i++)
      line(curva[i].x, curva[i].y, curva[i+1].x, curva[i+1].y);
  }
}
