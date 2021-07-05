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
  line(0,0,0,width,0,0);  //eixo X
  stroke(0,255,0);
  line(0,0,0,0,width,0);  //eixo Y
  stroke(0,0,255);
  line(0,0,0,0,0,width);  //eixo Z
  strokeWeight(0);
  fill(255,0,0);
  
}

void draw() {
  setupCoodinates();
  strokeWeight(1);
  
}
