import processing.video.*;
import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

Movie movie1;
Movie movie2;

void setup() {
  fullScreen();
  //size(1920, 1080,P3D);
  
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  
  frameRate(30);
  movie1 = new Movie(this, "video1.MOV");
  movie2 = new Movie(this, "video2.MOV");
  movie1.loop();
  movie2.loop();
}


void movieEvent(Movie m) {
  if (m == movie1) {
    movie1.read();
  } else if (m == movie2) {
    movie2.read();
  }
}

void draw() {
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }
  if (val == 1) {              // If the serial value is 0,
    image(movie1, 0, 0, width, height);
    movie1.volume(50);                  // set fill to black
    movie2.volume(0); 
  } 
  else {                       // If the serial value is not 0,
    image(movie2, 0, 0, width, height);
    movie1.volume(0);                 // set fill to light gray
    movie2.volume(50); 
  }
   
   
}
