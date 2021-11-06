class Attractor
{
  float mass;
  float g;
  PVector location;
  boolean dragging = false;
  boolean rollover = false;
  PVector dragOffset;

  Attractor()
  {
    location = new PVector(width/2,height/2);
    mass = 15;
    g = 1;
    dragOffset = new PVector(0.0,0.0);
  }

  PVector attract(Mover m)
  {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (g * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display()
  {
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    if (dragging){
      fill (50);
    }
    else if (rollover){
      fill(100);
    }
    else{
      fill(175,200);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
  }

  void clicked(int mx, int my) 
  {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass){
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void hover(int mx, int my)
  {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass){
      rollover = true;
    } 
    else{
      rollover = false;
    }
  }

  void stopDragging()
  {
    dragging = false;
  }
  
  void drag()
  {
    if (dragging){
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
}
