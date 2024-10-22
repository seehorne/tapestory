import processing.serial.*;

import ddf.minim.*;  // Import Minim library
import cc.arduino.*; 

Arduino arduino;
Minim minim;
// Declare AudioPlayer objects
AudioPlayer player2, player3, player4, player5, player6, player7, player8, player9;

void setup() {
  // Initialize Minim
  minim = new Minim(this);
  
  int baudrate = 0; //fill this in with actual port name
 
  
  // Load audio files
  player2 = minim.loadFile("Page1.wav");
  player3 = minim.loadFile("Page2.wav");
  player4 = minim.loadFile("Page3.wav");
  player5 = minim.loadFile("Page4.wav");
  player6 = minim.loadFile("Page5.wav");
  player7 = minim.loadFile("Page6.wav");
  player8 = minim.loadFile("Page7.wav");
  player9 = minim.loadFile("Page8.wav");
  
  //will probably need to fill in the Arduino list with an actual port
  arduino = new Arduino(this, Arduino.list()[0], baudrate);
  
  for (int i = 2; i <= 9; i++) {
    arduino.pinMode(i, Arduino.INPUT);
  }

}

void draw() {
  background(0);  // Black background

  // Read analog values from the sensor pins
  int pin2val = arduino.digitalRead(2);
  int pin3val = arduino.digitalRead(3);
  int pin4val = arduino.digitalRead(4);
  int pin5val = arduino.digitalRead(5);
  int pin6val = arduino.digitalRead(6);
  int pin7val = arduino.digitalRead(7);
  int pin8val = arduino.digitalRead(8);
  int pin9val = arduino.digitalRead(9);

  // Print pin9 value for testing purposes (optional)
  println(pin9val);

  // Check if a sound is playing, if not trigger a new sound
  if (!player2.isPlaying() && pin2val == 0) {
    player2.rewind();  // Rewind before playing
    player2.play();    // Play the sound
  } 
  else if (!player3.isPlaying() && pin3val == 0) {
    player3.rewind();
    player3.play();
  }
  else if (!player4.isPlaying() && pin4val == 0) {
    player4.rewind();
    player4.play();
  }
  else if (!player5.isPlaying() && pin5val == 0) {
    player5.rewind();
    player5.play();
  }
  else if (!player6.isPlaying() && pin6val == 0) {
    player6.rewind();
    player6.play();
  }
  else if (!player7.isPlaying() && pin7val == 0) {
    player7.rewind();
    player7.play();
  }
  else if (!player8.isPlaying() && pin8val == 0) {
    player8.rewind();
    player8.play();
  }
  else if (!player9.isPlaying() && pin9val == 0) {
    player9.rewind();
    player9.play();
  }
}

void stop() {
  // Close all players when stopping
  player2.close();
  player3.close();
  player4.close();
  player5.close();
  player6.close();
  player7.close();
  player8.close();
  player9.close();
  minim.stop();
  super.stop();
}
