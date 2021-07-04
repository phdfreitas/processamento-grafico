// altura e largura do cenário (infelizmento o "size" não aceita variável)
int h = 400;
int w = 800;

// onde a bolinha vai começar (lado esquerdo inferior) -  baseado na altura e 
// largura do cenário.
float x = w - (w - 15);
float y = h - 15;

// Velocidade vertical, horizontal, aceleração da gravidade e o raio da bolinha
float velocidadeY = 10;
float gravidade = 0.5;
float raio = 30;
float velocidadeX = 2*PI;

void setup(){
  size(800,400);
  frameRate(60);
}

void draw(){
  background(0);
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
  
  noStroke();
  fill(255,255,0);
  ellipse(x, y, raio, raio);
}
