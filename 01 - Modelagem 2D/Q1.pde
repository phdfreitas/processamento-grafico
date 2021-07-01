// altura e largura do cenário
int h = 400;
int w = 800;

// onde a bolinha vai começar (lado esquerdo inferior)
float x = 15;
float y = 385;

// Velocidade vertical, horizontal, aceleração da gravidade e o raio da bolinha
float velocidadeY = 10;
float velocidadeX = 5;
float gravidade = 0.5;
float raio = 30;


void setup(){
  size(800,400);
  frameRate(60);
}

void draw(){
  background(112,128,144);
  y += velocidadeY;
  x += velocidadeX;
  velocidadeY += gravidade;
  
  if(x > w || x < 0){
    velocidadeX *= -1;
  }
  
  if(y > h){
    velocidadeY *= -0.95;
    y = h;
  }
  
  stroke(0);
  strokeWeight(2);
  fill(255,255,0);
  ellipse(x, y, raio, raio);
  
}
