float a = 0; 
float i = 0;
float dx;
float dy;
Box b;




ArrayList<Box> sponge;
void setup() {
  size (400, 400, P3D);
  sponge = new ArrayList<Box>();
  
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}


void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
  
  i = i + 1;
  if (i > 3) {
    i = 0;
    sponge = new ArrayList<Box>();
  
    Box b = new Box(0, 0, 0, 200);
    sponge.add(b);
  }

}

void draw() {
  background(51);
  stroke(255);
  noFill();
  
  dx = - mouseX + width/2;
  dy = - mouseY + height/2;
  
  directionalLight(255, 255, 255, dx, dy, 1);

  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.4);
  rotateZ(a*0.2);
  a += 0.01;
  
  for (Box b : sponge) {
    b.show();
  }
}  
