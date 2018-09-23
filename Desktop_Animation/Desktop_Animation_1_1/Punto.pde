class Punto{
  float posx,posy,gran,vel;
  color col;
  boolean attr;  //la variabile dice se il punto é attratto dal cursore oppure no
  
  Punto(float x,float y,float g,float v,color c){
    posx = x;
    posy = y;
    vel  = v;
    col = c;
    gran = g;
    attr = false;
  }
  
  void update(){
    fill(col);
    stroke(col);
    ellipse(posx,posy,gran,gran);  
  }
  
  void move(){
    float distanza = sqrt(pow(posx - mouseX,2) + pow(posy - mouseY, 2));
    if(distanza >= Area){
      posy += vel;
      posx += random(-1,1);
      if(posy > height){
        posy = 0;  
      }
      attr = false;
    }  
    else{
      attr = true;  
    }
  }
  
  void contact(){
    float distanza = sqrt(pow(posx - mouseX,2) + pow(posy - mouseY, 2));
    if(distanza <= Area){
      float R = (Area-distanza)*(255)/Area;  //piú mi avvicino al punto e piú la linea é bianca, piú mi allontano e piú é opaca
      float G = 127+((Area-distanza)*(255-127))/Area;  //forma sempl. 255(A-d)+Bd
      float B = 209+((Area-distanza)*(255-209))/Area;  
      stroke(R,G,B);  //Rmax = 0, Gmax = 127, B = 209
      //print(R + " "+ G+ " "+ B+ " "); 
      line(posx,posy,mouseX,mouseY);  
    }
  }
  
  void attract(){
    //boolean pom = true;  //se vera allora si aggiunge vel, altrimenti si sottrae    //pm = piú o meno
    
    float x = posx + vel;
    float y =  ((x-posx)*(mouseY-posy)/( mouseX - posx))+posy;
    float distance1 = sqrt(pow(x - mouseX,2) + pow(y - mouseY, 2));
    float distance0 = sqrt(pow(posx - mouseX,2) + pow(posy - mouseY, 2));
    
    if(distance1 < distance0){
      posx = x;
      posy = y;
    }
    else{
      posx -= vel;
      posy = ((0-vel)*(mouseY-posy)/( mouseX - posx))+posy;
    }
    
  }
  
}
