class HoldBeat4 {
/////variables/////
//ArrayLists
ArrayList<PVector> holdStart1Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdStart2Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid1Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid2Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid3Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid4Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid5Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid6Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid7Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid8Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid9Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdMid10Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd1Lane4 = new ArrayList<PVector>();
ArrayList<PVector> holdEnd2Lane4 = new ArrayList<PVector>();
//PVectors
PVector hold4Start1Pos;
PVector hold4Start2Pos;
PVector mid4Note1Pos;
PVector mid4Note2Pos;
PVector mid4Note3Pos;
PVector mid4Note4Pos;
PVector mid4Note5Pos;
PVector mid4Note6Pos;
PVector mid4Note7Pos;
PVector mid4Note8Pos;
PVector mid4Note9Pos;
PVector mid4Note10Pos;
PVector hold4End1Pos;
PVector hold4End2Pos;
PVector vel;
//note qualities
PVector size;
PVector sizeMid;
color colour;
color colourMid;

  HoldBeat4(float h1, float w1, float h2, float w2, color c1, color c2){ //constructor
    rectMode(CORNER);
    colour = c1;
    colourMid = c2;
    size = new PVector(w1, h1);
    sizeMid = new PVector(w2, h2);
    vel = new PVector();
    vel.set(0, 50.625);
    
    hold4Start1Pos = new PVector();
    hold4Start1Pos.set(0, 0);
    hold4Start2Pos = new PVector();
    hold4Start2Pos.set(0, 0);
    mid4Note1Pos = new PVector();
    mid4Note1Pos.set(0, 0);
    mid4Note2Pos = new PVector();
    mid4Note2Pos.set(0, 0);
    mid4Note3Pos = new PVector();
    mid4Note3Pos.set(0, 0);
    mid4Note4Pos = new PVector();
    mid4Note4Pos.set(0, 0);
    mid4Note5Pos = new PVector();
    mid4Note5Pos.set(0, 0);
    mid4Note6Pos = new PVector();
    mid4Note6Pos.set(0, 0);
    mid4Note7Pos = new PVector();
    mid4Note7Pos.set(0, 0);
    mid4Note8Pos = new PVector();
    mid4Note8Pos.set(0, 0);
    mid4Note9Pos = new PVector();
    mid4Note9Pos.set(0, 0);
    mid4Note10Pos = new PVector();
    mid4Note10Pos.set(0, 0);
    hold4End1Pos = new PVector();
    hold4End1Pos.set(0, 0);
    hold4End2Pos = new PVector();
    hold4End2Pos.set(0, 0);  
  }
  
