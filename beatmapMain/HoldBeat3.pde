class HoldBeat3{
/////variables/////
//ArrayLists
ArrayList<PVector> holdStart1Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdStart2Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid1Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid2Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid3Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid4Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid5Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid6Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid7Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid8Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid9Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdMid10Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd1Lane3 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd2Lane3 = new ArrayList<PVector>();
//PVectors
PVector hold3Start1Pos;
PVector hold3Start2Pos;
PVector mid3Note1Pos;
PVector mid3Note2Pos;
PVector mid3Note3Pos;
PVector mid3Note4Pos;
PVector mid3Note5Pos;
PVector mid3Note6Pos;
PVector mid3Note7Pos;
PVector mid3Note8Pos;
PVector mid3Note9Pos;
PVector mid3Note10Pos;
PVector hold3End2Pos;
PVector hold3End2Pos;
PVector vel;
//note qualities
PVector size;
color colour;

  HoldBeat3(float h1, float w1, float h2, float w2, color c1, color c2){ //constructor
    rectMode(CORNER);
    colour = c1;
    colour = c2;
    size = new PVector(w1, h1);
    sizeMid = new PVector(w2, h2);
    PVector vel = new PVector();
    vel.set(0, 50.625);
  }
  
  void spawnStartBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdStart1Lane3.size() == 0){
      hold3Start1Pos.set(31, 0);
      holdStart1Lane3.add(hold3Start1Pos);
    }
    else if(holdStart2Lane3.size() == 0){
      hold3Start2Pos.set(31, 0);
      holdStart2Lane3.add(hold3Start2Pos);
    }
  }
  
  void spawnMidBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdMid1Lane3.size() == 0){
      mid3Note1Pos.set(31, 0);
      holdMid2Lane3.add(mid3Note1Pos);
    }
    else if(holdMid2Lane3.size() == 0){
      mid3Note2Pos.set(31, 0);
      holdMid2Lane3.add(mid3Note2Pos);
    }
    else if(holdMid3Lane3.size() == 0){
      mid3Note3Pos.set(31, 0);
      holdMid3Lane3.add(mid3Note3Pos);
    }
    else if(holdMid4Lane3.size() == 0){
      mid3Note4Pos.set(31, 0);
      holdMid4Lane3.add(mid3Note4Pos);
    }
    else if(holdMid5Lane3.size() == 0){
      mid3Note5Pos.set(31, 0);
      holdMid5Lane3.add(mid3Note5Pos);
    }
    else if(holdMid6Lane3.size() == 0){
      mid3Note6Pos.set(31, 0);
      holdMid6Lane3.add(mid3Note6Pos);
    }
    else if(holdMid7Lane3.size() == 0){
      mid3Note7Pos.set(31, 0);
      holdMid7Lane3.add(mid3Note7Pos);
    }
    else if(holdMid8Lane3.size() == 0){
      mid3Note8Pos.set(31, 0);
      holdMid8Lane3.add(mid3Note8Pos);
    }
    else if(holdMid9Lane3.size() == 0){
      mid3Note9Pos.set(31, 0);
      holdMid9Lane3.add(mid3Note9Pos);
    }
    else if(holdMid10Lane3.size() == 0){
      mid3Note10Pos.set(31, 0);
      holdMid10Lane3.add(mid3Note2Pos);
    }
  }
  
  void spawnEndBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdEnd1Lane3.size() == 0){
      hold3End1Pos.set(31, 0);
      holdEnd1Lane3.add(hold3End1Pos);
    }
    else if(holdEnd2Lane3.size() == 0){
      hold3End2Pos.set(31, 0);
      holdEnd2Lane3.add(hold3End2Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    //start notes
    if(holdStart1Lane3.size() != 0){
      hold3Start1Pos.add(vel);
      holdStart1Lane3.add(hold3Start1Pos);
    }
    if(holdStart2Lane3.size() != 0){
      hold3Start2Pos.add(vel);
      holdStart2Lane3.add(hold3Start2Pos);
    }
    
    //mid notes
    if(holdMid1Lane3.size() != 0){
      mid3Note1Pos.add(vel);
      holdMid1Lane3.add(mid3Note1Pos);
    }
    if(holdMid2Lane3.size() != 0){
      mid3Note2Pos.add(vel);
      holdMid2Lane3.add(mid3Note2Pos);
    }
    if(holdMid3Lane3.size() != 0){
      mid3Note3Pos.add(vel);
      holdMid3Lane3.add(mid3Note3Pos);
    }
    if(holdMid4Lane3.size() != 0){
      mid3Note4Pos.add(vel);
      holdMid4Lane3.add(mid3Note4Pos);
    }
    if(holdMid5Lane3.size() != 0){
      mid3Note5Pos.add(vel);
      holdMid5Lane3.add(mid3Note5Pos);
    }
    if(holdMid6Lane3.size() != 0){
      mid3Note6Pos.add(vel);
      holdMid6Lane3.add(mid3Note6Pos);
    }
    if(holdMid7Lane3.size() != 0){
      mid3Note7Pos.add(vel);
      holdMid7Lane3.add(mid3Note7Pos);
    }
    if(holdMid8Lane3.size() != 0){
      mid3Note8Pos.add(vel);
      holdMid8Lane3.add(mid3Note8Pos);
    }
    if(holdMid9Lane3.size() != 0){
      mid3Note9Pos.add(vel);
      holdMid9Lane3.add(mid3Note9Pos);
    }
    if(holdMid10Lane3.size() != 0){
      mid3Note10Pos.add(vel);
      holdMid10Lane3.add(mid3Note10Pos);
    }
    
    //end notes
    if(holdEnd1Lane3.size() != 0){
      hold3End1Pos.add(vel);
      holdEnd1Lane3.add(hold3End1Pos);
    }
    if(holdEnd2Lane3.size() != 0){
      hold3End2Pos.add(vel);
      holdEnd2Lane3.add(hold3End2Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    //may need to separate displays of mid, start, and end beats depending on specifics of display
    //start notes
    if(holdStart1Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(hold3Start1Pos.x, hold3Start1Pos.y, size.x, size.y);
    }
    if(holdStart2Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(hold3Start1Pos.x, hold3Start1Pos.y, size.x, size.y);
    }
    
    //mid notes
    if(holdMid1Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note1Pos.x, mid3Note1Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid2Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note2Pos.x, mid3Note2Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid3Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note3Pos.x, mid3Note3Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid4Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note4Pos.x, mid3Note4Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid5Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note5Pos.x, mid3Note5Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid6Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note6Pos.x, mid3Note6Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid7Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note7Pos.x, mid3Note7Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid8Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note8Pos.x, mid3Note8Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid9Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note9Pos.x, mid3Note9Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid10Lane3.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid3Note10Pos.x, mid3Note10Pos.y, sizeMid.x, sizeMid.y);
    }
    
    //end notes
    if(holdEnd1Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(hold3End1Pos.x, hold3End1Pos.y, size.x, size.y);
    }
    if(holdEnd2Lane3.size() != 0){
      fill(colour);
      noStroke();
      rect(hold3End1Pos.x, hold3End1Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(hold3Start1Pos.y >= 1024){
      hold3Start1Pos.set(0, 0);
      holdStart1Lane3.clear();
    }
    if(hold3Start2Pos.y >= 1024){
      hold3Start2Pos.set(0, 0);
      holdStart2Lane3.clear();
    }
    
    if(mid3Note1Pos.y >= 1024){
      mid3Note1Pos.set(0, 0);
      holdMid1Lane3.clear();
    }
    if(mid3Note2Pos.y >= 1024){
      mid3Note2Pos.set(0, 0);
      holdMid2Lane3.clear();
    }
    if(mid3Note3Pos.y >= 1024){
      mid3Note3Pos.set(0, 0);
      holdMid3Lane3.clear();
    }
    if(mid3Note4Pos.y >= 1024){
      mid3Note4Pos.set(0, 0);
      holdMid4Lane3.clear();
    }
    if(mid3Note5Pos.y >= 1024){
      mid3Note5Pos.set(0, 0);
      holdMid5Lane3.clear();
    }
    if(mid3Note6Pos.y >= 1024){
      mid3Note6Pos.set(0, 0);
      holdMid6Lane3.clear();
    }
    if(mid3Note7Pos.y >= 1024){
      mid3Note7Pos.set(0, 0);
      holdMid7Lane3.clear();
    }
    if(mid3Note8Pos.y >= 1024){
      mid3Note8Pos.set(0, 0);
      holdMid8Lane3.clear();
    }
    if(mid3Note9Pos.y >= 1024){
      mid3Note9Pos.set(0, 0);
      holdMid9Lane3.clear();
    }
    if(mid3Note10Pos.y >= 1024){
      mid3Note10Pos.set(0, 0);
      holdMid10Lane3.clear();
    }
    
    if(hold3End1Pos.y >= 1024){
      hold3End1Pos.set(0, 0);
      holdEnd1Lane3.clear();
    }
    if(hold3End2Pos.y >= 1024){
      hold3End2Pos.set(0, 0);
      holdEnd2Lane3.clear();
    }
  }
  
}
