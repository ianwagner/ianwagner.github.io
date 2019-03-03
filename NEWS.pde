float red, green, blue;

float time = millis(); 
boolean flying = false; 
boolean atRest = true; 

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

boolean rUp, gUp, bUp; 

void setup() {
  size(400, 400);
  
  mouseX=int(random(width));
  mouseY=int(random(height));
  
  posX = random(width);
  posY = random(height);
  
}

void draw() {
 
  background(#efefef);
 
noStroke();
fill(0); 
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
