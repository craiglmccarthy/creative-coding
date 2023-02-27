PImage img;

void setup() {
  size(900, 900, P3D);
  img = loadImage("image.jpeg");
  img.resize(900, 900);
}

void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(3);
  float tiles = 175;
  float tileSize = width/tiles;
  push();
  translate(width/2,height/2);
  rotateY(radians(frameCount*0.3));
  
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float b = map(brightness(c),0,225 + random(25),1,0);
      float z = map(b,0 + random(3),1 + random(25),-200 + random(25) + random(25), 200 + random(25));
      
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      sphere(tileSize*b*0.6);
      pop();
      
    }
  }
  pop();
  // saveFrame("output_####.png");
}
