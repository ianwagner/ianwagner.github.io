float time = millis(); 
boolean flying = false; 
boolean atRest = true; 

float cageX;
float cageY;

float paintX = width/2-40;
float paintY = height/2+30;

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

int dice =int(random(1,3));

void setup() {
  size(375, 509);
  
  if (dice ==2){ 
      background(0);
  }
  
  paint = loadImage("paintBlob2.png");
  
  cageX = random(width);
  cageY = random(height);
  
  posX= cageX;
  posY= cageY;
  
}

void draw() {
  
  if (dice == 1){
  c1 = color(0);
  c2 = color(147, 203, 255);
 
  
  setGradient(0, 0, width, height, c1, c2, 1);

  for (int i = 20; i<width; i = i + (width/11)){
    stroke(0);
    strokeWeight(1);
    line(i, 0, i, height);
  }
  for (int i = 15; i<height; i = i + (width/11)){
    stroke(0);
    strokeWeight(1);
    line(0, i, width, i);
  }
 
noStroke();
fill(255); 
triangle(posX + left, posY - 20, posX, posY,  posX + left, posY + 20); 
triangle(posX + right, posY - 20, posX, posY, posX + right, posY + 20);
  
    targetX = mouseX;
    targetY = mouseY;
    
  
  if (atRest == true) { 
    
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

if (dist(posX, posY, mouseX, mouseY) > 50) { 
  flying = true; 
  atRest = false; 
} else if (dist(targetX, targetY, posX, posY) < 10) { 
  flying = false; 
  atRest = true; 
} 

}


if (dice == 2) {

     //ellipse(cageX, cageY, 400, 400);
     
     image(paint, paintX, paintY);
}

if (dice == 3) {

     ellipse(cageX, cageY, 400, 400);
     
}

}

void mouseDragged(){
  
  if(dist(mouseX, mouseY, cageX, cageY) <200){
  cageX = mouseX;
  cageY = mouseY;
  }
  
    if(dist(mouseX, mouseY, paintX, paintY) <400){
  paintX = mouseX-200;
  paintY = mouseY-200;
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