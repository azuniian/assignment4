class PressBeat1 {
/////variables/////
//ArrayLists
ArrayList<PVector> pressBeat1Lane1 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat2Lane1 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat3Lane1 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat4Lane1 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat5Lane1 = new ArrayList<PVector>();
//PVectors
PVector press1Note1Pos;
PVector press1Note2Pos;
PVector press1Note3Pos;
PVector press1Note4Pos;
PVector press1Note5Pos;
PVector vel;
//note qualities
PVector size;
color colour;

  PressBeat1(float h, float w, color c){ //constructor
    rectMode(CORNER);
    colour = c;
    size = new PVector(w, h);
    vel = new PVector();
    vel.set(0, 50.625);
    
    press1Note1Pos = new PVector();
    press1Note1Pos.set(0, 0);
    press1Note2Pos = new PVector();
    press1Note2Pos.set(0, 0);
    press1Note3Pos = new PVector();
    press1Note3Pos.set(0, 0);
    press1Note4Pos = new PVector();
    press1Note4Pos.set(0, 0);
    press1Note5Pos = new PVector();
    press1Note5Pos.set(0, 0);
  }
  
  void spawnBeat(){
    //assign it a pvector for position in pvector arraylist
    if(pressBeat1Lane1.size() == 0){
      press1Note1Pos.set(31, 0);
      pressBeat1Lane1.add(press1Note1Pos);
    }
    else if(pressBeat2Lane1.size() == 0){
      press1Note2Pos.set(31, 0);
      pressBeat2Lane1.add(press1Note2Pos);
    }
    else if(pressBeat3Lane1.size() == 0){
      press1Note3Pos.set(31, 0);
      pressBeat3Lane1.add(press1Note3Pos);
    }
    else if(pressBeat4Lane1.size() == 0){
      press1Note4Pos.set(31, 0);
      pressBeat4Lane1.add(press1Note4Pos);
    }
    else if(pressBeat5Lane1.size() == 0){
      press1Note5Pos.set(31, 0);
      pressBeat5Lane1.add(press1Note5Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    if(pressBeat1Lane1.size() != 0){
      press1Note1Pos.add(vel);
      pressBeat1Lane1.add(press1Note1Pos);
    }
    if(pressBeat2Lane1.size() != 0){
      press1Note2Pos.add(vel);
      pressBeat2Lane1.add(press1Note2Pos);
    }
    if(pressBeat3Lane1.size() != 0){
      press1Note3Pos.add(vel);
      pressBeat3Lane1.add(press1Note3Pos);
    }
    if(pressBeat4Lane1.size() != 0){
      press1Note4Pos.add(vel);
      pressBeat4Lane1.add(press1Note4Pos);
    }
    if(pressBeat5Lane1.size() != 0){
      press1Note5Pos.add(vel);
      pressBeat5Lane1.add(press1Note5Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    if(pressBeat1Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(press1Note1Pos.x, press1Note1Pos.y, size.x, size.y);
    }
    if(pressBeat2Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(press1Note2Pos.x, press1Note2Pos.y, size.x, size.y);
    }
    if(pressBeat3Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(press1Note3Pos.x, press1Note3Pos.y, size.x, size.y);
    }
    if(pressBeat4Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(press1Note4Pos.x, press1Note4Pos.y, size.x, size.y);
    }
    if(pressBeat5Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(press1Note5Pos.x, press1Note5Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(press1Note1Pos.y >= 1024){
      press1Note1Pos.set(0, 0);
      pressBeat1Lane1.clear();
    }
    if(press1Note2Pos.y >= 1024){
      press1Note2Pos.set(0, 0);
      pressBeat2Lane1.clear();
    }
    if(press1Note3Pos.y >= 1024){
      press1Note3Pos.set(0, 0);
      pressBeat3Lane1.clear();
    }
    if(press1Note4Pos.y >= 1024){
      press1Note4Pos.set(0, 0);
      pressBeat4Lane1.clear();
    }
    if(press1Note5Pos.y >= 1024){
      press1Note5Pos.set(0, 0);
      pressBeat5Lane1.clear();
    }
  }
}
