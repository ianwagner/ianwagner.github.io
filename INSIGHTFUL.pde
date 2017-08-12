PImage a;
PImage b;
PImage c;
PImage d;

float ax, ay, bx, by, cx, cy, dx, dy;

void setup() {
  size(300, 200);
  
    a = loadImage("CIRCLE.png");
    b = loadImage("EYE.png");
    c = loadImage("halfCircle.png");
    d = loadImage("SQUARE.png");
    
    imageMode(CENTER);

ax = random(75,225);
ay = random(75,125);
bx = random(100,200);
by = random(60, 140);
cx = random(100, 200);
cy = random(50, 150);
dx = random(75,225);
dy = random(75,125);

}
void draw() { 
  background(255);
  
          pushMatrix();
          if(dist(mouseX, mouseY, dx, dy) <50) {
            if(mouseX > dx) { 
              translate(-20, 0); }
              if(mouseX < dx) { 
              translate(20, 0); }
              if(mouseY > dy) { 
              translate(0, -20); }
              if(mouseY < dy) { 
              translate(0, 20); }
  }
        image(d, dx, dy, 150, 150);
        popMatrix();
    
  

  pushMatrix();
  if(dist(mouseX, mouseY, ax, ay) <50) {
              if(mouseX > ax) { 
              translate(-20, 0); }
              if(mouseX < ax) { 
              translate(20, 0); }
              if(mouseY > ay) { 
              translate(0, -20); }
              if(mouseY < ay) { 
              translate(0, 20); }
  }
  image(a, ax, ay, 150, 150);
  popMatrix();
  
    pushMatrix();
      if(dist(mouseX, mouseY, bx, by) <50) {
             if(mouseX > bx) { 
              translate(-20, 0); }
              if(mouseX < bx) { 
              translate(20, 0); }
              if(mouseY > by) { 
              translate(0, -20); }
              if(mouseY < by) { 
              translate(0, 20); }
  }
    image(b, bx, by, 200, 120);
    popMatrix();
    
      pushMatrix();
        if(dist(mouseX, mouseY, cx, cy) <50) {
              if(mouseX > cx) { 
              translate(-20, 0); }
              if(mouseX < cx) { 
              translate(20, 0); }
              if(mouseY > cy) { 
              translate(0, -20); }
              if(mouseY < cy) { 
              translate(0, 20); }
  }
      image(c, cx, cy, 200, 100);
      popMatrix();
    

}