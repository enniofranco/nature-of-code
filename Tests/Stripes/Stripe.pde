class Stripe {
  color colourA1, colourA2;
  color colourB1, colourB2;
  color colour1, colour2;
  int gradientLevel;

  float x, y;
  float stripeWid, stripeHei;
  float stripeWidMax;
  float angle;

  Stripe(float _x, float _y, float _wMax, float _h, float _a) {
    noStroke();
    angle = _a;

    stripeWidMax = _wMax;
    float nWid = cos(angle);
    stripeWid = map(nWid, -1, 1, 0, stripeWidMax);
    stripeHei = _h - 1;
    //stripeHei = _h;

    x = _x - (stripeWid/2);
    y = _y;


    colourA1 = color(0, 184, 31); 
    colourA2 = color(255, 239, 10);
    colourB1 = color(255, 239, 10); 
    colourB2 = color(255, 10, 79);

    gradientLevel = 60;
    float testAngle = angle % TWO_PI;

    if (testAngle >= 0 && testAngle < PI) {
      float interAngle = map(angle, 0, PI, 0, 1);
      colour1 = lerpColor(colourA1, colourA2, interAngle);
      colour2 = lerpColor(colourA2, colourA1, interAngle);
    } else if (testAngle >= PI && testAngle <= TWO_PI) {
      float interAngle = map(angle, PI, TWO_PI, 0, 1);
      colour1 = lerpColor(colourB1, colourB2, interAngle);
      colour2 = lerpColor(colourB2, colourB1, interAngle);
    }

    for (int i = 0; i < gradientLevel; i++) {
      float inter = map(i, 0, gradientLevel, 0, 1);
      color c = lerpColor(colour1, colour2, inter);
      fill(c);
      float eachSection = stripeWid / gradientLevel;
      if (i == 0) {
        rect(x, y+0.5, stripeWid, stripeHei);
        //rect(x, y, stripeWid, stripeHei);
      }
      noStroke();
      rect(x, y+0.5, eachSection, stripeHei);
      //rect(x, y, eachSection, stripeHei);
      x += eachSection;
    }
  }
}