  void spawnStartBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdStart1Lane4.size() == 0){
      hold4Start1Pos.set(31, 0);
      holdStart1Lane4.add(hold4Start1Pos);
    }
    else if(holdStart2Lane4.size() == 0){
      hold4Start2Pos.set(31, 0);
      holdStart2Lane4.add(hold4Start2Pos);
    }
  }
  
  void spawnMidBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdMid1Lane4.size() == 0){
      mid4Note1Pos.set(31, 0);
      holdMid2Lane4.add(mid4Note1Pos);
    }
    else if(holdMid2Lane4.size() == 0){
      mid4Note2Pos.set(31, 0);
      holdMid2Lane4.add(mid4Note2Pos);
    }
    else if(holdMid3Lane4.size() == 0){
      mid4Note3Pos.set(31, 0);
      holdMid3Lane4.add(mid4Note3Pos);
    }
    else if(holdMid4Lane4.size() == 0){
      mid4Note4Pos.set(31, 0);
      holdMid4Lane4.add(mid4Note4Pos);
    }
    else if(holdMid5Lane4.size() == 0){
      mid4Note5Pos.set(31, 0);
      holdMid5Lane4.add(mid4Note5Pos);
    }
    else if(holdMid6Lane4.size() == 0){
      mid4Note6Pos.set(31, 0);
      holdMid6Lane4.add(mid4Note6Pos);
    }
    else if(holdMid7Lane4.size() == 0){
      mid4Note7Pos.set(31, 0);
      holdMid7Lane4.add(mid4Note7Pos);
    }
    else if(holdMid8Lane4.size() == 0){
      mid4Note8Pos.set(31, 0);
      holdMid8Lane4.add(mid4Note8Pos);
    }
    else if(holdMid9Lane4.size() == 0){
      mid4Note9Pos.set(31, 0);
      holdMid9Lane4.add(mid4Note9Pos);
    }
    else if(holdMid10Lane4.size() == 0){
      mid4Note10Pos.set(31, 0);
      holdMid10Lane4.add(mid4Note2Pos);
    }
  }
  
  void spawnEndBeat(){
    //assign it a pvector for position in pvector arraylist
    if(holdEnd1Lane4.size() == 0){
      hold4End1Pos.set(31, 0);
      holdEnd1Lane4.add(hold4End1Pos);
    }
    else if(holdEnd2Lane4.size() == 0){
      hold4End2Pos.set(31, 0);
      holdEnd2Lane4.add(hold4End2Pos);
    }
  }
  
  void scrollNotes(){
    //add gravity/velocity to current position pvector for each note
    //add new value to pvector arraylist
    //start notes
    if(holdStart1Lane4.size() != 0){
      hold4Start1Pos.add(vel);
      holdStart1Lane4.add(hold4Start1Pos);
    }
    if(holdStart2Lane4.size() != 0){
      hold4Start2Pos.add(vel);
      holdStart2Lane4.add(hold4Start2Pos);
    }
    
    //mid notes
    if(holdMid1Lane4.size() != 0){
      mid4Note1Pos.add(vel);
      holdMid1Lane4.add(mid4Note1Pos);
    }
    if(holdMid2Lane4.size() != 0){
      mid4Note2Pos.add(vel);
      holdMid2Lane4.add(mid4Note2Pos);
    }
    if(holdMid3Lane4.size() != 0){
      mid4Note3Pos.add(vel);
      holdMid3Lane4.add(mid4Note3Pos);
    }
    if(holdMid4Lane4.size() != 0){
      mid4Note4Pos.add(vel);
      holdMid4Lane4.add(mid4Note4Pos);
    }
    if(holdMid5Lane4.size() != 0){
      mid4Note5Pos.add(vel);
      holdMid5Lane4.add(mid4Note5Pos);
    }
    if(holdMid6Lane4.size() != 0){
      mid4Note6Pos.add(vel);
      holdMid6Lane4.add(mid4Note6Pos);
    }
    if(holdMid7Lane4.size() != 0){
      mid4Note7Pos.add(vel);
      holdMid7Lane4.add(mid4Note7Pos);
    }
    if(holdMid8Lane4.size() != 0){
      mid4Note8Pos.add(vel);
      holdMid8Lane4.add(mid4Note8Pos);
    }
    if(holdMid9Lane4.size() != 0){
      mid4Note9Pos.add(vel);
      holdMid9Lane4.add(mid4Note9Pos);
    }
    if(holdMid10Lane4.size() != 0){
      mid4Note10Pos.add(vel);
      holdMid10Lane4.add(mid4Note10Pos);
    }
    
    //end notes
    if(holdEnd1Lane4.size() != 0){
      hold4End1Pos.add(vel);
      holdEnd1Lane4.add(hold4End1Pos);
    }
    if(holdEnd2Lane4.size() != 0){
      hold4End2Pos.add(vel);
      holdEnd2Lane4.add(hold4End2Pos);
    }
  }
  
  void display(){
    //display whole arraylist OR display notes within the frame with conditionals 
    //(i.e. if(positiony > 0 && positiony < 1080){display})
    //may need to separate displays of mid, start, and end beats depending on specifics of display
    //start notes
    if(holdStart1Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(hold4Start1Pos.x, hold4Start1Pos.y, size.x, size.y);
    }
    if(holdStart2Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(hold4Start1Pos.x, hold4Start1Pos.y, size.x, size.y);
    }
    
    //mid notes
    if(holdMid1Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note1Pos.x, mid4Note1Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid2Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note2Pos.x, mid4Note2Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid3Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note3Pos.x, mid4Note3Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid4Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note4Pos.x, mid4Note4Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid5Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note5Pos.x, mid4Note5Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid6Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note6Pos.x, mid4Note6Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid7Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note7Pos.x, mid4Note7Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid8Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note8Pos.x, mid4Note8Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid9Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note9Pos.x, mid4Note9Pos.y, sizeMid.x, sizeMid.y);
    }
    if(holdMid10Lane4.size() != 0){
      fill(colourMid);
      noStroke();
      rect(mid4Note10Pos.x, mid4Note10Pos.y, sizeMid.x, sizeMid.y);
    }
    
    //end notes
    if(holdEnd1Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(hold4End1Pos.x, hold4End1Pos.y, size.x, size.y);
    }
    if(holdEnd2Lane4.size() != 0){
      fill(colour);
      noStroke();
      rect(hold4End1Pos.x, hold4End1Pos.y, size.x, size.y);
    }
  }
  
  void resetNote(){
    if(hold4Start1Pos.y >= 1024){
      hold4Start1Pos.set(0, 0);
      holdStart1Lane4.clear();
    }
    if(hold4Start2Pos.y >= 1024){
      hold4Start2Pos.set(0, 0);
      holdStart2Lane4.clear();
    }
    
    if(mid4Note1Pos.y >= 1024){
      mid4Note1Pos.set(0, 0);
      holdMid1Lane4.clear();
    }
    if(mid4Note2Pos.y >= 1024){
      mid4Note2Pos.set(0, 0);
      holdMid2Lane4.clear();
    }
    if(mid4Note3Pos.y >= 1024){
      mid4Note3Pos.set(0, 0);
      holdMid3Lane4.clear();
    }
    if(mid4Note4Pos.y >= 1024){
      mid4Note4Pos.set(0, 0);
      holdMid4Lane4.clear();
    }
    if(mid4Note5Pos.y >= 1024){
      mid4Note5Pos.set(0, 0);
      holdMid5Lane4.clear();
    }
    if(mid4Note6Pos.y >= 1024){
      mid4Note6Pos.set(0, 0);
      holdMid6Lane4.clear();
    }
    if(mid4Note7Pos.y >= 1024){
      mid4Note7Pos.set(0, 0);
      holdMid7Lane4.clear();
    }
    if(mid4Note8Pos.y >= 1024){
      mid4Note8Pos.set(0, 0);
      holdMid8Lane4.clear();
    }
    if(mid4Note9Pos.y >= 1024){
      mid4Note9Pos.set(0, 0);
      holdMid9Lane4.clear();
    }
    if(mid4Note10Pos.y >= 1024){
      mid4Note10Pos.set(0, 0);
      holdMid10Lane4.clear();
    }
    
    if(hold4End1Pos.y >= 1024){
      hold4End1Pos.set(0, 0);
      holdEnd1Lane4.clear();
    }
    if(hold4End2Pos.y >= 1024){
      hold4End2Pos.set(0, 0);
      holdEnd2Lane4.clear();
    }
  }
  
}
