class PressBeat2 {
/////variables/////
//ArrayLists
ArrayList<PVector> pressBeat1Lane2 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat2Lane2 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat3Lane2 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat4Lane2 = new ArrayList<PVector>();
ArrayList<PVector> pressBeat5Lane2 = new ArrayList<PVector>();
//PVectors
PVector press2Note1Pos;
PVector press2Note2Pos;
PVector press2Note3Pos;
PVector press2Note4Pos;
PVector press2Note5Pos;
PVector vel;
//note qualities
PVector size;
color colour;

  PressBeat2(float h, float w, color c){ //constructor
    rectMode(CORNER);
    colour = c;
    size = new PVector(w, h);
    vel = new PVector();
    vel.set(0, 7);
    
    press2Note1Pos = new PVector();
    press2Note1Pos.set(0, 0);
    press2Note2Pos = new PVector();
    press2Note2Pos.set(0, 0);
    press2Note3Pos = new PVector();
    press2Note3Pos.set(0, 0);
    press2Note4Pos = new PVector();
    press2Note4Pos.set(0, 0);
    press2Note5Pos = new PVector();
    press2Note5Pos.set(0, 0);
  }
  
  void spawnBeat(){
    //assign it a pvector for position in pvector arraylist
    if(pressBeat1Lane2.size() == 0){
      press2Note1Pos.set(351, 0);
      pressBeat1Lane2.add(press2Note1Pos);
    }
    else if(pressBeat2Lane2.size() == 0){
      press2Note2Pos.set(351, 0);
      pressBeat2Lane2.add(press2Note2Pos);
    }
    else if(pressBeat3Lane2.size() == 0){
      press2Note3Pos.set(351, 0);
      pressBeat3Lane2.add(press2Note3Pos);
    }
    else if(pressBeat4Lane2.size() == 0){
      press2Note4Pos.set(351, 0);
      pressBeat4Lane2.add(press2Note4Pos);
    }
    else if(pressBeat5Lane2.size() == 0){
      press2Note5Pos.set(351, 0);
      pressBeat5Lane2.add(press2Note5Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    if(pressBeat1Lane2.size() != 0){
      press2Note1Pos.add(vel);
      pressBeat1Lane2.add(press2Note1Pos);
    }
    if(pressBeat2Lane2.size() != 0){
      press2Note2Pos.add(vel);
      pressBeat2Lane2.add(press2Note2Pos);
    }
    if(pressBeat3Lane2.size() != 0){
      press2Note3Pos.add(vel);
      pressBeat3Lane2.add(press2Note3Pos);
    }
    if(pressBeat4Lane2.size() != 0){
      press2Note4Pos.add(vel);
      pressBeat4Lane2.add(press2Note4Pos);
    }
    if(pressBeat5Lane2.size() != 0){
      press2Note5Pos.add(vel);
      pressBeat5Lane2.add(press2Note5Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    if(pressBeat1Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(press2Note1Pos.x, press2Note1Pos.y, size.x, size.y);
    }
    if(pressBeat2Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(press2Note2Pos.x, press2Note2Pos.y, size.x, size.y);
    }
    if(pressBeat3Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(press2Note3Pos.x, press2Note3Pos.y, size.x, size.y);
    }
    if(pressBeat4Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(press2Note4Pos.x, press2Note4Pos.y, size.x, size.y);
    }
    if(pressBeat5Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(press2Note5Pos.x, press2Note5Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(press2Note1Pos.y >= 1024){
      press2Note1Pos.set(0, 0);
      pressBeat1Lane2.clear();
    }
    if(press2Note2Pos.y >= 1024){
      press2Note2Pos.set(0, 0);
      pressBeat2Lane2.clear();
    }
    if(press2Note3Pos.y >= 1024){
      press2Note3Pos.set(0, 0);
      pressBeat3Lane2.clear();
    }
    if(press2Note4Pos.y >= 1024){
      press2Note4Pos.set(0, 0);
      pressBeat4Lane2.clear();
    }
    if(press2Note5Pos.y >= 1024){
      press2Note5Pos.set(0, 0);
      pressBeat5Lane2.clear();
    }
  }
}
