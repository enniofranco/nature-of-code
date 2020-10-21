class Wave {
  PVector anchor;
  int xspacing = 8;   // How far apart should each horizontal position be spaced
  int w;              // Width of entire wave
  int maxwaves = 5;   // total # of waves to add together

  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // Height of wave
  float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
  //float[] yvalues; //<-
  Particle[] particles;

  Wave(float _x, float _y, int _width) {
    anchor = new PVector (_x, _y);
    w = _width + (xspacing * 2);

    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(10, 30);
      float period = random(100, 300); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }

    //yvalues = new float[w/xspacing]; //<-
    particles = new Particle[w/xspacing];
  }

  void update() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;

    // Set all height values to zero
    //for (int i = 0; i < yvalues.length; i++) {
    //   //<-
    //  yvalues[i] = 0;
    //}

    // Accumulate wave height values
    for (int j = 0; j < maxwaves; j++) {
      float x = theta;
      for (int i = 0; i < particles.length; i++) {
        // Every other wave is cosine instead of sine
        particles[i] = new Particle(i*xspacing+anchor.x, height/2, x, dx[j], amplitude[j]);
        if (j % 2 == 0) {
          particles[i].updateSin();
          //yvalues[i] += sin(x)*amplitude[j];
        } else {
          particles[i].updateCos();
          //yvalues[i] += cos(x)*amplitude[j];
        }
        x+=dx[j];
      }
    }
  }

  void render() {
    for (int x = 0; x < particles.length; x++) {
      particles[x].render();
    }
  }
}
