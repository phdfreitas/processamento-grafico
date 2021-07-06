float alphaC = 0;
float alphaP = 0;
float Xcirculo = 7.5; //posicao inicial circulo menor
float Ycirculo = 0;
float Xponto = 2.5;
float Yponto = 0;
float w =PI/120; //4 segundos
float wP = -1*PI/24;


void setup() {
  size(1000,1000,P3D);
}

void setupCoodinates() {
  background(153);
  translate(width/4,(2*height)/3);
  scale(10,-10);
  rotateX(radians(-60));
  rotateZ(radians(-60));

  strokeWeight(0.8);
  stroke(255,0,0);
  line(0,0,0,width,0,0);  //eixo X vermelho
  stroke(0,255,0);
  line(0,0,0,0,width,0);  //eixo Y verde
  stroke(0,0,255);
  line(0,0,0,0,0,width);  //eixo Z azul
  strokeWeight(0);
  noFill();
}

void drawMinorCircle(float x, float y) { //teste
  translate(x,y,2.5);
  rotateX(radians(90));
  rotateY(radians(90));
  circle(Xcirculo,Ycirculo,5); //iniciando círculo menor
}

void draw() {
  setupCoodinates();
  strokeWeight(1);
  stroke(1);
  rotateX(radians(30));
  square(0,0,20);
  translate(10,10,0);
  point(0,0,1);
  
  pushMatrix();
  circle(0,0,20); //círculo maior
  rotate(alphaC);
  
  drawMinorCircle(Xcirculo,Ycirculo);
  //circle(Xcirculo,Ycirculo,5); //iniciando círculo menor
  translate(7.5,0);
  rotate(alphaP);
  strokeWeight(3);//tamanho do contorno
  stroke(255,0,0);//cor vermelha
  point(Xponto,Yponto); //inicia o ponto de referencia
  
  popMatrix();
  rotate(alphaC);
  alphaC += w;
  alphaP += wP;
   
}
