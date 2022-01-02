PGraphics pg;
PFont font;
boolean recording = false;

void setup() {
  font = createFont("NeueHaasGrotDisp-95Black.otf",500);
  size(1920,700, P2D);
  pg = createGraphics(1920, 700, P2D);
  
}

void keyPressed() {
  if(key == 'r' || key == 'R') {
    recording = !recording;
  }
}

void draw() {
  background(250);
  pg.beginDraw();
  pg.fill(0,14,202);
  pg.textFont(font);
  pg.textSize(700);
  pg.pushMatrix();
  pg.translate(width/2, height/2-100);
  pg.textAlign(CENTER, CENTER);
  pg.text("wave", 0, 0);
  pg.popMatrix();
  pg.endDraw();
  
  int tilesX =76;
  int tilesY =56;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      // WARP
      int wave = int(tan(frameCount *0.08+ (x * y) * 0.0008) *50);  
      // WARP
      int wave1 = int(sin(frameCount * 0.2) +(x*y)); 

      // SOURCE
      int sx = x*tileW+wave;
      int sy = y*tileH;
      int sw = tileW;
      int sh = tileH;

      // DESTINATION
      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
    }
  }
  
  if(recording) {
    saveFrame("exBLU/kinetic_typo_####.png");
  }
} 
