class Barras{
float x;
float y;
float w;
float h;
boolean mal;
color cl;
Body bo;

Barras(float x_,float y_, float w_, float h_){
  x = x_;
  y= y_;
  w = w_;
  h = h_;
 
  
  PolygonShape ps = new PolygonShape();
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
  ps.setAsBox(box2dW, box2dH);
  BodyDef bodydef = new BodyDef();
  bodydef.type = BodyType.STATIC;
  bodydef.position.set(box2d.coordPixelsToWorld(x,y));
  
  bo =box2d.createBody(bodydef);
  bo.createFixture(ps,1);
  bo.setUserData(this);
  cl = color(255);
 
}

void colores(){
cl =color(random(1,255), random(1,255),random(1,255));
}

void rect1(){
fill(cl);
noStroke();
rectMode(CENTER);
rect(x,y,w,h);


}

}
