class planet {
  float radius;
  float distance;
  planet[] planets;
  float angle;
  float orbitspeed;
  
  planet(float r, float d, float o) {
    radius = r;
    distance = d;
    angle = random(TWO_PI);
    orbitspeed = o;
  }
  
  void orbit() {
    angle = angle + orbitspeed;   
    if(planets != null){
        for (int i = 0; i < planets.length; i++) {
          planets[i].orbit();
        }
    }

  }
  
  void spawnMoons(int total, int level) {
    planets = new planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius * 0.5;
      float d = random(75,300);
      float o = random(0.002, 0.1);
      planets[i] = new planet (r, d, o);
      if (level < 1){
        int num = int(random(0,4));
        planets[i].spawnMoons(5, level+1);
      //println(planets[i]);
      
      } 
    }
    
  }
  
  void show() {
    pushMatrix();
    fill(255,100);
    noStroke();
    rotate(angle);
    translate(distance,0);
    ellipse (0, 0,radius*2 , radius*2);
    
    if(planets != null){
      println(planets.length);
      for (int i = 0; i < planets.length; i++) {
       planets[i].show();

      }
    }
    popMatrix();
  }
}
