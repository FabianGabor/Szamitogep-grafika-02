int countClicks;
int prevMouseX, prevMouseY;

void setup() {
  size(640, 480);
}

void draw() {
}

void szakaszInkrementacios(float xA, float yA, float xB, float yB) {
  float m;
  float x, y;
  
  circle(xA, yA, 2);
  circle(xB, yB, 2);
  
  if (xB != xA) { // nem függőleges
    m = (yB - yA) / (xB - xA); //<>//
    
    if (abs(m) <= 1) {
      y = (xA < xB) ? yA : yB;
      for (x = (xA < xB) ? xA : xB; x < ((xA > xB) ? xA : xB); x++) {
        point(x,y);
        y += m;        
      }
    } else {
      x = (yA < yB) ? xA : xB;
      for (y = (yA < yB) ? yA : yB; y < ((yA > yB) ? yA : yB); y++) {
        point(x,y);
        x += 1/m;
      }
    }
  } else {    // függőleges
    for (y = (yA < yB) ? yA : yB; y < ((yA > yB) ? yA : yB); y++) {
      point(xA,y);
    }
  }
}

void mousePressed() {
  countClicks++;

  if (countClicks % 2 == 0) {
    szakaszInkrementacios(mouseX, mouseY, prevMouseX, prevMouseY);
    countClicks = 0;
  } else {
    background(204); // töröljük a képernyőt
  }

  prevMouseX = mouseX;
  prevMouseY = mouseY;
}
