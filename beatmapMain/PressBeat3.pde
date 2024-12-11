class PressBeat3 {
/////variables/////
//ArrayLists
ArrayList<PVector> pressBeat1Lane3 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat2Lane3 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat3Lane3 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat4Lane3 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat5Lane3 = new ArrayList<PVector>();
//PVectors
PVector press3Note1Pos;
PVector press3Note2Pos;
PVector press3Note3Pos;
PVector press3Note4Pos;
PVector press3Note5Pos;
PVector vel;
//note qualities
PVector size;
color colour;

  PressBeat3(float h, float w, color c){ //constructor
    rectMode(CORNER);
    colour = c;
    size = new PVector(w, h);
    vel = new PVector();
    vel.set(0, 7);
    
    press3Note1Pos = new PVector();
    press3Note1Pos.set(0, 0);
    press3Note2Pos = new PVector();
    press3Note2Pos.set(0, 0);
    press3Note3Pos = new PVector();
    press3Note3Pos.set(0, 0);
    press3Note4Pos = new PVector();
    press3Note4Pos.set(0, 0);
    press3Note5Pos = new PVector();
    press3Note5Pos.set(0, 0);
  }
  
  void spawnBeat(){
    //assign it a pvector for position in pvector arraylist
    if(pressBeat1Lane3.size() == 0){
      press3Note1Pos.set(671, 0);
      pressBeat1Lane3.add(press3Note1Pos);
    }
    else if(pressBeat2Lane3.size() == 0){
      press3Note2Pos.set(671, 0);
      pressBeat2Lane3.add(press3Note2Pos);
    }
    else if(pressBeat3Lane3.size() == 0){
      press3Note3Pos.set(671, 0);
      pressBeat3Lane3.add(press3Note3Pos);
    }
    else if(pressBeat4Lane3.size() == 0){
      press3Note4Pos.set(671, 0);
      pressBeat4Lane3.add(press3Note4Pos);
    }
    else if(pressBeat5Lane3.size() == 0){
      press3Note5Pos.set(671, 0);
      pressBeat5Lane3.add(press3Note5Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    if(pressBeat1Lane3.size() != 0){
      press3Note1Pos.add(vel);
      pressBeat1Lane3.add(press3Note1Pos);
    }
    if(pressBeat2Lane3.size() != 0){
      press3Note2Pos.add(vel);
      pressBeat2Lane3.add(press3Note2Pos);
    }
    if(pressBeat3Lane3.size() != 0){
      press3Note3Pos.add(vel);
      pressBeat3Lane3.add(press3Note3Pos);
    }
    if(pressBeat4Lane3.size() != 0){
      press3Note4Pos.add(vel);
      pressBeat4Lane3.add(press3Note4Pos);
    }
    if(pressBeat5Lane3.size() != 0){
      press3Note5Pos.add(vel);
      pressBeat5Lane3.add(press3Note5Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    if(pressBeat1Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(press3Note1Pos.x, press3Note1Pos.y, size.x, size.y);
    }
    if(pressBeat2Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(press3Note2Pos.x, press3Note2Pos.y, size.x, size.y);
    }
    if(pressBeat3Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(press3Note3Pos.x, press3Note3Pos.y, size.x, size.y);
    }
    if(pressBeat4Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(press3Note4Pos.x, press3Note4Pos.y, size.x, size.y);
    }
    if(pressBeat5Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(press3Note5Pos.x, press3Note5Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(press3Note1Pos.y >= 1024){
      press3Note1Pos.set(0, 0);
      pressBeat1Lane3.clear();
    }
    if(press3Note2Pos.y >= 1024){
      press3Note2Pos.set(0, 0);
      pressBeat2Lane3.clear();
    }
    if(press3Note3Pos.y >= 1024){
      press3Note3Pos.set(0, 0);
      pressBeat3Lane3.clear();
    }
    if(press3Note4Pos.y >= 1024){
      press3Note4Pos.set(0, 0);
      pressBeat4Lane3.clear();
    }
    if(press3Note5Pos.y >= 1024){
      press3Note5Pos.set(0, 0);
      pressBeat5Lane3.clear();
    }
  }
}
