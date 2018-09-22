class Punto{
  float posx,posy,gran,vel;
  color col;
  
  Punto(float x,float y,float g,float v,color c){
    posx = x;
    posy = y;
    vel  = v;
    col = c;
    gran = g;
  }
  
  void update(){
    fill(col);
    stroke(col);
    ellipse(posx,posy,gran,gran);  
  }
  
  void move(){
    posy += vel;
    posx += random(-1,1);
    if(posy > height){
      posy = 0;  
    }
  }
  
  void contact(){
    float distanza = sqrt(pow(posx - mouseX,2) + pow(posy - mouseY, 2));
    if(distanza <= Area){
      line(posx,posy,mouseX,mouseY);  
    }
  }
  
  
}
