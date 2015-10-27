//import gab.opencv.*;
import java.util.Collections;
import java.util.Comparator;

PImage src, dst, canny;
//OpenCV opencv;

//ArrayList<Contour> contours;
//ArrayList<Contour> polygons;

//ArrayList<PVector> vertices = new ArrayList<PVector>();
//ArrayList<Float> finalPoints = new ArrayList<Float>();

import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.spi.*; // for AudioRecordingStream
import ddf.minim.ugens.*;

Minim       minim;
FilePlayer  audio;
AudioOutput out;
Oscil       mod;
FFT         fft;
Convolver   cliffs;

String fileName = "surfinusa.mp3";

void setup() {
  size(800, 600, P3D);
  //src = loadImage("cabrillo.jpg"); 
  //size(src.width, src.height, P3D);
  //opencv = new OpenCV(this, src);

  //opencv.findCannyEdges(250, 100);
  //canny = opencv.getSnapshot();

  //opencv.threshold(127);
  //dst = opencv.getOutput();

  //contours = opencv.findContours();
  //println("found " + contours.size() + " contours");

  //for (Contour contour : contours) {
  //  for (PVector point : contour.getPolygonApproximation ().getPoints()) {
  //    //      println(point.x, point.y);
  //    point.normalize();
  //    vertices.add(new PVector(point.x, point.y) );
  //  }
  //}

  //Collections.sort(vertices, new CompareToY());

  //int size = vertices.size();
  //if (size > 1024) {
  //  size = 1024;
  //}

  //float[] preKern = new float[size];

  //int count = 0;
  //for (PVector p : vertices) {
  //  finalPoints.add(p.x);
  //  if (count < 1024) {
  //    preKern[count++] =  p.x*0.3;
  //  }
  //}

//  println(finalPoints);
//  println(preKern);

  // Sound setup
  //minim = new Minim(this);
   
  
//  audio = minim.loadFile("surfinusa.mp3", 1024);
  

  //audio.loop();

  //fft = new FFT( audio.bufferSize(), audio.sampleRate() );
  
 
  //float[] kernel = preKern;
                                   
  //cliffs = new Convolver(kernel, audio.bufferSize() );
//  audio.addEffect(cliffs);

  // Processing 3 Audio
  
  minim = new Minim(this);
  out = minim.getLineOut();
  mod = new Oscil(2, 0.4f, Waves.SINE ); 
  audio = new FilePlayer( minim.loadFileStream(fileName) );
  audio.loop();

   
  //mod.patch(audio);
  audio.patch(mod);
  
  float[] kernel = new float[] { 0, 0.005, 0.01, 0.018, 0.021, 0.03, 0.034, 0.037, 0.04, 0.042, 0.044, 0.046, 0.048, 0.049, 0.05, 0.049, 0.048, 0.046, 0.044, 0.042, 0.04, 0.037, 0.034, 0.03, 0.021, 0.018, 0.01, 0.005, 0 };
  mod.patch(out);
  //audio.patch(out);

}

void draw() {
  background(0);
  //scale(0.5);
  //image(src, 0, 0);
  //image(dst, src.width, 0);

  //noFill();
  //strokeWeight(3);

  //for (Contour contour : contours) {
  //  stroke(0, 255, 0);
  //  contour.draw();

  //  stroke(255, 0, 0);
  //  beginShape();
  //  for (PVector point : contour.getPolygonApproximation ().getPoints()) {
  //    vertex(point.x, point.y);
  //  }
  //  endShape();
  //}

  //// Draw Audio  
  //scale(2.0);
  //stroke(255);

  //fft.forward( audio.mix );

  //for (int i = 0; i < fft.specSize (); i++)
  //{
  //  line( i, height, i, height - fft.getBand(i)*6 );
  //}

  //for (int i = 0; i < audio.bufferSize () - 1; i++)
  //{
  //  float x1 = map( i, 0, audio.bufferSize(), 0, width/2 );
  //  float x2 = map( i+1, 0, audio.bufferSize(), 0, width/2 );
  //  line( width/2 + x1, height - 200 + audio.left.get(i)*50, width/2 + x2, height - 200 + audio.left.get(i+1)*50 );
  //  line( width/2 + x1, height - 100 + audio.right.get(i)*50, width/2 + x2, height - 100 + audio.right.get(i+1)*50 );
  //}

  //noStroke();
  //fill( 255, 128 );

  // the value returned by the level method is the RMS (root-mean-square) 
  // value of the current buffer of audio.
  // see: http://en.wikipedia.org/wiki/Root_mean_square
  //rect( width/2, height-62, audio.left.level()*width/2, 30 );
  //rect( width/2, height-30, audio.right.level()*width/2, 30 );
}

void mouseMoved()
{
  // usually when setting the amplitude and frequency of an Oscil
  // you will want to patch something to the amplitude and frequency inputs
  // but this is a quick and easy way to turn the screen into
  // an x-y control for them.
  
  //float modulateAmount = map( mouseY, 0, height, 220, 1 );
  float modulateFrequency = map( mouseX, 0, width, 0.1, 200   );
  
  //mod.setFrequency( modulateFrequency );
  //fm.setAmplitude( modulateAmount );

}

public class CompareToY implements Comparator<PVector>
{  
  public int compare(PVector v1, PVector v2) {
    return int(v1.y - v2.y);
  }
}