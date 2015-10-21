
void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println(F("Wave test!"));
  
  randomSeed(analogRead(0));

}

void loop() { 
   int distsensor, i;
   long time;
   
   distsensor = 0;
   for (i=0; i<8; i++) {
     distsensor += analogRead(0);
     delay(50);
   }
   distsensor /= 8;

   Serial.print(F("Sensor = ")); 
   Serial.println(distsensor);
   
   // A reading of 500 means something is 6 meters away. Smaller numbers means closer, larger means farther away.
   if (distsensor <= 500) {
     Serial.println("- - - - - - - - - - - - - CLOSE!"); 
     Serial.println(distsensor);
   } else if (distsensor > 500) {
      Serial.println("FAR!");
      Serial.println(distsensor);
   }
  
}


