// Refletir para calcular as componentes
PVector refletir(PVector incidente, PVector normal){
  PVector normalNormalizado = normal.normalize();
  return incidente.sub(normalNormalizado.mult(2*incidente.dot(normalNormalizado)));
}

// Capturar um pixel de uma matriz
color capturaPixel(PImage imagem, int pixelX, int pixelY){
  return imagem.pixels[pixelY*imagem.width + pixelX];
}

// Calcular componente difusa
// recebe a cor disufa e o pixel do mapa normal
color calculaComponenteDifusa(color difusa, color normal){
  color componenteDifusa;
  // Vetor normalizado do mapa normal. Pega os componentes rgb (xyz) do vetor e os normaliza
  PVector normalNormalizado = new PVector(red(normal), green(normal), blue(normal)).normalize();
  // Produto escalar do normal com a direção da luz 
  float proporcaoDifusa = max(0, normalNormalizado.dot(direcaoLuz));
  // componenteDifusa recebe com rgb da cor difusa (Im*Kd*NL)
  componenteDifusa = color(red(difusa) * proporcaoDifusa, green(difusa) * proporcaoDifusa, blue(difusa) * proporcaoDifusa, alpha(difusa));
  componenteDifusa = iluminaCor(componenteDifusa);
  return componenteDifusa;
}

// Calcular componente especular
// Difere da componente difusa pois aqui é necessário fazer alguns cálculos "a mais" para capturar o vetor refletido
color calculaComponenteEspecular(color especular, color normal){
  color componenteEspecular;
  PVector normalNormalizado = new PVector(red(normal), green(normal), blue(normal)).normalize();
  PVector incidente = PVector.mult(direcaoLuz, -1);
  PVector refletido = refletir(incidente, normalNormalizado);
  float proporcaoEspecular = pow(max(0, direcaoVista.dot(refletido)), brilho);
  componenteEspecular = color(red(especular) * proporcaoEspecular, green(especular) * proporcaoEspecular, blue(especular) * proporcaoEspecular, alpha(especular));
  componenteEspecular = iluminaCor(componenteEspecular);
  return componenteEspecular;
}

// Juntar componentes -> Juntas as componentes difusa e especular
color juntaComponentes(color corDifusa, color corEspecular){
  color corFinal;
  float r = (red(corDifusa) + red(corEspecular));
  float g = (green(corDifusa) + green(corEspecular));
  float b = (blue(corDifusa) + blue(corEspecular));
  corFinal = color(r, g, b, alpha(corDifusa));
  return corFinal;
}

// Adiciona a cor da luz
color iluminaCor(color cor){
  color novaCor;
  // Funciona como uma mistura da cor com a componente da textura
  float novoVermelho = red(cor)*red(corDaLuz)/255.0;
  float novoVerde = green(cor)*green(corDaLuz)/255.0;
  float novoAzul = blue(cor)*blue(corDaLuz)/255.0;
 
  novaCor = color(novoVermelho, novoVerde, novoAzul, alpha(cor));
  return novaCor;
}

// Renderização das imagens
void renderizaImagem(){
  for(int i = 0; i < imagemDifusa.height; i++){ // Laço da altura (Linhas da altura da imagem)
    for(int j = 0; j < imagemDifusa.width; j++){ // Laço da largura (Em cada linha da altura)
      
      // cores normal, difusa, especular
      color normal = capturaPixel(mapaNormais, j, i);
      color difusa = capturaPixel(imagemDifusa, j, i);
      color especular = capturaPixel(imagemEspecular, j, i);
     
      // Cores difusa e especular
      color calcCompDifusa = calculaComponenteDifusa(difusa, normal);
      color calcCompEspecular = calculaComponenteEspecular(especular, normal);
      
      // Aqui controla a imagem final
      if((controleDifuso[0] == branco) && (controleEspecular[0] == branco)){
        imagemFinal.pixels[i*imagemDifusa.width + j] = juntaComponentes(calcCompDifusa, calcCompEspecular);
      }
      else if((controleDifuso[0] == branco) && (controleEspecular[0] == preto)){
        imagemFinal.pixels[i*imagemDifusa.width + j] = calcCompDifusa;
      }
      else if((controleDifuso[0] == preto) && (controleEspecular[0] == branco)){
        imagemFinal.pixels[i*imagemDifusa.width + j] = calcCompEspecular;
      }
      else{
        imagemFinal.pixels[i*imagemDifusa.width + j] = normal;
      }
    }
  }
}
