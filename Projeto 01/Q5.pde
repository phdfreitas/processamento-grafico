float Xcirculo = 75;
float Ycirculo = 0;
float Xponto = 25;
float Yponto = 0;
float alphaC=0;
float w =-1*PI/120; //EQUIVALENTE A 4 SEGUNDOS DO CIRCULO
float alphaP=0;
float wP = PI/24;

void config1(){
strokeWeight(4);//tamanho do contorno
stroke(255,0,0);//cor vermelha
}

void config2(){
strokeWeight(1);
stroke(0,127,255);//cor dos objetos
}
void initialsetup(){
background(205,205,205);//cor do background
translate(400,400); //colocando o centro da tela para 400/400
noFill();//deixar transparente a parte interna dos objetos
}

void setup(){
size(800,800);//tamanho da tela
frameRate(60);
}

void draw(){
initialsetup();//iniciando a rotina criada
pushMatrix();//salva as coordenadas anteriores do centro
config2();
circle(0, 0, 200);//iniciar o circulo grande
rotate(alphaC);//rotaciona o circulo pequeno e o ponto
circle(Xcirculo,Ycirculo,50);// iniciar o circulo pequeno
translate(75,0);//colocando o centro da tela para 75/0
rotate(alphaP);//rotaciona em relacao a velocidade do ponto
config1();
point(Xponto,Yponto);//inicia o ponto de referencia
popMatrix();
rotate(alphaC);
alphaC += w;
alphaP +=wP;

}
