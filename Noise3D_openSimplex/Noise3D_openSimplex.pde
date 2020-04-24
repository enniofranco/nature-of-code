//ABOUT OPEN SIMPLEX
//I took my references from the video below
//https://www.youtube.com/watch?v=Lv9gyZZJPE0&list=PLRqwX-V7Uu6ZV4yEcW3uDwOgGXKUUsPOM&t=0s


float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 

OpenSimplexNoise noise;

void setup() {
  size(640, 360);
  frameRate(30);
  noise = new OpenSimplexNoise();
}

void draw() {

  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);

  loadPixels();

  float xoff = 0.0; // Start xoff at 0

  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff

      /*this is old*/
      // Calculate noise and scale by 255
      //float bright = noise(xoff,yoff,zoff)*255;
      /*this is old*/

      //THIS IS THE NEW CODE TO IMPLEMENT OPEN SIMPLEX!!!
      //The function noise.eval will return a double. Processing can't handle double.
      //Must convert double to float using the casting (float)
      //Noise functions are generally designed to give a number between -1 and 1. The mean being 0
      //Processing's noise function gives a value between 0 and 1 for convenience.
      float n = (float) noise.eval(xoff, yoff, zoff);
      float bright = map(n, -1, 1, 0, 255);
      //More details here: https://www.youtube.com/watch?v=Lv9gyZZJPE0&list=PLRqwX-V7Uu6ZV4yEcW3uDwOgGXKUUsPOM&t=0s

      // Try using this line instead
      //float bright = random(0,255);

      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright, bright, bright);
    }
  }
  updatePixels();

  zoff += zincrement; // Increment zoff
}
