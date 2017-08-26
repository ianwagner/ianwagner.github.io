float time = millis(); 
boolean flying = false; 
boolean atRest = true; 

float cageX;
float cageY;

float posX; 
float posY;

float velX; 
float velY; 

float targetX; 
float targetY; 

float easing = .04; 

int left = -20; 
int right = 20;

color c1, c2;

PImage paint;

void setup() {
  size(375, 617);
  
  paint = loadImage("paintBlob2.png");
  
  cageX = random(width);
  cageY = random(height);
  
  posX= cageX;
  posY= cageY;
  
}

void draw() {
  
  c1 = color(165, 240, 4);
  c2 = color(253, 220, 0);
 
  
  setGradient(0, 0, width, height, c1, c2, 1);

  pushMatrix();
  rotate(.5);
  for (int i = 0; i<width+400; i = i + (width/11)){
    stroke(0);
    strokeWeight(1);
    line(i, -400, i, height);
  }
  for (int i = -200; i<height-75; i = i + (width/11)){
    stroke(0);
    strokeWeight(1);
    line(0, i, width+266, i);
  }
  popMatrix();
  
     noStroke();
     fill(0, 150);
     ellipse(cageX, cageY, 400, 400);
     
     image(paint, -50, -50);
 
noStroke();
fill(255); 
triangle(posX + left, posY - 20, posX, posY,  posX + left, posY + 20); 
triangle(posX + right, posY - 20, posX, posY, posX + right, posY + 20);
  
  if (atRest == true) { 
    targetX = random(width);
    targetY = random(height);
    
    left = -25; 
    right = 25; 
  }
    
  if (flying == true){ 
    
    velX = targetX; 
    velY = targetY; 
    posX = posX + (velX - posX) * easing; 
    posY = posY + (velY - posY) * easing;
    
    if( left == -25) { 
      left = left + 15;
    } 
     else if( left == -10) { 
      left = left - 15;
    } 
     if( right == 25) { 
      right = right - 15;
    } 
     else if( right == 10) { 
      right = right + 15;
    } 
  
  if (posX > width || posY > height) { 
    velX = -velX; 
    velY = -velY; 
  } 
  if (posX < 0 || posY < 0) { 
    velX = -velX; 
    velY = -velY; 
  }
  }

if (dist(posX, posY, mouseX, mouseY) < 50) { 
  flying = true; 
  atRest = false; 
} else if (dist(targetX, targetY, posX, posY) < 10) { 
  flying = false; 
  atRest = true; 
} 

}

void mouseDragged(){
  
  if(dist(mouseX, mouseY, cageX, cageY) <200){
  cageX = mouseX;
  cageY = mouseY;
  }
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 1) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
}