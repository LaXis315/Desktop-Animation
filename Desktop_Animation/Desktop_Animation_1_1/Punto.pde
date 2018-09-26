class Punto{
  float posx,posy,gran,vel;
  color col;
  boolean attr = false;  //la variabile dice se il punto é attratto dal cursore oppure no
  
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
      if(posy > height || posy < 0){
        posy = 0;  
      }
      if(posx < 0 || posx > width){
        posx = random(width);  
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
      attr = true;
    }
    else{
      attr = false;  
    }
    if(posx<= 0 || posx >= width){
      posx = random(width);   
    }
  }
  
  void attract(){
    
    
  ////____________________________________________
  //  float m = ((mouseY - posy)/(mouseX - posx)); //coefficiente angolare assoluto
  //  if (m < 0){
  //    m *= (-1);
  //  }
  ////____________________________________________  
  //  float x = (cos(atan(m)*180/PI))*vel;  //spostamento x da posx
  ////____________________________________________
  //  float y = (sin(atan(m)*180/PI))*vel;  //spostamento y fa posy
  ////____________________________________________
  
  float a = vel / sqrt(pow(mouseX-posx,2) + pow(mouseY-posy,2));  //RICORDA: la soluzione é la moltiplicazione dei vettori
  float x = abs(posx-mouseX)*a;
  float y = abs(posy - mouseY)*a;
  
    float distance = sqrt(pow(mouseX - posx,2) + pow(mouseY - posy,2));
    
    if(distance <= vel){
      posx = mouseX;
      posy = mouseY;
    }
    //---------------------------
    //else if(posy == mouseY && posx != mouseX){    //retta orizzontale
    //  if(sqrt(pow((posx-vel) - mouseX,2) + pow(posy - mouseY, 2)) < distance){
    //    posx-= vel;
    //  }
    //  else{
    //    posx+=vel;
    //  }
    //}
    //--------------------------
    //else if(posx == mouseX && posy != mouseY){    //retta verticale
    //  if(sqrt(pow(posx - mouseX,2) + pow((posy-vel) - mouseY, 2)) < distance){
    //    posy -= vel;
    //  }
    //  else{
    //    posy += vel;
    //  }
    //}
    //--------------------------
    else { //retta obliqua
     // if( sqrt(pow(x + posx - mouseX,2) + pow(y + posy - mouseY, 2))<sqrt(pow(posx - mouseX,2) + pow(posy - mouseY, 2)) ){
        if(mouseX > posx )
          posx +=x;
        else
          posx -=x;
        if(mouseY > posy)
          posy += y; 
        else
          posy -= y;
     // }
    }

    
  }
  
}
