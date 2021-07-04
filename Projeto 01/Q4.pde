float inicio = 0;
//velocidade angular
float vel = PI/240; 
//cordenadas do ponto inicial
float Px = -20; 
float Py = 0;
//cordenadas do centro
float centroX = 0;
float centroY = 0;

int i = 1;

void setup() {
  size(400, 300);
  frameRate(40);
}

void draw() {
  cordenadas();
  //quando chegar em 180º começa um novo arco
  if (inicio >= PI){
    inicio = 0;
    // Antigo ponto inicial se torna o novo centro
    centroX = Px;
    
    Px += -20*pow(-2,i);
    i++;
  }
  //mudar o centro
  translate(centroX, -centroY);
  rotate(inicio);
  translate(-centroX, centroY);
  ponto();
  point(Px, Py);
  
  inicio += vel;
}
//cordenadas cartezianas 
void cordenadas(){
  translate(width/2, height/2);
  scale(1, -1);
  strokeWeight(1);
  stroke(0, 255, 0);
  line(0, height, 0, -height);
  stroke(59, 24, 142);
  line(width, 0, -width, 0);
}
//define a cor e tamanho do ponto
void ponto(){  
  strokeWeight(5);
  stroke(255,0,0);
}
