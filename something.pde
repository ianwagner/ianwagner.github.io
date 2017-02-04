
int num = 1000; // number
void setup() { 
  size(1000, 500);
  frameRate(30);
}
  
void draw() { 
  background(0); 
  
  loadPixels();  
// Loop through every pixel
for (int x = 0; x < width; x = x + 2) {
  for (int y = 0; y < height; y = y + 2) {
  int loc = x + y*width; 
  // Pick a random number, 0 to 255
  // Create a grayscale color based on random number
  color c = color(random(0, 250));
  // Set pixel at that location to random color
  pixels[loc] = c;
  }
}
updatePixels(); 
}
  