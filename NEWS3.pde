PImage tv;

float red, green, blue;

float cageX;
float cageY;

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
  
tv = loadImage("tv.png");

  size(300, 300);
  
  background(0,0,0);
  
  cageX = 100;
  cageY = 100;

  posX = random(cageX);
  posY = random(cageY);
  
  targetX = random(cageX);
  targetY = random(cageY);
  
  red = 0;
  green = 120;
  blue = 220;
  
}

void draw() {
  
  if (red == 0){ 
    rUp = true;
  } else if ( red == 220) { rUp = false;
  }
  
  if (rUp == true){
    red = red + 1;
  } else { red = red - 1;}
  
  if (green == 0){ 
    gUp = true;
  } else if ( green == 220) { gUp = false;
  }
  
  if (gUp == true){
    green = green + 1;
  } else { green = green - 1;}
  
    if (blue == 0){ 
    bUp = true;
  } else if ( blue == 220) { bUp = false;
  }
  
  if (bUp == true){
    blue = blue + 1;
  } else { blue = blue - 1;}
    
c1 = color(red, green ,blue);
c2 = color(blue, red ,green);
 
setGradient(0, 0, width, height, c1, c2, 1);
 
 fill(#efefef, 180);
 noStroke();
 rect(0, 0, width, height);
  
image(tv, 0, 0, 300, 300);
  
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
  
  if (posX > cageX || posY > cageY) { 
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
  targetX = random(cageX);
  targetY = random(cageY);
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
