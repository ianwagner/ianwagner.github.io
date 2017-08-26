float rotate1, rotate2;
float pos1, pos2, pos3;

float r1, r2;

boolean list = true;

void setup(){
  size(50, 50);
 rotate1 = 0; 
 rotate2 = 0;
 pos1 = 9; 
 pos2 = -9;
 pos3 = 0;

 
}

void draw(){
  background(254);
  noStroke();
 
  rectMode(CENTER);
  fill(0);
  translate(width/2, height/2);
  
  pushMatrix();
  rotate(rotate1);
  rect(0, pos1, 30, 5);
  popMatrix();
  
  pushMatrix();
  rect(pos3, 0, 30, 5);
  popMatrix();
  
  pushMatrix();
  rotate(rotate2);
  rect(0, pos2, 30, 5);
  popMatrix();
  
  if (list == false) {
    
    r1 = r1 + .05;
    if (r1 > 0.8) {
      r1 = 0.8;
    }
    
    r2 = r2 - .05;
    if (r2 < -0.8) {
      r2 = -0.8;
    }
    
    
  rotate1 = r1;
  rotate2 = r2;
  
  } else { 
    rotate1 = 0;
    rotate2 = 0;
    r1 = 0;
    r2 = 0;
  }
}

void mouseClicked() {
  
  if (list == true) { 
    list = false;
  } else { 
    list = true;
  }
  
  if ( list == false) {
  pos1 = 0;
  pos2 = 0;
  pos3 = 41;
  

  //rotate2 = PI/r2;
  }
  
  if ( list == true) { 
  pos1 = 9; 
  pos2 = -9;
  pos3 = 0;
 
  rotate1 = 0; 
  rotate2 = 0;
  }

}