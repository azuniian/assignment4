class HoldBeat4{
/////variables/////
//ArrayLists
ArrayList<PVector> holdBeatLane4 = new ArrayList<PVector>();
ArrayList<PVector> holdBeatVel4 = new ArrayList<PVector>();
//PVectors
PVector hold4StartPos;
PVector hold4MidPos;
PVector hold4EndPos;
PVector vel;
//note qualities
PVector startPos;
PVector size;
String label;
color colour;

  HoldBeat4(){ //constructor
    
  }
  
  void spawnStartBeat(){
    //create new addition to object arraylist
    //assign it a pvector for position in pvector arraylist
  }
  
  void spawnMidBeat(){
    
  }
  
  void spawnEndBeat(){
    
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    //may need to separate displays of mid, start, and end beats depending on specifics of display
  }
  
}
