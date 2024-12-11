class HoldBeat1 {
/////variables/////
//ArrayLists
ArrayList<PVector> holdStart1Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdStart2Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid1Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid2Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid3Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid4Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid5Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid6Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid7Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid8Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid9Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdMid10Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd1Lane1 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd2Lane1 = new ArrayList<PVector>();
//PVectors
PVector hold1Start1Pos;
PVector hold1Start2Pos;
PVector mid1Note1Pos;
PVector mid1Note2Pos;
PVector mid1Note3Pos;
PVector mid1Note4Pos;
PVector mid1Note5Pos;
PVector mid1Note6Pos;
PVector mid1Note7Pos;
PVector mid1Note8Pos;
PVector mid1Note9Pos;
PVector mid1Note10Pos;
PVector hold1End1Pos;
PVector hold1End2Pos;
PVector vel;
//note qualities
PVector size;
PVector sizeMid;
color colour;
color colourMid;

  HoldBeat1(float h1, float w1, float h2, float w2, color c1, color c2){ //constructor
    rectMode(CORNER);
    colour = c1;
    colourMid = c2;
    size = new PVector(w1, h1);
    sizeMid = new PVector(w2, h2);
    vel = new PVector();
    vel.set(0, 50.625);
    
    hold1Start1Pos = new PVector();
    hold1Start1Pos.set(0, 0);
    hold1Start2Pos = new PVector();
    hold1Start2Pos.set(0, 0);
    mid1Note1Pos = new PVector();
    mid1Note1Pos.set(0, 0);
    mid1Note2Pos = new PVector();
    mid1Note2Pos.set(0, 0);
    mid1Note3Pos = new PVector();
    mid1Note3Pos.set(0, 0);
    mid1Note4Pos = new PVector();
    mid1Note4Pos.set(0, 0);
    mid1Note5Pos = new PVector();
    mid1Note5Pos.set(0, 0);
    mid1Note6Pos = new PVector();
    mid1Note6Pos.set(0, 0);
    mid1Note7Pos = new PVector();
    mid1Note7Pos.set(0, 0);
    mid1Note8Pos = new PVector();
    mid1Note8Pos.set(0, 0);
    mid1Note9Pos = new PVector();
    mid1Note9Pos.set(0, 0);
    mid1Note10Pos = new PVector();
    mid1Note10Pos.set(0, 0);
    hold1End1Pos = new PVector();
    hold1End1Pos.set(0, 0);
    hold1End2Pos = new PVector();
    hold1End2Pos.set(0, 0);  
  }
  
  void spawnStartBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdStart1Lane1.size() == 0){
      hold1Start1Pos.set(31, 0);
      holdStart1Lane1.add(hold1Start1Pos);
    }
    else if(holdStart2Lane1.size() == 0){
      hold1Start2Pos.set(31, 0);
      holdStart2Lane1.add(hold1Start2Pos);
    }
  }
  
  void spawnMidBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdMid1Lane1.size() == 0){
      mid1Note1Pos.set(31, 0);
      holdMid1Lane1.add(mid1Note1Pos);
    }
    else if(holdMid2Lane1.size() == 0){
      mid1Note2Pos.set(31, 0);
      holdMid2Lane1.add(mid1Note2Pos);
    }
    else if(holdMid3Lane1.size() == 0){
      mid1Note3Pos.set(31, 0);
      holdMid3Lane1.add(mid1Note3Pos);
    }
    else if(holdMid4Lane1.size() == 0){
      mid1Note4Pos.set(31, 0);
      holdMid4Lane1.add(mid1Note4Pos);
    }
    else if(holdMid5Lane1.size() == 0){
      mid1Note5Pos.set(31, 0);
      holdMid5Lane1.add(mid1Note5Pos);
    }
    else if(holdMid6Lane1.size() == 0){
      mid1Note6Pos.set(31, 0);
      holdMid6Lane1.add(mid1Note6Pos);
    }
    else if(holdMid7Lane1.size() == 0){
      mid1Note7Pos.set(31, 0);
      holdMid7Lane1.add(mid1Note7Pos);
    }
    else if(holdMid8Lane1.size() == 0){
      mid1Note8Pos.set(31, 0);
      holdMid8Lane1.add(mid1Note8Pos);
    }
    else if(holdMid9Lane1.size() == 0){
      mid1Note9Pos.set(31, 0);
      holdMid9Lane1.add(mid1Note9Pos);
    }
    else if(holdMid10Lane1.size() == 0){
      mid1Note10Pos.set(31, 0);
      holdMid10Lane1.add(mid1Note2Pos);
    }
  }
  
  void spawnEndBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdEnd1Lane1.size() == 0){
      hold1End1Pos.set(31, 0);
      holdEnd1Lane1.add(hold1End1Pos);
    }
    else if(holdEnd2Lane1.size() == 0){
      hold1End2Pos.set(31, 0);
      holdEnd2Lane1.add(hold1End2Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    //start notes
    if(holdStart1Lane1.size() != 0){
      hold1Start1Pos.add(vel);
      holdStart1Lane1.add(hold1Start1Pos);
    }
    if(holdStart2Lane1.size() != 0){
      hold1Start2Pos.add(vel);
      holdStart2Lane1.add(hold1Start2Pos);
    }
    
    //mid notes
    if(holdMid1Lane1.size() != 0){
      mid1Note1Pos.add(vel);
      holdMid1Lane1.add(mid1Note1Pos);
    }
    if(holdMid2Lane1.size() != 0){
      mid1Note2Pos.add(vel);
      holdMid2Lane1.add(mid1Note2Pos);
    }
    if(holdMid3Lane1.size() != 0){
      mid1Note3Pos.add(vel);
      holdMid3Lane1.add(mid1Note3Pos);
    }
    if(holdMid4Lane1.size() != 0){
      mid1Note4Pos.add(vel);
      holdMid4Lane1.add(mid1Note4Pos);
    }
    if(holdMid5Lane1.size() != 0){
      mid1Note5Pos.add(vel);
      holdMid5Lane1.add(mid1Note5Pos);
    }
    if(holdMid6Lane1.size() != 0){
      mid1Note6Pos.add(vel);
      holdMid6Lane1.add(mid1Note6Pos);
    }
    if(holdMid7Lane1.size() != 0){
      mid1Note7Pos.add(vel);
      holdMid7Lane1.add(mid1Note7Pos);
    }
    if(holdMid8Lane1.size() != 0){
      mid1Note8Pos.add(vel);
      holdMid8Lane1.add(mid1Note8Pos);
    }
    if(holdMid9Lane1.size() != 0){
      mid1Note9Pos.add(vel);
      holdMid9Lane1.add(mid1Note9Pos);
    }
    if(holdMid10Lane1.size() != 0){
      mid1Note10Pos.add(vel);
      holdMid10Lane1.add(mid1Note10Pos);
    }
    
    //end notes
    if(holdEnd1Lane1.size() != 0){
      hold1End1Pos.add(vel);
      holdEnd1Lane1.add(hold1End1Pos);
    }
    if(holdEnd2Lane1.size() != 0){
      hold1End2Pos.add(vel);
      holdEnd2Lane1.add(hold1End2Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    //may need to separate displays of mid, start, and end beats depending on specifics of display
    //start notes
    if(holdStart1Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(hold1Start1Pos.x, hold1Start1Pos.y, size.x, size.y);
    }
    if(holdStart2Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(hold1Start1Pos.x, hold1Start1Pos.y, size.x, size.y);
    }
    
    //mid notes
    if(holdMid1Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note1Pos.x, mid1Note1Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid2Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note2Pos.x, mid1Note2Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid3Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note3Pos.x, mid1Note3Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid4Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note4Pos.x, mid1Note4Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid5Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note5Pos.x, mid1Note5Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid6Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note6Pos.x, mid1Note6Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid7Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note7Pos.x, mid1Note7Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid8Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note8Pos.x, mid1Note8Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid9Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note9Pos.x, mid1Note9Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid10Lane1.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid1Note10Pos.x, mid1Note10Pos.y, sizeMid.x, sizeMid.y);
    }
    
    //end notes
    if(holdEnd1Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(hold1End1Pos.x, hold1End1Pos.y, size.x, size.y);
    }
    if(holdEnd2Lane1.size() != 0){
      fill(colour);
      noStroke();
      rect(hold1End1Pos.x, hold1End1Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(hold1Start1Pos.y >= 1024){
      hold1Start1Pos.set(0, 0);
      holdStart1Lane1.clear();
    }
    if(hold1Start2Pos.y >= 1024){
      hold1Start2Pos.set(0, 0);
      holdStart2Lane1.clear();
    }
    
    if(mid1Note1Pos.y >= 1024){
      mid1Note1Pos.set(0, 0);
      holdMid1Lane1.clear();
    }
    if(mid1Note2Pos.y >= 1024){
      mid1Note2Pos.set(0, 0);
      holdMid2Lane1.clear();
    }
    if(mid1Note3Pos.y >= 1024){
      mid1Note3Pos.set(0, 0);
      holdMid3Lane1.clear();
    }
    if(mid1Note4Pos.y >= 1024){
      mid1Note4Pos.set(0, 0);
      holdMid4Lane1.clear();
    }
    if(mid1Note5Pos.y >= 1024){
      mid1Note5Pos.set(0, 0);
      holdMid5Lane1.clear();
    }
    if(mid1Note6Pos.y >= 1024){
      mid1Note6Pos.set(0, 0);
      holdMid6Lane1.clear();
    }
    if(mid1Note7Pos.y >= 1024){
      mid1Note7Pos.set(0, 0);
      holdMid7Lane1.clear();
    }
    if(mid1Note8Pos.y >= 1024){
      mid1Note8Pos.set(0, 0);
      holdMid8Lane1.clear();
    }
    if(mid1Note9Pos.y >= 1024){
      mid1Note9Pos.set(0, 0);
      holdMid9Lane1.clear();
    }
    if(mid1Note10Pos.y >= 1024){
      mid1Note10Pos.set(0, 0);
      holdMid10Lane1.clear();
    }
    
    if(hold1End1Pos.y >= 1024){
      hold1End1Pos.set(0, 0);
      holdEnd1Lane1.clear();
    }
    if(hold1End2Pos.y >= 1024){
      hold1End2Pos.set(0, 0);
      holdEnd2Lane1.clear();
    }
  }
  
}
