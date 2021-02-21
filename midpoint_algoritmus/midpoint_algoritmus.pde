int countClicks;
int prevMouseX, prevMouseY;

void setup() {
  size(640, 480);
}

void draw() {
}

void szakaszMidpoint(int x0, int y0, int x1, int y1) {
  int deltaX = x1 - x0; 
  int deltaY = y1 - y0;
  
  int d = 2 * deltaY - deltaX;
  int deltaE = 2 * deltaY;
  int deltaNE = 2 * (deltaY - deltaX);
  
  int y = y0;   //<>// //<>//
  for (int x = x0; x < x1; x++) {
    point(x,y);
    if (d <= 0) {   
      d += deltaE;      
    } else {      
      d += deltaNE;
      y += 1;      
    }    
  }
}

void mousePressed() {
  countClicks++;

  if (countClicks % 2 == 0) {
    szakaszMidpoint(prevMouseX, prevMouseY, mouseX, mouseY);    
    countClicks = 0;
  } else {
    background(204); // töröljük a képernyőt
  }

  prevMouseX = mouseX;
  prevMouseY = mouseY;
}
