float x = 0.1;  // better to use duble
float y = 0;
float z = 0;

float a = 10;
float b = 30;
float c = 8/3;

boolean stopped;

ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
}

void mousePressed() {
  if (stopped) {
    loop();
  }
  else {
    noLoop();
  }
  stopped = !stopped;
}


void draw() {
  background(0);
  float dt = 0.005; 
  float dx = a*(y - x)*dt; 
  float dy = (x*(b-z) - y)*dt;
  float dz = (x*y - c*z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

  // println(x, y, z);

  points.add(new PVector(x, y, z));


  translate(width/2, height/2);
  scale(5);
  stroke(255);
  noFill();
  
  float hu = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    strokeWeight(0.5);
    vertex(v.x, v.y, v.z);
    hu += 0.1;
    if (hu > 255) {
    hu = 0;
    }
  }
  endShape();
}
