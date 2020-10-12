void setup()
{ 
  //Sphere
  size(800, 600, P3D);
  smooth();
  stroke(255);
  strokeWeight(1);
  smooth();
  frameRate(50);
}

float v = 0;
float w = 0;

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);

  noFill();
  
  //HeartRate
  //http://www.openprocessing.org/sketch/102506, Peter Hofmann.
  beginShape();
  for (float x = 0; x < width; x += 1) {
    vertex(x, height/2+1
      *sin(v+(x/map(50, 0, width, 1, 100)))
      *tan(w+(x/map(150, 0, width, 100, 400)))
      *sin(v+(x/map(10, 0, height, 1, 100)))
      );
  }
  endShape();
  v -= 0.01;
  w += 0.02;

  lights();
  
  pushMatrix();
  translate(width/2, height/2);
  rotateY(radians(frameCount*1));
  sphereDetail(30);
  fill(50, 20, 80);
  sphere(150);
  popMatrix();
  
}
