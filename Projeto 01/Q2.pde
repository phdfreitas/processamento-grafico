float Ax = 0;
float Ay = 0;
float Bx = 0;
float By = -100;
float Cx = 0;
float Cy = -250;
float alpha = 0;

void initialSetup(){
  background(47,79,79);
  translate(400,400);
  scale(1, -1);
}

void confLine(){
  strokeWeight(10);
  stroke(128,128,128); 
}

void confPoint(){
  strokeWeight(20);
  stroke(230,230,250);
}

void setup(){
  size(800,800);
  frameRate(60);
}

void draw(){
  initialSetup();
  
  rotate(alpha);
  confLine();
  line(Ax, Ay, Bx, By);
  confPoint();
  point(Ax, Ay);
  
  translate(-Bx, By);
  rotate(2*alpha);
  translate(Bx, -By);
  confLine();
  line(Bx, By, Cx, Cy);
  confPoint();
  point(Bx, By);
  confPoint();
  point(Cx, Cy);
  if(alpha < PI/6){
    alpha += PI/720;
  }
}
