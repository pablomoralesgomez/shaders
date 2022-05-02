
PShader sh;

void setup() {
  size(600, 600, P2D);
  sh = loadShader("shader1.glsl");
}

void draw() {
  
  sh.set("resolution", float(width), float(height));
  sh.set("mouse", float(mouseX), float(mouseY));
  sh.set("time", millis() / 1000.0);
  shader(sh);
  rect(0,0,width,height);
 

}
