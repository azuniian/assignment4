class HoldBeat2 {
/////variables/////
//ArrayLists
ArrayList<PVector> holdStart1Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdStart2Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid1Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid2Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid3Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid4Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid5Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid6Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid7Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid8Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid9Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdMid10Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd1Lane2 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd2Lane2 = new ArrayList<PVector>();
//PVectors
PVector hold2Start1Pos;
PVector hold2Start2Pos;
PVector mid2Note1Pos;
PVector mid2Note2Pos;
PVector mid2Note3Pos;
PVector mid2Note4Pos;
PVector mid2Note5Pos;
PVector mid2Note6Pos;
PVector mid2Note7Pos;
PVector mid2Note8Pos;
PVector mid2Note9Pos;
PVector mid2Note10Pos;
PVector hold2End1Pos;
PVector hold2End2Pos;
PVector vel;
//note qualities
PVector size;
PVector sizeMid;
color colour;
color colourMid;

  HoldBeat2(float h1, float w1, float h2, float w2, color c1, color c2){ //constructor
    rectMode(CORNER);
    colour = c1;
    colourMid = c2;
    size = new PVector(w1, h1);
    sizeMid = new PVector(w2, h2);
    vel = new PVector();
    vel.set(0, 7);
    
    hold2Start1Pos = new PVector();
    hold2Start1Pos.set(0, 0);
    hold2Start2Pos = new PVector();
    hold2Start2Pos.set(0, 0);
    mid2Note1Pos = new PVector();
    mid2Note1Pos.set(0, 0);
    mid2Note2Pos = new PVector();
    mid2Note2Pos.set(0, 0);
    mid2Note3Pos = new PVector();
    mid2Note3Pos.set(0, 0);
    mid2Note4Pos = new PVector();
    mid2Note4Pos.set(0, 0);
    mid2Note5Pos = new PVector();
    mid2Note5Pos.set(0, 0);
    mid2Note6Pos = new PVector();
    mid2Note6Pos.set(0, 0);
    mid2Note7Pos = new PVector();
    mid2Note7Pos.set(0, 0);
    mid2Note8Pos = new PVector();
    mid2Note8Pos.set(0, 0);
    mid2Note9Pos = new PVector();
    mid2Note9Pos.set(0, 0);
    mid2Note10Pos = new PVector();
    mid2Note10Pos.set(0, 0);
    hold2End1Pos = new PVector();
    hold2End1Pos.set(0, 0);
    hold2End2Pos = new PVector();
    hold2End2Pos.set(0, 0);  
  }
  
  void spawnStartBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdStart1Lane2.size() == 0){
      hold2Start1Pos.set(31, 0);
      holdStart1Lane2.add(hold2Start1Pos);
    }
    else if(holdStart2Lane2.size() == 0){
      hold2Start2Pos.set(31, 0);
      holdStart2Lane2.add(hold2Start2Pos);
    }
  }
  
  void spawnMidBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdMid1Lane2.size() == 0){
      mid2Note1Pos.set(31, 0);
      holdMid2Lane2.add(mid2Note1Pos);
    }
    else if(holdMid2Lane2.size() == 0){
      mid2Note2Pos.set(31, 0);
      holdMid2Lane2.add(mid2Note2Pos);
    }
    else if(holdMid3Lane2.size() == 0){
      mid2Note3Pos.set(31, 0);
      holdMid3Lane2.add(mid2Note3Pos);
    }
    else if(holdMid4Lane2.size() == 0){
      mid2Note4Pos.set(31, 0);
      holdMid4Lane2.add(mid2Note4Pos);
    }
    else if(holdMid5Lane2.size() == 0){
      mid2Note5Pos.set(31, 0);
      holdMid5Lane2.add(mid2Note5Pos);
    }
    else if(holdMid6Lane2.size() == 0){
      mid2Note6Pos.set(31, 0);
      holdMid6Lane2.add(mid2Note6Pos);
    }
    else if(holdMid7Lane2.size() == 0){
      mid2Note7Pos.set(31, 0);
      holdMid7Lane2.add(mid2Note7Pos);
    }
    else if(holdMid8Lane2.size() == 0){
      mid2Note8Pos.set(31, 0);
      holdMid8Lane2.add(mid2Note8Pos);
    }
    else if(holdMid9Lane2.size() == 0){
      mid2Note9Pos.set(31, 0);
      holdMid9Lane2.add(mid2Note9Pos);
    }
    else if(holdMid10Lane2.size() == 0){
      mid2Note10Pos.set(31, 0);
      holdMid10Lane2.add(mid2Note2Pos);
    }
  }
  
  void spawnEndBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdEnd1Lane2.size() == 0){
      hold2End1Pos.set(31, 0);
      holdEnd1Lane2.add(hold2End1Pos);
    }
    else if(holdEnd2Lane2.size() == 0){
      hold2End2Pos.set(31, 0);
      holdEnd2Lane2.add(hold2End2Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    //start notes
    if(holdStart1Lane2.size() != 0){
      hold2Start1Pos.add(vel);
      holdStart1Lane2.add(hold2Start1Pos);
    }
    if(holdStart2Lane2.size() != 0){
      hold2Start2Pos.add(vel);
      holdStart2Lane2.add(hold2Start2Pos);
    }
    
    //mid notes
    if(holdMid1Lane2.size() != 0){
      mid2Note1Pos.add(vel);
      holdMid1Lane2.add(mid2Note1Pos);
    }
    if(holdMid2Lane2.size() != 0){
      mid2Note2Pos.add(vel);
      holdMid2Lane2.add(mid2Note2Pos);
    }
    if(holdMid3Lane2.size() != 0){
      mid2Note3Pos.add(vel);
      holdMid3Lane2.add(mid2Note3Pos);
    }
    if(holdMid4Lane2.size() != 0){
      mid2Note4Pos.add(vel);
      holdMid4Lane2.add(mid2Note4Pos);
    }
    if(holdMid5Lane2.size() != 0){
      mid2Note5Pos.add(vel);
      holdMid5Lane2.add(mid2Note5Pos);
    }
    if(holdMid6Lane2.size() != 0){
      mid2Note6Pos.add(vel);
      holdMid6Lane2.add(mid2Note6Pos);
    }
    if(holdMid7Lane2.size() != 0){
      mid2Note7Pos.add(vel);
      holdMid7Lane2.add(mid2Note7Pos);
    }
    if(holdMid8Lane2.size() != 0){
      mid2Note8Pos.add(vel);
      holdMid8Lane2.add(mid2Note8Pos);
    }
    if(holdMid9Lane2.size() != 0){
      mid2Note9Pos.add(vel);
      holdMid9Lane2.add(mid2Note9Pos);
    }
    if(holdMid10Lane2.size() != 0){
      mid2Note10Pos.add(vel);
      holdMid10Lane2.add(mid2Note10Pos);
    }
    
    //end notes
    if(holdEnd1Lane2.size() != 0){
      hold2End1Pos.add(vel);
      holdEnd1Lane2.add(hold2End1Pos);
    }
    if(holdEnd2Lane2.size() != 0){
      hold2End2Pos.add(vel);
      holdEnd2Lane2.add(hold2End2Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    //may need to separate displays of mid, start, and end beats depending on specifics of display
    //start notes
    if(holdStart1Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(hold2Start1Pos.x, hold2Start1Pos.y, size.x, size.y);
    }
    if(holdStart2Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(hold2Start1Pos.x, hold2Start1Pos.y, size.x, size.y);
    }
    
    //mid notes
    if(holdMid1Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note1Pos.x, mid2Note1Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid2Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note2Pos.x, mid2Note2Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid3Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note3Pos.x, mid2Note3Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid4Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note4Pos.x, mid2Note4Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid5Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note5Pos.x, mid2Note5Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid6Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note6Pos.x, mid2Note6Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid7Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note7Pos.x, mid2Note7Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid8Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note8Pos.x, mid2Note8Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid9Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note9Pos.x, mid2Note9Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid10Lane2.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid2Note10Pos.x, mid2Note10Pos.y, sizeMid.x, sizeMid.y);
    }
    
    //end notes
    if(holdEnd1Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(hold2End1Pos.x, hold2End1Pos.y, size.x, size.y);
    }
    if(holdEnd2Lane2.size() != 0){
      fill(colour);
      noStroke();
      rect(hold2End1Pos.x, hold2End1Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(hold2Start1Pos.y >= 1024){
      hold2Start1Pos.set(0, 0);
      holdStart1Lane2.clear();
    }
    if(hold2Start2Pos.y >= 1024){
      hold2Start2Pos.set(0, 0);
      holdStart2Lane2.clear();
    }
    
    if(mid2Note1Pos.y >= 1024){
      mid2Note1Pos.set(0, 0);
      holdMid1Lane2.clear();
    }
    if(mid2Note2Pos.y >= 1024){
      mid2Note2Pos.set(0, 0);
      holdMid2Lane2.clear();
    }
    if(mid2Note3Pos.y >= 1024){
      mid2Note3Pos.set(0, 0);
      holdMid3Lane2.clear();
    }
    if(mid2Note4Pos.y >= 1024){
      mid2Note4Pos.set(0, 0);
      holdMid4Lane2.clear();
    }
    if(mid2Note5Pos.y >= 1024){
      mid2Note5Pos.set(0, 0);
      holdMid5Lane2.clear();
    }
    if(mid2Note6Pos.y >= 1024){
      mid2Note6Pos.set(0, 0);
      holdMid6Lane2.clear();
    }
    if(mid2Note7Pos.y >= 1024){
      mid2Note7Pos.set(0, 0);
      holdMid7Lane2.clear();
    }
    if(mid2Note8Pos.y >= 1024){
      mid2Note8Pos.set(0, 0);
      holdMid8Lane2.clear();
    }
    if(mid2Note9Pos.y >= 1024){
      mid2Note9Pos.set(0, 0);
      holdMid9Lane2.clear();
    }
    if(mid2Note10Pos.y >= 1024){
      mid2Note10Pos.set(0, 0);
      holdMid10Lane2.clear();
    }
    
    if(hold2End1Pos.y >= 1024){
      hold2End1Pos.set(0, 0);
      holdEnd1Lane2.clear();
    }
    if(hold2End2Pos.y >= 1024){
      hold2End2Pos.set(0, 0);
      holdEnd2Lane2.clear();
    }
  }
  
}
