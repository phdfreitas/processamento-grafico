// Variáveis do tipo "imagem"
PImage mapaNormais;       // mapa de vetores
PImage imagemDifusa;      // mapa de cores -> Como se fosse os "Kd's"
PImage imagemEspecular;   // -> Como se fosse os "Ks"
PImage imagemFinal;

// Constantes para as cores
int branco   = 255;
int cinza    = 167;
int preto    = 0;

int controleDifuso[]      = {branco, preto, branco};
int controleEspecular[]   = {branco, preto, branco};
int controleVermelho      = preto;
int controleVerde         = preto;
int controleAzul          = preto;

float r = 255;
float g = 255;
float b = 255;

int fonteBotaoComponente  = 30;
int fonteBotaoCores       = 25;

PVector direcaoVista = new PVector(0, 1, 1);
PVector direcaoLuz;
color corDaLuz;
float brilho;
float coordX, coordY;

// inicio da renderização
void setup(){
  background(preto);
  size(800, 800);
  
  // Carregando as iamgens
  imagemDifusa = loadImage("../Texturas/char2_d.png");
  imagemEspecular = loadImage("../Texturas/char2_s.png");
  mapaNormais = loadImage("../Texturas/char2_n.png");
  
  // Setando configurações iniciais
  brilho = 0.2;
  corDaLuz = color(255,255,255,255);
  direcaoLuz = new PVector(-1, 0, 1).normalize(); // Não precisaria aqui pois é calculada no draw()
  coordX = width/2.0 - imagemDifusa.width/2.0;
  coordY = height/2.0 - imagemDifusa.height/2.0;
}

// Atualização
void draw(){
  botoes(); // Chama os botões (que variam de acordo com o estado)
  corDaLuz = color(r, g, b); // Permite a variação das cores R, G, B nos botões
  
  // Direção da luz que muda de acordo com a posição do mouse
  direcaoLuz = new PVector(mouseX - width/10, mouseY - height/10, 0.1).normalize();
  
  // De acordo com a posição da luz e dos valores do rgb, cria a imagem final
  imagemFinal = createImage(imagemDifusa.width, imagemDifusa.height, ARGB);
  renderizaImagem(); // renderiza a iamgem -> substituindo os pixels na função
  image(imagemFinal, coordX, coordY);
}
