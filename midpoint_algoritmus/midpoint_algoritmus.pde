int countClicks;
int prevMouseX, prevMouseY;

void setup() {
  size(640, 480);
}

void draw() {
}

void szakaszMidpoint(float xA, float yA, float xB, float yB) {
  float m;
  float x, y;
  
  circle(xA, yA, 2);
  circle(xB, yB, 2);
}

void mousePressed() {
  countClicks++;

  if (countClicks % 2 == 0) {
    szakaszMidpoint(mouseX, mouseY, prevMouseX, prevMouseY);
    countClicks = 0;
  } else {
    background(204); // töröljük a képernyőt
  }

  prevMouseX = mouseX;
  prevMouseY = mouseY;
}
