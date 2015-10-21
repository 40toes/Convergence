import gab.opencv.*;
import java.util.Collections;
import java.util.Comparator;

PImage src, dst, canny;
OpenCV opencv;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

ArrayList<PVector> vertices = new ArrayList<PVector>();
ArrayList<Float> finalPoints = new ArrayList<Float>();

void setup() {
  src = loadImage("cabrillo.jpg"); 
  size(src.width, src.height/2);
  opencv = new OpenCV(this, src);
  
  opencv.findCannyEdges(250,100);
  canny = opencv.getSnapshot();

  opencv.threshold(127);
  dst = opencv.getOutput();

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
  
  for (Contour contour : contours) {
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
//      println(point.x, point.y);
      vertices.add(new PVector(point.x, point.y) );
    }
  }
  
  Collections.sort(vertices, new CompareToY());
  
  for (PVector p : vertices) {
    finalPoints.add(p.x);
  }
  
  println(finalPoints);
}

void draw() {
  scale(0.5);
  image(src, 0, 0);
  image(dst, src.width, 0);

  noFill();
  strokeWeight(3);
  
  for (Contour contour : contours) {
    stroke(0, 255, 0);
    contour.draw();
    
    stroke(255, 0, 0);
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}

public class CompareToY implements Comparator<PVector>
{  
  public int compare(PVector v1, PVector v2) {
    return int(v1.y - v2.y);
  }

}
