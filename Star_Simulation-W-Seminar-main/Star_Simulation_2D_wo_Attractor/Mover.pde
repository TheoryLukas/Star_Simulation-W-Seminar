/*
* Autor: Lukas Hannawald
* last edited: 08/11/2021
*/

// Klasse Mover
class Mover
{
  PVector location;   // PVector Variable location; Position des Objekts
  PVector velocity;   // PVector Variable velocity; Geschwindigkeit des Objekts
  PVector acceleration;   // PVector Variable acceleration; Beschleunigung des Objekts
  float mass;   // float Variable mass; Masse des Objekts

  // Konstruktor Klasse Mover
  Mover(float m, float x, float y)
  {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Methode applyForce
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);   // Vekor berechnen
    acceleration.add(f);    // Vektor hinzu addieren
  }

  // Methode update
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Methode display
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(0, 100);
    ellipse(location.x, location.y, mass*24, mass*24);    // Objekt erstellen
  }

  // Methode attract  
  PVector attract(Mover m)
  {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (g * mass * m.mass) / (distance * distance);   // Stärke der Kraft berechnen
    force.mult(strength);
    return force;
  }
}
