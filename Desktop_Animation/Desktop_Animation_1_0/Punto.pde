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
      float R = (Area-distanza)*(255)/Area;  //piú mi avvicino al punto e piú la linea é bianca, piú mi allontano e piú é opaca
      float G = 127+((Area-distanza)*(255-127))/Area;  //forma sempl. 255(A-d)+Bd
      float B = 209+((Area-distanza)*(255-209))/Area;  
      stroke(R,G,B); //Rmax = 0, Gmax = 127, B = 209
      line(posx,posy,mouseX,mouseY);  
    }
  }
  
  
}
