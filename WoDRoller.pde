/**
###############################################################################
#                         WORLD OF DARKNESS DICE ROLLER                       #
#*****************************************************************************#
#                             By: Duncan Murdock                              #
#                             Date: 1/20/2012                                 #
#                             Version: 1                                      #
#*****************************************************************************#
#              Performs a 10-again WoD roll with a hardware RNG.              #
#                 Assumes success on an eight, nine, or ten.                  #
#                  See LICENSE file for licensing details.                    #
#Uses the TrueRandom library http://code.google.com/p/tinkerit/wiki/TrueRandom#
############################################################################### 
**/
#include <TrueRandom.h>
int roll = 0;
int c;
int successes = 0;
boolean rolled = false;
String wins = " Successes";
void setup(){
  Serial.begin(9600);
  Serial.print("Rolls: ");
}

void loop(){
  roll = 0;
  if(Serial.available()){
    c = Serial.read() - '0';
    Serial.println(c);
    Serial.flush();
    successes = 0;
    for(int i = c; i > 0; i--){
      roller();
    }
    c = 0;
    rolled = true;
    wins = successes + wins;
  }
  if(rolled){
   Serial.println(wins); 
   wins = " Successe(s)";
   Serial.print("Rolls: ");
  }
  rolled = false;
}
void roller(){
  roll = TrueRandom.random(1,11);
  if(roll == 10){
  successes ++;
  roller();
  }
  else if(roll > 7 && roll != 10){
    successes ++;
  }
}

