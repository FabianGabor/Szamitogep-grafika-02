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

void meredeksegAlacsony(int x0, int y0, int x1, int y1) {
  int dx = x1 - x0;
  int dy = y1 - y0;
  int yi = 1;
  if (dy < 0) {
    yi = -1;
    dy = -dy;
  }
  int D = 2 * dy - dx;
  int y = y0;
  
  for (int x = x0; x < x1; x++) {
    point(x,y);
    if (D > 0) {
      y += yi;
      D += (2 * (dy - dx)); // d + deltaNE      
    } else {
      D += 2*dy; // d + deltaE
    }
  } 
}

void meredeksegMagas(int x0, int y0, int x1, int y1) {
  int dx = x1 - x0;
  int dy = y1 - y0;
  int xi = 1;
  if (dx < 0) {
    xi = -1;
    dx = -dx;
  }
  int D = 2 * dx - dy;
  int x = x0;
  
  for (int y = y0; y < y1; y++) {
    point(x,y);
    if (D > 0) {
      x += xi;
      D += (2 * (dx - dy)); // d + deltaNE 
    } else {
      D += 2 * dx;
    }    
  }
}

void plotLine(int x0, int y0, int x1, int y1) {
  if (abs(y1 - y0) < abs(x1 - x0)) {
    if (x0 > x1) {
      meredeksegAlacsony(x1, y1, x0, y0);
    } else {
      meredeksegAlacsony(x0, y0, x1, y1);
    }
  } else {
    if (y0 > y1) {
      meredeksegMagas(x1, y1, x0, y0);
    } else {
      meredeksegMagas(x0, y0, x1, y1);
    }
  }
}

void mousePressed() {
  countClicks++;

  if (countClicks % 2 == 0) {
    plotLine(prevMouseX, prevMouseY, mouseX, mouseY);    
    countClicks = 0;
  } else {
    background(204); // töröljük a képernyőt
  }

  prevMouseX = mouseX;
  prevMouseY = mouseY;
}
