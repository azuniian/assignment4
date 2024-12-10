class PressBeat4{
/////variables/////
//ArrayLists
ArrayList<PVector> pressBeat1Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat2Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat3Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat4Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat5Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat6Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat7Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat8Lane4 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat9Lane4 = new ArrayList<PVector>();
//PVectors
PVector press4Note1Pos;
PVector press4Note2Pos;
PVector press4Note3Pos;
PVector press4Note4Pos;
PVector press4Note5Pos;
PVector press4Note6Pos;
PVector press4Note7Pos;
PVector press4Note8Pos;
PVector press4Note9Pos;
PVector vel;
//note qualities
PVector size;
color colour;

  PressBeat4(float h, float w, color c){ //constructor
    rectMode(CORNER);
    colour = c;
    size = new PVector(w, h);
    PVector vel = new PVector();
    vel.set(0, 50.625);
  }
  
  void spawnBeat(){
    //assign it a pvector for position in pvector arraylist
    if(pressBeat1Lane4.size() == 0){
      press4Note1Pos.set(991, 0);
      pressBeat1Lane4.add(press4Note1Pos);
    }
    else if(pressBeat2Lane4.size() == 0){
      press4Note2Pos.set(991, 0);
      pressBeat2Lane4.add(press4Note2Pos);
    }
    else if(pressBeat3Lane4.size() == 0){
      press4Note3Pos.set(991, 0);
      pressBeat3Lane4.add(press4Note3Pos);
    }
    else if(pressBeat4Lane4.size() == 0){
      press4Note4Pos.set(991, 0);
      pressBeat4Lane4.add(press4Note4Pos);
    }
    else if(pressBeat5Lane4.size() == 0){
      press4Note5Pos.set(991, 0);
      pressBeat5Lane4.add(press4Note5Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    if(pressBeat1Lane4.size() != 0){
      press4Note1Pos.add(vel);
      pressBeat1Lane4.add(press4Note1Pos);
    }
    if(pressBeat2Lane4.size() != 0){
      press4Note2Pos.add(vel);
      pressBeat2Lane4.add(press4Note2Pos);
    }
    if(pressBeat3Lane4.size() != 0){
      press4Note3Pos.add(vel);
      pressBeat3Lane4.add(press4Note3Pos);
    }
    if(pressBeat4Lane4.size() != 0){
      press4Note4Pos.add(vel);
      pressBeat4Lane4.add(press4Note4Pos);
    }
    if(pressBeat5Lane4.size() != 0){
      press4Note5Pos.add(vel);
      pressBeat5Lane4.add(press4Note5Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    if(pressBeat1Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note1Pos.x, press4Note1Pos.y, size.x, size.y);
    }
    if(pressBeat2Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note2Pos.x, press4Note2Pos.y, size.x, size.y);
    }
    if(pressBeat3Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note3Pos.x, press4Note3Pos.y, size.x, size.y);
    }
    if(pressBeat4Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note4Pos.x, press4Note4Pos.y, size.x, size.y);
    }
    if(pressBeat5Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note5Pos.x, press4Note5Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(press4Note1Pos.y >= 1024){
      press4Note1Pos.set(0, 0);
      pressBeat1Lane4.clear();
    }
    if(press4Note2Pos.y >= 1024){
      press4Note2Pos.set(0, 0);
      pressBeat2Lane4.clear();
    }
    if(press4Note3Pos.y >= 1024){
      press4Note3Pos.set(0, 0);
      pressBeat3Lane4.clear();
    }
    if(press4Note4Pos.y >= 1024){
      press4Note4Pos.set(0, 0);
      pressBeat4Lane4.clear();
    }
    if(press4Note5Pos.y >= 1024){
      press4Note5Pos.set(0, 0);
      pressBeat5Lane4.clear();
    }
  }
}
