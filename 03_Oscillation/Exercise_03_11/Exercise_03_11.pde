//This was the insight for me
//https://youtu.be/y7sgcFhk6ZM?t=716

Wave amanda;

void setup() {
  size(600, 600);
  amanda = new Wave(50, height/2, 450);
}

void draw() {
  background(200);
  amanda.update();
  amanda.render();
}
