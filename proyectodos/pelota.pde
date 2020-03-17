class Pelota{
float x;
float y;
float w;
float h;
float ra;
Body b;
color c;
boolean mal = false;


Pelota(float x, float y, float ra_){

w = 10;
h = 10;
ra = ra_;




makeBody(x,y,ra);
 b.setUserData(this);
 c =  color(255);

}


void colores(){
c = color(random(1,255),random(1,255),random(1,255));

}




void pelotita(){
  Vec2 pos = box2d.getBodyPixelCoord(b);

  pushMatrix();
  translate(pos.x,pos.y);
  fill(c);
  noStroke();
  ellipse(x,y,ra*2,ra*2);
  popMatrix();
  
  
  
}

void makeBody(float x, float y,float ra){

  BodyDef bf = new BodyDef();
  bf.type= BodyType.DYNAMIC;
  bf.position.set(box2d.coordPixelsToWorld(x,y));
  b = box2d.createBody(bf);
  
  CircleShape ces = new CircleShape();
  ces.m_radius = box2d.scalarPixelsToWorld(ra);
  
  
  FixtureDef fx = new FixtureDef();
  fx.shape  =ces;
  
  fx.density = 1;
  fx.friction = 0.03;
  fx.restitution = 0.5;
  
  
  

  b.createFixture(fx);
  
  b.setAngularVelocity(10);
}
}
