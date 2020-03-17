import processing.sound.*;


import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;

Barras barras;
ArrayList<Pelota> pelotas;
ArrayList<Barras> barra;

SoundFile sonido;

void setup(){
  background(#FCC9FF);
  size(600,400);
  smooth();
 
  box2d =new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  box2d.setGravity(0, -10);
  barra = new ArrayList<Barras>();
  pelotas = new ArrayList<Pelota>();



 
 
 barra.add(new Barras(150,200,150,20));
 barra.add(new Barras(450,200,150,20));
 barra.add(new Barras(300,300,150,20));
 



}

void draw(){

  background(#FCC9FF);
  box2d.step();

  fill(0);
  textSize(18);
  text("Presiona clic derecho para empezar",150,50);
  
  
  
for(Barras b: barra){
  b.rect1();
}


for(Pelota pp: pelotas){
pp.pelotita();

}


}
 void mousePressed(){
   Pelota pp = new Pelota(mouseX, mouseY,10);
   pelotas.add(pp);   
 }
 
 void beginContact(Contact con){
 Fixture f1 =con.getFixtureA();
 Fixture f2 =con.getFixtureB();

 
 Body b1 = f1.getBody();
 Body b2 = f2.getBody();

 
 Object o1 = b1.getUserData();
 Object o2 = b2.getUserData();

 

 if(o1.getClass()== Barras.class){
 Pelota pe =(Pelota) o2;
 pe.colores();

 

 }

 if(o2.getClass()== Pelota.class){
 Barras ba =(Barras) o1;
 ba.colores();

 }
 
 
 }
 void endContact(Contact con){
 }
