// Product: ??? XL-MaxSonar-EZ

// Serial data format:
// ASCII capital "R", followed by 3 ASCII char digits, 
// representing the range in cm (up to max val of 765)
// Followed by carriage return (ASCII 13)


//   May not be accurate.
// I see 'd', val val val, 0
// 0 100 x 




import processing.serial.*;

Serial myPort;


void setup(){

 println(Serial.list()); 
 size(200,200);
 
 myPort = new Serial(this, "/dev/ttyAMA0", 9600);
}


void collectDataBytes(){
  
  String dataString = "";
  
  int byteCounter = 0;
   
   while ( (myPort.available() > 0) && (byteCounter < 3)){
    
     int inByte = myPort.read();
     
     dataString += char(inByte);
     
     byteCounter++;
    
   
  }
  
  println("Data: " + int(dataString));
  
}

void draw(){
 
 while (myPort.available() > 0){
  
   int inByte = myPort.read();
   
  if (char( inByte ) == 'R'){
    
    collectDataBytes();
    
  }
   //println( inByte );
 } 
}
