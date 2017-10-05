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
size(414, 578);
  
  mouseX=int(random(width));
  mouseY=int(random(height));
  
  posX = random(width);
  posY = random(height);
  
  red = 0;
  green = 100;
  blue = 200;
  
}

void draw() {
  
  if (red == 0){ 
    rUp = true;
  } else if ( red == 200) { rUp = false;
  }
  
  if (rUp == true){
    red = red + .5;
  } else { red = red - .5;}
  
  if (green == 0){ 
    gUp = true;
  } else if ( green == 200) { gUp = false;
  }
  
  if (gUp == true){
    green = green + .5;
  } else { green = green - .5;}
  
    if (blue == 0){ 
    bUp = true;
  } else if ( blue == 200) { bUp = false;
  }
  
  if (bUp == true){
    blue = blue + .5;
  } else { blue = blue - .5;}
    
c1 = color(242, 242, 242);
c2 = color(red, green, blue);
 
setGradient(0, 0, width, height, c1, c2, 1);
 
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