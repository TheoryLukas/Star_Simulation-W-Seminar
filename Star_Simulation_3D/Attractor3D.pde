/*
* Autor: Lukas Hannawald
* last edited: 08/11/2021
*/

// Klasse Attractor3D
class Attractor3D 
{
  float mass;   // float Variable mass; Masse des Objekts
  PVector location;   // PVector Variable location; Position des Objekts
  float g;    // float Variable g; Stärke der Beschleunigungskraft

  // Konstruktor Klasse Attractor3D
  Attractor3D() 
  {
    location = new PVector(0,0);
    mass = 20;
    g = 0.4;
  }

  //Methode attract
  PVector attract(Mover3D m) 
  {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (g * mass * m.mass) / (distance * distance);   // Strärke der Kraft berechnen
    force.mult(strength);
    return force;   // Kraft zurückgeben
  }

  // Methode display
  void display() {
    stroke(255);
    noFill();
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(mass*2);   // Objekt erstellen
    popMatrix();
  }
}
