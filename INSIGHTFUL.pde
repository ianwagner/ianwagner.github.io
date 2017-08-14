shape s = new shape();

PImage a;
PImage b;
PImage c;
PImage d;

float ax, ay, bx, by, cx, cy, dx, dy;

void setup() {
  size(100, 100);
  
    a = loadImage("CIRCLE.png");
    b = loadImage("EYE.png");
    c = loadImage("halfCircle.png");
    d = loadImage("SQUARE.png");
    
    imageMode(CENTER);

ax = random(0,height);
ay = random(0,height);
bx = random(0,height);
by = random(0,height);
cx = random(0,height);
cy = random(0,height);
dx = random(0,height);
dy = random(0,height);

}
void draw() { 
  background(0);
  
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

class shape { 
  
}