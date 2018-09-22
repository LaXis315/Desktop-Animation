int npunti = 300; //punti totali
color c = color(255);
Punto [] punti = new Punto[npunti];

void setup(){
  //size(800,600);
  fullScreen();
  background(#007FD1);
  for(int i = 0; i < npunti; i++){
     punti [i] = new Punto(random(width), random(height), 2.0 , 0.6, c);     //posx,posy,grandezza,velocitá,colore  //base 2.0, 0.6 , (255,255,255)
  }
}

float Area = 100; //area punti collegati //base 40

void draw(){
  background(#007FD1);
  for(int i = 0; i < npunti; i++){
    punti[i].update();  //aggiorna i punti
    punti[i].move(); //muove i punti in basso
    punti[i].contact(); //controlla ed effettua i contatti con il puntatore
  }
  
}
