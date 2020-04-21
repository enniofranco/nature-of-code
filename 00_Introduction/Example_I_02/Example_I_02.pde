int[] randomCounts;

void setup() {
  size(640,640);
  //set the number of columns
  randomCounts = new int[20];
}

void draw() {
  background(255);
  
  //Selects which column will increment
  //Incremenets by 1
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  noStroke();
  //fill(175);
  //Sets an increment based on the width of each column
  int w = width/randomCounts.length;
  
  //Loop
  for(int i = 0; i < randomCounts.length; i++) {
    //set the colour based on the height of the column
    float shapeAlpha = map(randomCounts[i], 0, 600, 0, 255);
    fill(0, shapeAlpha);
    //draw rectangle
    rect(
      /*x*/ i * w,
      /*y*/ height - randomCounts[i],
      /*w*/ w,
      /*h*/ randomCounts[i]
    ); 
  }
}
