class PressBeat4 {
/////variables/////
//ArrayLists
ArrayList<PVector> pressBeat1Lane4;
ArrayList<PVector> pressBeat2Lane4;
ArrayList<PVector> pressBeat3Lane4;
ArrayList<PVector> pressBeat4Lane4;
ArrayList<PVector> pressBeat5Lane4;
ArrayList<PVector> pressBeat6Lane4;
ArrayList<PVector> pressBeat7Lane4;
ArrayList<PVector> pressBeat8Lane4;
ArrayList<PVector> pressBeat9Lane4;
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
    vel = new PVector();
    vel.set(0, 50.625);
    
    press4Note1Pos = new PVector();
    press4Note2Pos = new PVector();
    press4Note3Pos = new PVector();
    press4Note4Pos = new PVector();
    press4Note5Pos = new PVector();
    press4Note6Pos = new PVector();
    press4Note7Pos = new PVector();
    press4Note8Pos = new PVector();
    press4Note9Pos = new PVector();
    
    pressBeat1Lane4 = new ArrayList<PVector>();
    pressBeat2Lane4 = new ArrayList<PVector>();
    pressBeat3Lane4 = new ArrayList<PVector>();
    pressBeat4Lane4 = new ArrayList<PVector>();
    pressBeat5Lane4 = new ArrayList<PVector>();
    pressBeat6Lane4 = new ArrayList<PVector>();
    pressBeat7Lane4 = new ArrayList<PVector>();
    pressBeat8Lane4 = new ArrayList<PVector>();
    pressBeat9Lane4 = new ArrayList<PVector>();
  }
  
  void spawnBeat(){
    //assign it a pvector for position in pvector arraylist
    if(pressBeat1Lane4.size() == 0){
      press4Note1Pos.set(991, 0);
      PVector p = press4Note1Pos.copy();
      pressBeat1Lane4.add(p);
    }
    else if(pressBeat2Lane4.size() == 0){
      press4Note2Pos.set(991, 0);
      PVector p = press4Note2Pos.copy();
      pressBeat2Lane4.add(p);
    }
    else if(pressBeat3Lane4.size() == 0){
      press4Note3Pos.set(991, 0);
      PVector p = press4Note3Pos.copy();
      pressBeat3Lane4.add(p);
    }
    else if(pressBeat4Lane4.size() == 0){
      press4Note4Pos.set(991, 0);
      PVector p = press4Note4Pos.copy();
      pressBeat4Lane4.add(p);
    }
    else if(pressBeat5Lane4.size() == 0){
      press4Note5Pos.set(991, 0);
      PVector p = press4Note5Pos.copy();
      pressBeat5Lane4.add(p);
    }
    else if(pressBeat6Lane4.size() == 0){
      press4Note6Pos.set(991, 0);
      PVector p = press4Note6Pos.copy();
      pressBeat6Lane4.add(p);
    }
    else if(pressBeat7Lane4.size() == 0){
      press4Note7Pos.set(991, 0);
      PVector p = press4Note7Pos.copy();
      pressBeat7Lane4.add(p);
    }
    else if(pressBeat8Lane4.size() == 0){
      press4Note8Pos.set(991, 0);
      PVector p = press4Note8Pos.copy();
      pressBeat8Lane4.add(p);
    }
    else if(pressBeat9Lane4.size() == 0){
      press4Note9Pos.set(991, 0);
      PVector p = press4Note9Pos.copy();
      pressBeat9Lane4.add(p);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    if(pressBeat1Lane4.size() != 0){
      press4Note1Pos.add(vel);
      PVector v = press4Note1Pos.copy();
      pressBeat1Lane4.add(v);
    }
    if(pressBeat2Lane4.size() != 0){
      press4Note2Pos.add(vel);
      PVector v = press4Note2Pos.copy();
      pressBeat2Lane4.add(v);
    }
    if(pressBeat3Lane4.size() != 0){
      press4Note3Pos.add(vel);
      PVector v = press4Note3Pos.copy();
      pressBeat3Lane4.add(v);
    }
    if(pressBeat4Lane4.size() != 0){
      press4Note4Pos.add(vel);
      PVector v = press4Note4Pos.copy();
      pressBeat4Lane4.add(v);
    }
    if(pressBeat5Lane4.size() != 0){
      press4Note5Pos.add(vel);
      PVector v = press4Note5Pos.copy();
      pressBeat5Lane4.add(v);
    }
    if(pressBeat6Lane4.size() != 0){
      press4Note6Pos.add(vel);
      PVector v = press4Note6Pos.copy();
      pressBeat6Lane4.add(v);
    }
    if(pressBeat7Lane4.size() != 0){
      press4Note7Pos.add(vel);
      PVector v = press4Note7Pos.copy();
      pressBeat7Lane4.add(v);
    }
    if(pressBeat8Lane4.size() != 0){
      press4Note8Pos.add(vel);
      PVector v = press4Note8Pos.copy();
      pressBeat8Lane4.add(v);
    }
    if(pressBeat9Lane4.size() != 0){
      press4Note9Pos.add(vel);
      PVector v = press4Note9Pos.copy();
      pressBeat9Lane4.add(v);
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
    if(pressBeat6Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note6Pos.x, press4Note6Pos.y, size.x, size.y);
    }
    if(pressBeat7Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note7Pos.x, press4Note7Pos.y, size.x, size.y);
    }
    if(pressBeat8Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note8Pos.x, press4Note8Pos.y, size.x, size.y);
    }
    if(pressBeat9Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(press4Note9Pos.x, press4Note9Pos.y, size.x, size.y);
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
    if(press4Note6Pos.y >= 1024){
      press4Note6Pos.set(0, 0);
      pressBeat6Lane4.clear();
    }
    if(press4Note7Pos.y >= 1024){
      press4Note7Pos.set(0, 0);
      pressBeat7Lane4.clear();
    }
    if(press4Note8Pos.y >= 1024){
      press4Note8Pos.set(0, 0);
      pressBeat8Lane4.clear();
    }
    if(press4Note9Pos.y >= 1024){
      press4Note9Pos.set(0, 0);
      pressBeat9Lane4.clear();
    }
  }
}
