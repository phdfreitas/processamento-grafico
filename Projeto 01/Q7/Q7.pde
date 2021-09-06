int movimento = 1;
float alpha = 0;
float y = 100;

float Ax = 400;
float Az = 0;

float Bx = -100;
float Bz = 500;

float Cx = 100;
float Cz = 500;
//velocidade angular
float w1 = PI/360;
float w2 = PI/120;
float w3 = w1;
//velocidade linear
float v1 = 0.4629;
float v2 = 0.2777;
float v3 = v1;


void setup(){
  size(1100, 1000, P3D);
  frameRate(60); 
}


void draw(){
  cordenadas();
  if (movimento == 1){
    mov1();
  } else if (movimento == 2){
    mov2();
  } else if (movimento == 3) {
    mov3();
  }
  
}

//cordenadas cartesianas
void cordenadas(){
  background(230);
  translate(500, 700, 0);
  rotateZ(-PI/2);
  rotateY(PI/2);
  scale(-1,1,1);
  rotateZ(-PI/6);
  //linhas das cordenadas
  strokeWeight(2);
  stroke(255, 0, 0);
  line(0, 0, 0, 500, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 500, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 500);

}

void esfera(float x, float y, float z){
  strokeWeight(40);
  stroke(0);
  point(x, y, z);
}

//cada movimento tem seu centro de rotação
//movimento de A para B
void mov1(){
  translate(400, y, 500);
  rotate(alpha);
  translate(-400, -y, -500);
  esfera(Ax, y, Az);
  if(alpha < PI/2){//rotação de 90º
      alpha += w1;
      y -= v1;
  }else {
    movimento = 2;
    alpha = w1;
  }
}
//movimento de B para D
void mov2(){
  translate(0, y, 500);
  rotate(alpha);
  translate(0, -y, -500);
   esfera(Bx, y, Bz);
  if(alpha < PI){//rotação de 180º
    alpha += w2;
    y -= v2;
  }else {
    movimento = 3;
    alpha = w2;
  }
}
//movimento de D para E
void mov3(){
  translate(-400, -y, 500);
  rotate(alpha);
  translate(400, y, -500);
   esfera(Cx, y, Cz);
  if(alpha < PI/2){
      alpha += w3;
      y -= v3;
  }else {
    movimento = 0;
    alpha = 0;
  }
}
