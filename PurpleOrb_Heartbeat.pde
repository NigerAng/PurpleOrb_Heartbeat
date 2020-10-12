int alphaVal, alphaDelta;

void setup()
{ 
  alphaVal = 255; // initial value
  alphaDelta = 3; // rate of change
  
  //Sphere
  size(800, 600, P3D);
  smooth();

  //HeartRate
  //http://www.openprocessing.org/sketch/102506, Peter Hofmann.
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
  
  //text
  //https://processing.org/discourse/beta/num_1153511698.html
  translate(0,0,50);
  fill(255, 255, 255, alphaVal);


  if ((alphaVal == 0) || (alphaVal == 255))
    alphaDelta = -alphaDelta;

  alphaVal+= alphaDelta;
  
}
