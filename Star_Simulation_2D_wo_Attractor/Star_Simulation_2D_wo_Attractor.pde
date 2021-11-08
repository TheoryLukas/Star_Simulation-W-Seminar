/*
* Autor: Lukas Hannawald 
* last edited: 08/11/2021
*/

Mover[] movers = new Mover[2];   //Mover Liste; hält die gewünschte Anzahl an Objekten

float g = 0.4;    // float Variable g; Stärke der Beschleunigungskraft

// Simulations setup
void setup()
{
  size(800,200);  // Fenster; Größe 800x200
  smooth();   // Anti-Aliasing
  for (int i = 0; i < movers.length; i++)   // for-Schleife; Mover nacheinander einfügen
  {
    movers[i] = new Mover(random(0.1,2),random(width),random(height));    // Mover mit zufälligen Werten einfügen 
  }
}

// Simulations draw-Schleife
void draw()
{
  background(255);    // Hintergrund Farbe ändern; ändern auf weiß
  for (int i = 0; i < movers.length; i++)   // for-Schleifen; Berechnung der Gravitation
  {
    for (int j = 0; j < movers.length; j++)
    {
      if (i != j){
        PVector force = movers[j].attract(movers[i]);   // Kraft berechnen
        movers[i].applyForce(force);    // Kraft addieren
      }
    }
    movers[i].update();   // Positionen akualisieren
    movers[i].display();    // Objekte anzeigen
  }
}
