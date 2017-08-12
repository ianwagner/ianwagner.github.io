PImage a;
PImage b;
PImage c;
PImage d;

float ax, ay, bx, by, cx, cy, dx, dy;

void setup() {
  size(600, 300);
  
    a = loadImage("CIRCLE.png");
    b = loadImage("EYE.png");
    c = loadImage("halfCircle.png");
    d = loadImage("SQUARE.png");
    
    imageMode(CENTER);

ax = random(100,500);
ay = random(100,200);
bx = random(125,175);
by = random(100, 200);
cx = random(150, 450);
cy = random(100, 200);
dx = random(100,500);
dy = random(100,200);

}
void draw() { 
  background(255);
  

  pushMatrix();
  if(dist(mouseX, mouseY, ax, ay) <100) {
              if(mouseX > ax) { 
              translate(-30, 0); }
              if(mouseX < ax) { 
              translate(30, 0); }
              if(mouseY > ay) { 
              translate(0, -30); }
              if(mouseY < ay) { 
              translate(0, 30); }
  }
  image(a, ax, ay, 200, 200);
  popMatrix();
  
    pushMatrix();
      if(dist(mouseX, mouseY, bx, by) <100) {
             if(mouseX > bx) { 
              translate(-30, 0); }
              if(mouseX < bx) { 
              translate(30, 0); }
              if(mouseY > by) { 
              translate(0, -30); }
              if(mouseY < by) { 
              translate(0, 30); }
  }
    image(b, bx, by, 250, 150);
    popMatrix();
    
      pushMatrix();
        if(dist(mouseX, mouseY, cx, cy) <100) {
              if(mouseX > cx) { 
              translate(-30, 0); }
              if(mouseX < cx) { 
              translate(30, 0); }
              if(mouseY > cy) { 
              translate(0, -30); }
              if(mouseY < cy) { 
              translate(0, 30); }
  }
      image(c, cx, cy, 300, 150);
      popMatrix();
      
        pushMatrix();
          if(dist(mouseX, mouseY, dx, dy) <100) {
            if(mouseX > dx) { 
              translate(-30, 0); }
              if(mouseX < dx) { 
              translate(30, 0); }
              if(mouseY > dy) { 
              translate(0, -30); }
              if(mouseY < dy) { 
              translate(0, 30); }
  }
        image(d, dx, dy, 200, 200);
        popMatrix();
       

}