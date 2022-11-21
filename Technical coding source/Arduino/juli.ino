#define PIN_TRIG 12
#define PIN_ECHO 11
  
float cm;
float temp;
  
void setup() {  
  Serial.begin(9600);  
  pinMode(PIN_TRIG, OUTPUT);  
  pinMode(PIN_ECHO, INPUT);  
}  
  
void loop() {
  digitalWrite(PIN_TRIG, LOW);
  delayMicroseconds(2);
  digitalWrite(PIN_TRIG, HIGH);
  delayMicroseconds(10);
  digitalWrite(PIN_TRIG, LOW);
    
  temp = float(pulseIn(PIN_ECHO, HIGH));
  cm = (temp * 17 )/1000;
//  
//  Serial.print("Echo = ");  
//  Serial.print(temp);
//  Serial.print(",  Distance = ");  
//  Serial.print(cm);
//  Serial.println("cm");  
   if(cm <= 200){
    Serial.write(1);  
    } else{
      Serial.write(0); 
      }
  delay(300);  
}
