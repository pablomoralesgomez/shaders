

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;

// Multiplicamos la posicion por la matriz de rotacion (en funcion del tiempo)
vec2 rotate(vec2 pos, float theta) {
  theta *= 3.1415;
  return mat2(cos(theta),sin(theta),-sin(theta),cos(theta)) * pos;
}

vec3 cubo(vec2 pos, float size) {
  vec2 rotd = rotate(pos, 1.0 * sin(time));  
  
  float d = max(abs(rotd.x), abs(rotd.y)) - size;  
  
  return d > 0.0 ? vec3(1.0) : vec3(sin(mouse.x), tan(mouse.x/mouse.y), cos(mouse.y));
}

void main() {
  
  // Ajustamos el cuadrado al centro de la imagen
  vec2 position = ( gl_FragCoord.xy / resolution.xy ) - 0.5;
  position.x *= resolution.x / resolution.y;
  
  float size = .2;
  
  vec3 color = cubo(position, size);
  
  gl_FragColor = vec4(color, 1.0);
}
