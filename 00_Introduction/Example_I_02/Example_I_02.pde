int[] randomCounts;

void setup() {
  size(640,640);
  randomCounts = new int[20];
}

void draw() {
  background(255);
  
  //Selects which bar will increment
  //Incremenets by 1
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  noStroke();
  fill(175);
  //Sets an increment based on the width of each bar
  int w = width/randomCounts.length;
  
  //Loop
  for(int i = 0; i < randomCounts.length; i++) {
    rect(
      /*x*/ i * w,
      /*y*/ height - randomCounts[i],
      /*w*/ w - 1,
      /*h*/ randomCounts[i]
    ); 
  }
}
