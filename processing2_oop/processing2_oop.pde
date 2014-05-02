import java.util.ArrayList;
import java.util.Iterator;

Layout layout;

void setup() {
  int rectLength = 100;
  
  layout = new Layout();
  layout.ready(rectLength);
}

void draw() {
  layout.display();
}

class Layout {

  private Ellipse ellipse;
  private ArrayList<Rect> rects;
  private GraphicsFactory graphicsFactory;
  private int rectLength;
  
  public void ready(int rectLength) {
    this.rectLength = rectLength;
    background(255, 255, 255);
    size(480, 320);
  }
  
  public void display() {
    background(255, 255, 255);
    
    this.graphicsFactory = new GraphicsFactory();
                                                                            
    this.ellipse = graphicsFactory.createEllipse();
    this.rects = graphicsFactory.createRandomRects(this.rectLength);
    
    for(Iterator<Rect> iterator = this.rects.iterator(); iterator.hasNext(); ) {
      Rect rect = iterator.next();
      rect.show();
    }
    
    this.ellipse.show();
  }
  
}

class GraphicsFactory {

  public Background background;
  public Size size;
  public Position position;
  
  Rect createRect() {
    return new Rect(new Background(random(128, 255), random(128, 255), random(128, 255)),
                    new Size(50, 50),
                    new Position(random(480), random(320)));
  }
  
  ArrayList<Rect> createRandomRects(int num) {
    
    ArrayList<Rect> rects = new ArrayList<Rect>();
    
    for(int i = 0; i < num; i++) {
      rects.add(new Rect(new Background(random(128, 255), random(128, 255), random(128, 255)),
                         new Size(random(30, 50), random(30, 50)),
                         new Position(random(480), random(320))));
    }
    
    return rects;
    
  }
  
  Ellipse createEllipse() {
    return new Ellipse(new Background(random(128, 255), random(128, 255), random(128, 255)),
                       new Size(random(10, 200), random(10, 200)),
                       new Position((width/2), (height/2)));
  }

}

abstract class Graphic {
  
  public Background background;
  public Size size;
  public Position position;
  
  Graphic(Background background,
          Size size,
          Position position) {
         
    this.background = background;
    this.size = size;
    this.position = position;
    
  }
  
  public void show() {}
  
}

class Rect {
  
  public Background background;
  public Size size;
  public Position position;
  
  Rect(Background background,
       Size size,
       Position position) {
         
    this.background = background;
    this.size = size;
    this.position = position;
  }
  
  public void show() {
    noStroke();
    
    fill(this.background.r,
         this.background.g,
         this.background.b);
         
    rect(this.position.x,
         this.position.y,
         this.size.w,
         this.size.h);
  }
  
}

class Ellipse {
  
  public Background background;
  public Size size;
  public Position position;
  
  Ellipse(Background background,
       Size size,
       Position position) {
         
    this.background = background;
    this.size = size;
    this.position = position;
  }
  
  public void show() {
    noStroke();
    
    fill(this.background.r,
         this.background.g,
         this.background.b);
         
    ellipse(this.position.x,
            this.position.y,
            this.size.w,
            this.size.h);
  }
  
}

class Size {

  public float w;
  public float h;
  
  Size(float w, float h) {
    this.w = w;
    this.h = h;
  }
  
}

class Position {

  public float x;
  public float y;
  
  Position(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
}

class Background {

  public float r;
  public float g;
  public float b;
  
  Background(float r, float g, float b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
}
