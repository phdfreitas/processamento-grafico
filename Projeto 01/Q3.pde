//variaveis
float Px, Py, Qx, Qy, Cx, Cy, alpha, w, dist, velocity;
PVector v, o;

void initialSetup() {
  //background(200,200,200);
  translate(400,400);
  strokeWeight(1);
  stroke(0);  //cor da linha - preta
  line(-400,0,400,0); //eixo X
  line(0,200,0,-400); //eixo Y

  printCoordinateValues();
  scale(1,-1); //objetos no primeiro quadrante
}

void printText(float text,float position, float distance) {
  PFont f = createFont("Arial",1,true);
  textFont(f,16);
  fill(0);
  textAlign(CENTER);
  String nftext = nfs(text,0,1);
  text(nftext,position,distance);
}

void configLinha() {
  strokeWeight(5);
  stroke(130, 68, 252);
}

void printCoordinateValues() {
  // desenhando linhas e valores do eixo X
  for (int x = -400; x < 400; x=x+10){
    line(x,0,x,-3);
  }
  for (int x = -400; x < 400; x=x+50){
    line(x,0,x,-8);
    if (x != 0 && x > -400 && x < 400) {
      printText((float) x/100, x, 20);
    }
  }
  
  // desenhando linhas e valores do eixo Y
  for (int y = -400; y < 200; y=y+10){
    line(0,y,3,y);
  }
  for (int y = -400; y < 200; y=y+50){
    line(0,y,8,y);
    if (y != 0 && y > -400 && y < 200) {
      printText((float) (-1)*y/100, -20, y+5);
    }
  }
}

void setup() {
  size(800,600);
  frameRate(60);
  
  //ponto inicial
  Px = 100;
  Py = 0;
  //ponto final
  Qx = -200;
  Qy = 0;
  
  alpha = 0;
  w = 0.01;
  velocity = PI/(4*frameRate); // PI/240
  v = new PVector(Px,Py);
  o = new PVector(0,0); //origem
  dist = v.dist(o);
}

void draw() {
  initialSetup();
   
  if (v.x >= Qx && v.y >= Qy) {
    //ponto x
    float x1 = v.x;
    float y1 = v.y;
    
    configLinha();
    v.rotate(alpha*w);
    v.setMag(dist);
    
    //ponto x + inclinacao
    float x2 = v.x;
    float y2 = v.y;
    
    //desenhando a curva
    curve(x1,y1,x1,y1,x2,y2,x2,y2);

    dist += alpha/PI;
    alpha += velocity;
  }
}
