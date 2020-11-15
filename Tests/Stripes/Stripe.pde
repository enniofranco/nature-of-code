class Stripe {
  color colour1, colour2;
  int gradientLevel;

  float x, y;
  float stripeWid, stripeHei;

  Stripe(float _x, float _y, float _w, float _h, color _c1, color _c2) {
    noStroke();
    colour1 = _c1;
    colour2 = _c2;
    stripeWid = _w;
    stripeHei = _h - 1;
    x = _x - (stripeWid/2);
    y = _y;

    gradientLevel = 60;
    for (int i = 0; i < gradientLevel; i++) {
      float inter = map(i, 0, gradientLevel, 0, 1);
      color c = lerpColor(colour1, colour2, inter);
      fill(c);
      float eachSection = stripeWid / gradientLevel;
      if (i == 0) {
        rect(x, y+0.5, stripeWid, stripeHei);
      }
      noStroke();
      rect(x, y+0.5, eachSection, stripeHei);
      x += eachSection;
    }

  }
}
